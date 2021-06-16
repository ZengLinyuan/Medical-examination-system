<template>
  <div>
    <el-form ref="studentForm" :model="formData" :rules="rules" size="medium" label-width="100px"
             label-position="left">
      <el-row gutter="15">
        <el-col :span="12">
          <el-form-item label="学生身份证" prop="studentId">
            <el-input v-model="formData.studentId" placeholder="请输入学生身份证" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-form-item size="large">
        <el-button type="primary" @click="submitForm">提交</el-button>
        <el-button @click="resetForm">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import Cookies from "js-cookie";
import {getStudent} from "@/api/exam/input";
import {encrypt} from "@/utils/jsencrypt";

export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        studentId: '',
      },
      rules: {
        studentId: [{
          required: true,
          message: '请输入学生身份证',
          trigger: 'blur'
        }],
      },
    }
  },
  computed: {},
  watch: {},
  created() {},
  mounted() {},
  methods: {
    submitForm() {
      this.$refs['studentForm'].validate(valid => {
        if (valid) {
          Cookies.set("studentId", this.formData.studentId, { expires: 30 });
          getStudent(this.formData.studentId).then(res => {
            if(res.data!= null){
              this.msgSuccess("检录成功");
              Cookies.set("studentId", this.formData.studentId, { expires: 30 });
              this.$router.push({ path:"/internal/exam_input" || "/" }).catch(()=>{});
            }else{
              this.msgError("检录失败")
            }
          }).catch(() => {
            this.getCode();
          });
        }
      });
    },
    resetForm() {
      this.$refs['studentForm'].resetFields()
    },
  }
}

</script>
<style>
</style>
