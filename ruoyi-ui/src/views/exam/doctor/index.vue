<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学院" prop="college">
        <el-input
          v-model="queryParams.college"
          placeholder="请输入学院"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="专业" prop="major">
        <el-input
          v-model="queryParams.major"
          placeholder="请输入专业"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="班级" prop="classroom">
        <el-input
          v-model="queryParams.classroom"
          placeholder="请输入班级"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学号" prop="studentId">
        <el-input
          v-model="queryParams.studentId"
          placeholder="请输入学号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="提交时间" prop="submitTime">
        <el-date-picker clearable size="small"
                        v-model="queryParams.submitTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="选择提交时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <!--      <router-link :to="'/leader/form/detail/' + scope.row.studentId">-->
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-edit"
          size="mini"
          @click="handleUpdate"
          v-hasPermi="['eye:ophthalmic:edit']"
        >查看</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleBack"
          v-hasPermi="['eye:ophthalmic:remove']"
        >驳回</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="ophthalmicList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="50" align="center" />
      <el-table-column label="学号" align="center" prop="id" />
      <el-table-column label="体检时间" align="center" prop="submitTimeLeader" type="date" format="yyyy-MM-dd" width="180" />
      <el-table-column label="姓名" align="center" prop="name" />
      <el-table-column label="学院" align="center" prop="college" />
      <el-table-column label="专业" align="center" prop="major" />
      <el-table-column label="负责医生审查" align="center" prop="doctorAudit" />
      <el-table-column label="院长审查" align="center" prop="leaderAudit" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['eye:ophthalmic:edit']"
          >查看</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleBack(scope.row)"
            v-hasPermi="['eye:ophthalmic:remove']"
          >驳回</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改眼科对话框 -->
    <!--    <el-dialog   >-->
    <el-dialog :title="title" :visible.sync="openDept"  width="500px" append-to-body >
      <el-row :gutter="15">
        <el-form ref="elForm"  :rules="rules" size="medium" label-width="100px">
          <el-col :span="12">
            <el-form-item label="科室" prop="dept_name">
              <el-select v-model="formData.deptName" placeholder="请选择科室" clearable :style="{width: '100%'}">
                <el-option v-for="(item, index) in deptNameOptions" :key="index" :label="item.label"
                           :value="item.value" :disabled="item.disabled"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-form>
      </el-row>
      <div slot="footer">
        <el-button @click="cancel">取消</el-button>
        <el-button type="primary" @click="submitForm">确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>



<script>
  import {
    listOphthalmic,
    getOphthalmic,
    delOphthalmic,
    addOphthalmic,
    updateOphthalmic,
  } from "@/api/eye/ophthalmic";
  import {getRole} from "@/api/system/role";
  import {backStuForm, getStuDoctorForm} from "@/api/health/form";
  import {editDepartmentDoctorAudit} from "../../../api/leader/leader";

  export default {
    name: "Ophthalmic",
    components: {},
    data() {
      return {
        // 遮罩层
        loading: true,
        // 导出遮罩层
        exportLoading: false,
        // 选中数组
        ids: [],
        // 非单个禁用
        single: true,
        // 非多个禁用
        multiple: true,
        // 显示搜索条件
        showSearch: true,
        // 总条数
        total: 0,
        // 眼科表格数据
        ophthalmicList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        openDept: false,
        formData:{
          studentId:'',
          diagnosisTime:'',
          deptName: '',
        },
        deptNameOptions: [{
          "label": "眼科",
          "value": 101
        }, {
          "label": "耳鼻喉科",
          "value": 103
        }, {
          "label": "口腔科",
          "value": 105
        }, {
          "label": "外科",
          "value": 104
        }, {
          "label": "血压脉搏科",
          "value": 107
        }, {
          "label": "内科",
          "value": 106
        }, {
          "label": "化验科",
          "value": 102
        }, {
          "label": "胸部放射科",
          "value": 108
        }, {
          "label": "其他科",
          "value": 109
        }],

        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          id: null,
          submitTimeLeader: null,
          name:null,
          college:null,
          major:null,
          doctorAudit: null,
          leaderAudit: null,
        },

        // 表单参数
        form: {},
        // 表单校验
        rules: {}
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询眼科列表 */
      getList() {
        this.loading = true;
        getStuDoctorForm(this.queryParams).then(response => {
          this.ophthalmicList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      },
      // 取消按钮
      cancel() {
        this.openDept = false;
        this.reset();
      },
      // 表单重置
      reset() {
        this.form = {
          studentId: null,
          diagnosisTime: null,
          sightLeftNoglasses: null,
          sightRightNoglasses: null,
          sightLeftWithglasses: null,
          sightRightWithglasses: null,
          eyeIllness: null,
          colorVisionRed: null,
          colorVisionGreen: null,
          colorVisionPurple: null,
          colorVisionBlue: null,
          colorVisionYellow: null,
          doctorOpinion: null,
          doctorId: null,
          doctorAudit: null,
          leaderAudit: null,
          submitTime: null
        };
        this.resetForm("form");
      },
      /** 搜索按钮操作 */
      handleQuery() {
        this.queryParams.pageNum = 1;
        this.getList();
      },
      /** 重置按钮操作 */
      resetQuery() {
        this.resetForm("queryForm");
        this.handleQuery();
      },
      // 多选框选中数据
      handleSelectionChange(selection) {
        this.ids = selection.map(item => item.studentId)
        this.single = selection.length !== 1
        this.multiple = !selection.length
      },
      /** 查看按钮操作 */
      handleUpdate(row) {
        this.reset();
        const studentId = row.id || this.ids
        const submitTimeLeader = row.submitTimeLeader || this.ids
        this.$router.push({
          path: '/leader/leader-detail',
          query: {
            studentId: studentId,
            diagnosisTime: submitTimeLeader,
          }
        }).catch(() => {
        });
      },
      /** 提交按钮 */
      submitForm() {
        editDepartmentDoctorAudit(this.formData).then(response => {
          this.msgSuccess("驳回成功");
          this.openDept = false;
          this.getList();
        });
        /*this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.studentId != null) {
              updateOphthalmic(this.form).then(response => {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addOphthalmic(this.form).then(response => {
                this.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }
          }
        });*/
      },
      /** 驳回按钮操作 */
      handleBack(row) {
        this.formData.studentId = row.id;
        this.formData.diagnosisTime = row.submitTimeLeader;
        this.openDept = true;
        this.title = "选择驳回部门";
      }
    }
  };
</script>
