<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="负责医生" prop="doctorId">
        <el-input
          v-model="queryParams.doctorId"
          placeholder="请输入负责医生编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="日期" prop="submitTimeDoctor">
        <el-date-picker clearable size="small"
          v-model="queryParams.submitTimeDoctor"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="院长编号" prop="leaderId">
        <el-input
          v-model="queryParams.leaderId"
          placeholder="请输入院长编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="提交时间" prop="submitTimeLeader">
        <el-date-picker clearable size="small"
          v-model="queryParams.submitTimeLeader"
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
          v-hasPermi="['health:form:edit']"
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
          v-hasPermi="['health:form:remove']"
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
          v-hasPermi="['health:form:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="formList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="学生学号" align="center" prop="studentId" />
      <el-table-column label="体检时间" align="center" prop="inspectorTime" />
      <el-table-column label="检查结论" align="center" prop="conclusions" />
      <el-table-column label="负责医生审查" align="center" prop="doctorAudit" />
      <el-table-column label="负责医生编号" align="center" prop="doctorId" />
      <el-table-column label="负责医生提交时间" align="center" prop="submitTimeDoctor" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.submitTimeDoctor, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="医院意见" align="center" prop="hospitalOpinion" />
      <el-table-column label="院长审查" align="center" prop="leaderAudit" />
      <el-table-column label="院长编号" align="center" prop="leaderId" />
      <el-table-column label="最终提交时间" align="center" prop="submitTimeLeader" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.submitTimeLeader, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['health:form:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['health:form:remove']"
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

    <!-- 添加或修改体检总对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="检查结论" prop="conclusions">
          <el-input v-model="form.conclusions" placeholder="请输入检查结论" />
        </el-form-item>
        <el-form-item label="负责医生审查" prop="doctorAudit">
          <el-input v-model="form.doctorAudit" placeholder="请输入审查结论" />
        </el-form-item>
        <el-form-item label="负责医生编号" prop="doctorId">
          <el-input v-model="form.doctorId" placeholder="请输入负责医生编号" />
        </el-form-item>
        <el-form-item label="提交时间" prop="submitTimeDoctor">
          <el-date-picker clearable size="small"
            v-model="form.submitTimeDoctor"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择提交时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="医院意见" prop="hospitalOpinion">
          <el-input v-model="form.hospitalOpinion" placeholder="请输入医院意见" />
        </el-form-item>
        <el-form-item label="院长审查" prop="leaderAudit">
          <el-input v-model="form.leaderAudit" placeholder="请输入审查状态" />
        </el-form-item>
        <el-form-item label="院长编号" prop="leaderId">
          <el-input v-model="form.leaderId" placeholder="请输入院长编号" />
        </el-form-item>
        <el-form-item label="最终提交时间" prop="submitTimeLeader">
          <el-date-picker clearable size="small"
            v-model="form.submitTimeLeader"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择最终提交时间">
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
import { listForm, getForm, delForm, addForm, updateForm, exportForm } from "@/api/health/form";

export default {
  name: "Form",
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
      // 体检总表格数据
      formList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        doctorId: null,
        submitTimeDoctor: null,
        leaderId: null,
        submitTimeLeader: null
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
    /** 查询体检总列表 */
    getList() {
      this.loading = true;
      listForm(this.queryParams).then(response => {
        this.formList = response.rows;
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
        inspectorTime: null,
        conclusions: null,
        doctorAudit: null,
        doctorId: null,
        submitTimeDoctor: null,
        hospitalOpinion: null,
        leaderAudit: null,
        leaderId: null,
        submitTimeLeader: null
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
      this.title = "添加体检总表";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const studentId = row.studentId || this.ids
      getForm(studentId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改体检总表";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.studentId != null) {
            updateForm(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addForm(this.form).then(response => {
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
      this.$confirm('是否确认删除体检总表编号为"' + studentIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delForm(studentIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有体检总表数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(() => {
          this.exportLoading = true;
          return exportForm(queryParams);
        }).then(response => {
          this.download(response.msg);
          this.exportLoading = false;
        }).catch(() => {});
    }
  }
};
</script>
