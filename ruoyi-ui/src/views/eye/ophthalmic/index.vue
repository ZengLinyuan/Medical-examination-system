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
      <el-form-item label="院长审查" prop="leaderAudit">
        <el-input
          v-model="queryParams.leaderAudit"
          placeholder="请输入院长审查"
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
          v-hasPermi="['eye:ophthalmic:add']"
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
          v-hasPermi="['eye:ophthalmic:edit']"
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
          v-hasPermi="['eye:ophthalmic:remove']"
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
          v-hasPermi="['eye:ophthalmic:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="ophthalmicList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="学号" align="center" prop="studentId" />
      <el-table-column label="体检时间" align="center" prop="diagnosisTime" />
      <el-table-column label="左视力" align="center" prop="sightLeftNoglasses" />
      <el-table-column label="右视力" align="center" prop="sightRightNoglasses" />
      <el-table-column label="左矫正视力" align="center" prop="sightLeftWithglasses" />
      <el-table-column label="右矫正视力" align="center" prop="sightRightWithglasses" />
      <el-table-column label="其他眼病" align="center" prop="eyeIllness" />
      <el-table-column label="红色色觉" align="center" prop="colorVisionRed" />
      <el-table-column label="绿色色觉" align="center" prop="colorVisionGreen" />
      <el-table-column label="紫色色觉" align="center" prop="colorVisionPurple" />
      <el-table-column label="蓝色色觉" align="center" prop="colorVisionBlue" />
      <el-table-column label="黄色色觉" align="center" prop="colorVisionYellow" />
      <el-table-column label="负责医生审查" align="center" prop="doctorAudit" />
      <el-table-column label="院长审查" align="center" prop="leaderAudit" />
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
            v-hasPermi="['eye:ophthalmic:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['eye:ophthalmic:remove']"
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

    <!-- 添加或修改眼科对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="左视力" prop="sightLeftNoglasses">
          <el-input v-model="form.sightLeftNoglasses" placeholder="请输入左视力" />
        </el-form-item>
        <el-form-item label="右视力" prop="sightRightNoglasses">
          <el-input v-model="form.sightRightNoglasses" placeholder="请输入右视力" />
        </el-form-item>
        <el-form-item label="左矫正视力" prop="sightLeftWithglasses">
          <el-input v-model="form.sightLeftWithglasses" placeholder="请输入左矫正视力" />
        </el-form-item>
        <el-form-item label="右矫正视力" prop="sightRightWithglasses">
          <el-input v-model="form.sightRightWithglasses" placeholder="请输入右矫正视力" />
        </el-form-item>
        <el-form-item label="其他眼病" prop="eyeIllness">
          <el-input v-model="form.eyeIllness" placeholder="请输入其他眼病" />
        </el-form-item>
        <el-form-item label="红色色觉" prop="colorVisionRed">
          <el-input v-model="form.colorVisionRed" placeholder="请输入红色色觉" />
        </el-form-item>
        <el-form-item label="绿色色觉" prop="colorVisionGreen">
          <el-input v-model="form.colorVisionGreen" placeholder="请输入绿色色觉" />
        </el-form-item>
        <el-form-item label="紫色色觉" prop="colorVisionPurple">
          <el-input v-model="form.colorVisionPurple" placeholder="请输入紫色色觉" />
        </el-form-item>
        <el-form-item label="蓝色色觉" prop="colorVisionBlue">
          <el-input v-model="form.colorVisionBlue" placeholder="请输入蓝色色觉" />
        </el-form-item>
        <el-form-item label="黄色色觉" prop="colorVisionYellow">
          <el-input v-model="form.colorVisionYellow" placeholder="请输入黄色色觉" />
        </el-form-item>
        <el-form-item label="医生意见" prop="doctorOpinion">
          <el-input v-model="form.doctorOpinion" placeholder="请输入医生意见" />
        </el-form-item>
        <el-form-item label="医生编号" prop="doctorId">
          <el-input v-model="form.doctorId" placeholder="请输入医生编号" />
        </el-form-item>
        <el-form-item label="负责医生审查" prop="doctorAudit">
          <el-input v-model="form.doctorAudit" placeholder="请输入负责医生审查" />
        </el-form-item>
        <el-form-item label="院长审查" prop="leaderAudit">
          <el-input v-model="form.leaderAudit" placeholder="请输入院长审查" />
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
import { listOphthalmic, getOphthalmic, delOphthalmic, addOphthalmic, updateOphthalmic, exportOphthalmic } from "@/api/eye/ophthalmic";

export default {
  name: "Ophthalmic",
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
      // 眼科表格数据
      ophthalmicList: [],
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
    /** 查询眼科列表 */
    getList() {
      this.loading = true;
      listOphthalmic(this.queryParams).then(response => {
        this.ophthalmicList = response.rows;
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
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加眼科";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const studentId = row.studentId || this.ids
      getOphthalmic(studentId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改眼科";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
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
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const studentIds = row.studentId || this.ids;
      this.$confirm('是否确认删除眼科编号为"' + studentIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delOphthalmic(studentIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有眼科数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(() => {
          this.exportLoading = true;
          return exportOphthalmic(queryParams);
        }).then(response => {
          this.download(response.msg);
          this.exportLoading = false;
        }).catch(() => {});
    }
  }
};
</script>
