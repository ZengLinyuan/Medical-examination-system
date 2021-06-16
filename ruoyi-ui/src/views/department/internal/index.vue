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
      <el-form-item label="负责医生审查" prop="doctorAudit">
        <el-input
          v-model="queryParams.doctorAudit"
          placeholder="请输入负责医生审查"
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
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['department:internal:edit']"
        >修改</el-button>
      </el-col>

      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          :loading="exportLoading"
          @click="handleExport"
          v-hasPermi="['department:internal:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="internalList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="学号" align="center" prop="studentId" />
      <el-table-column label="诊断时间" align="center" prop="diagnosisTime" />
      <el-table-column label="负责医生编号" align="center" prop="doctorId" />
      <el-table-column label="负责医生审查" align="center" prop="doctorAudit" />
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
            v-hasPermi="['department:internal:edit']"
          >修改</el-button>
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

    <!-- 添加或修改内科对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="发育营养" prop="developmentalNutrition">
          <el-input v-model="form.developmentalNutrition" placeholder="请输入发育营养" />
        </el-form-item>
        <el-form-item label="神经及精神" prop="nervesAndSpirits">
          <el-input v-model="form.nervesAndSpirits" placeholder="请输入神经及精神" />
        </el-form-item>
        <el-form-item label="肺及呼吸道" prop="lungAndRespiratoryTract">
          <el-input v-model="form.lungAndRespiratoryTract" placeholder="请输入肺及呼吸道" />
        </el-form-item>
        <el-form-item label="心脏及血管" prop="heartAndBloodVessels">
          <el-input v-model="form.heartAndBloodVessels" placeholder="请输入心脏及血管" />
        </el-form-item>
        <el-form-item label="肝" prop="liver">
          <el-input v-model="form.liver" placeholder="请输入肝" />
        </el-form-item>
        <el-form-item label="脾" prop="spleen">
          <el-input v-model="form.spleen" placeholder="请输入脾" />
        </el-form-item>
        <el-form-item label="其他" prop="other">
          <el-input v-model="form.other" placeholder="请输入其他" />
        </el-form-item>
        <el-form-item label="医生意见" prop="doctorOpinion">
          <el-input v-model="form.doctorOpinion" placeholder="请输入医生意见" />
        </el-form-item>
<!--        <el-form-item label="负责医生编号" prop="doctorId">-->
<!--          <el-input v-model="form.doctorId" placeholder="请输入负责医生编号" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="负责医生审查" prop="doctorAudit">-->
<!--          <el-input v-model="form.doctorAudit" placeholder="请输入负责医生审查" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="领导审查" prop="leaderAudit">-->
<!--          <el-input v-model="form.leaderAudit" placeholder="请输入领导审查" />-->
<!--        </el-form-item>-->
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
import { listInternal, getInternal, delInternal, addInternal, updateInternal, exportInternal } from "@/api/department/internal";

export default {
  name: "Internal",
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
      // 内科表格数据
      internalList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        studentId: null,
        doctorAudit: null,
        leaderAudit: null,
        submitTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询内科列表 */
    getList() {
      this.loading = true;
      listInternal(this.queryParams).then(response => {
        this.internalList = response.rows;
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
        developmentalNutrition: null,
        nervesAndSpirits: null,
        lungAndRespiratoryTract: null,
        heartAndBloodVessels: null,
        liver: null,
        spleen: null,
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
      this.title = "添加内科";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const studentId = row.studentId || this.ids
      getInternal(studentId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改内科";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.studentId != null) {
            updateInternal(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInternal(this.form).then(response => {
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
      this.$confirm('是否确认删除内科编号为"' + studentIds + '"的数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(function() {
        return delInternal(studentIds);
      }).then(() => {
        this.getList();
        this.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有内科数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.exportLoading = true;
        return exportInternal(queryParams);
      }).then(response => {
        this.download(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    }
  }
};
</script>
