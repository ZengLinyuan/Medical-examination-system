<template>
  <div>
    <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px"
             label-position="left">
      <el-form-item label="化验检查" prop="laboratoryExamination">
        <el-input v-model="formData.laboratoryExamination" type="textarea" placeholder="请输入化验检查"
                  :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
      </el-form-item>
      <el-form-item label="医生意见" prop="doctorOpinion">
        <el-input v-model="formData.doctorOpinion" type="textarea" placeholder="请输入医生意见"
                  :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
      </el-form-item>
      <el-form-item size="large">
        <el-button type="primary" @click="submitForm">提交</el-button>
        <el-button @click="resetForm">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>

import {commitLaboratoryForm} from "@/api/exam/input";
import Cookies from "js-cookie";

export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        laboratoryExamination: '肝功（ALT、AKP、TB、DB），血常规主要指标检测值在正常范围',
        doctorOpinion: '正常',
      },
      rules: {
        laboratoryExamination: [{
          required: true,
          message: '请输入化验检查',
          trigger: 'blur'
        }],
        doctorOpinion: [{
          required: true,
          message: '请输入医生意见',
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
      this.$refs['elForm'].validate(valid => {
        if (valid) {
          this.$store.dispatch("GetInfo").then(() => {
            //this.formData.doctorId = user.state.userId;
          }).catch(() => {
          });
          this.formData.doctorId = Cookies.get("userId")
          this.formData.studentId = Cookies.get("studentId");
          commitLaboratoryForm(this.formData).then(response => {
            this.msgSuccess("录入成功");
            Cookies.remove("studentId");
            this.$router.push({ path:"/laboratory/input" || "/" }).catch(()=>{});
          }).catch(() => {
          });
        }
      })
    },
    resetForm() {
      this.$refs['elForm'].resetFields()
    },
  }
}

</script>
<style>
</style>
