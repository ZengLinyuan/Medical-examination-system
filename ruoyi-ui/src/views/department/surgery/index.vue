<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学号" prop="studentId">
        <el-input
          v-model="queryParams.studentId"
          placeholder="请输入学号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="诊断时间" prop="diagnosisTime">
        <el-date-picker clearable size="small"
          v-model="queryParams.diagnosisTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择诊断时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="医生审查" prop="doctorAudit">
        <el-input
          v-model="queryParams.doctorAudit"
          placeholder="请输入医生审查"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="领导审查" prop="leaderAudit">
        <el-input
          v-model="queryParams.leaderAudit"
          placeholder="请输入领导审查"
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
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['department:surgery:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['department:surgery:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['department:surgery:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
		  :loading="exportLoading"
          @click="handleExport"
          v-hasPermi="['department:surgery:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="surgeryList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="学号" align="center" prop="studentId" />
      <el-table-column label="诊断时间" align="center" prop="diagnosisTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.diagnosisTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="医生审查" align="center" prop="doctorAudit" />
      <el-table-column label="领导审查" align="center" prop="leaderAudit" />
      <el-table-column label="提交时间" align="center" prop="submitTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.submitTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['department:surgery:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['department:surgery:remove']"
          >删除</el-button>
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

    <!-- 添加或修改外科对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="诊断时间" prop="diagnosisTime">
          <el-date-picker clearable size="small"
            v-model="form.diagnosisTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择诊断时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="身长" prop="height">
          <el-input v-model="form.height" placeholder="请输入身长" />
        </el-form-item>
        <el-form-item label="腰围" prop="waist">
          <el-input v-model="form.waist" placeholder="请输入腰围" />
        </el-form-item>
        <el-form-item label="体重" prop="weight">
          <el-input v-model="form.weight" placeholder="请输入体重" />
        </el-form-item>
        <el-form-item label="皮肤" prop="skin">
          <el-input v-model="form.skin" placeholder="请输入皮肤" />
        </el-form-item>
        <el-form-item label="淋巴" prop="lymph">
          <el-input v-model="form.lymph" placeholder="请输入淋巴" />
        </el-form-item>
        <el-form-item label="甲状腺" prop="thyroid">
          <el-input v-model="form.thyroid" placeholder="请输入甲状腺" />
        </el-form-item>
        <el-form-item label="脊柱" prop="spine">
          <el-input v-model="form.spine" placeholder="请输入脊柱" />
        </el-form-item>
        <el-form-item label="四肢" prop="limb">
          <el-input v-model="form.limb" placeholder="请输入四肢" />
        </el-form-item>
        <el-form-item label="关节" prop="joint">
          <el-input v-model="form.joint" placeholder="请输入关节" />
        </el-form-item>
        <el-form-item label="平跖足" prop="flatFeet">
          <el-input v-model="form.flatFeet" placeholder="请输入平跖足" />
        </el-form-item>
        <el-form-item label="其它" prop="other">
          <el-input v-model="form.other" placeholder="请输入其它" />
        </el-form-item>
        <el-form-item label="医生意见" prop="doctorOpinion">
          <el-input v-model="form.doctorOpinion" placeholder="请输入医生意见" />
        </el-form-item>
        <el-form-item label="医生编号" prop="doctorId">
          <el-input v-model="form.doctorId" placeholder="请输入医生编号" />
        </el-form-item>
        <el-form-item label="医生审查" prop="doctorAudit">
          <el-input v-model="form.doctorAudit" placeholder="请输入医生审查" />
        </el-form-item>
        <el-form-item label="领导审查" prop="leaderAudit">
          <el-input v-model="form.leaderAudit" placeholder="请输入领导审查" />
        </el-form-item>
        <el-form-item label="提交时间" prop="submitTime">
          <el-date-picker clearable size="small"
            v-model="form.submitTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择提交时间">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listSurgery, getSurgery, delSurgery, addSurgery, updateSurgery, exportSurgery } from "@/api/department/surgery";

export default {
  name: "Surgery",
  components: {
  },
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
      // 外科表格数据
      surgeryList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        studentId: null,
        diagnosisTime: null,
        doctorAudit: null,
        leaderAudit: null,
        submitTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        diagnosisTime: [
          { required: true, message: "诊断时间不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询外科列表 */
    getList() {
      this.loading = true;
      listSurgery(this.queryParams).then(response => {
        this.surgeryList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        studentId: null,
        diagnosisTime: null,
        height: null,
        waist: null,
        weight: null,
        skin: null,
        lymph: null,
        thyroid: null,
        spine: null,
        limb: null,
        joint: null,
        flatFeet: null,
        other: null,
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
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加外科";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const studentId = row.studentId || this.ids
      getSurgery(studentId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改外科";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.studentId != null) {
            updateSurgery(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSurgery(this.form).then(response => {
              this.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const studentIds = row.studentId || this.ids;
      this.$confirm('是否确认删除外科编号为"' + studentIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delSurgery(studentIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有外科数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(() => {
          this.exportLoading = true;
          return exportSurgery(queryParams);
        }).then(response => {
          this.download(response.msg);
          this.exportLoading = false;
        }).catch(() => {});
    }
  }
};
</script>
