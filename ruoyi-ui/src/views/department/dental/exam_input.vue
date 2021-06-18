<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px">
        <el-col :span="12">
          <el-form-item label="龋齿" prop="dentalCaries">
            <el-input v-model="formData.dentalCaries" clearable :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="缺齿" prop="missingTeeth">
            <el-input v-model="formData.missingTeeth" placeholder="请输入缺齿" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="齿槽" prop="alveolar">
            <el-input v-model="formData.alveolar" clearable :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="其它" prop="other">
            <el-input v-model="formData.other" placeholder="其它" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="医生意见" prop="doctorOpinion">
            <el-input v-model="formData.doctorOpinion" type="textarea" :autosize="{minRows: 4, maxRows: 4}"
                      :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item size="large">
            <el-button type="primary" @click="submitForm">提交</el-button>
            <el-button @click="resetForm">重置</el-button>
          </el-form-item>
        </el-col>
      </el-form>
    </el-row>
  </div>
</template>
<script>
import {commitDentalForm} from "@/api/exam/input";
import Cookies from "js-cookie";
import {addForm, updateForm} from "@/api/health/form";
import user from "@/store/modules/user";
export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        dentalCaries: '正常',
        missingTeeth: '正常',
        alveolar: '正常',
        other: '正常',
        doctorOpinion: '正常',
      },
      rules: {
        dentalCaries: [{
          required: true,
          message: '',
          trigger: 'blur'
        }],
        missingTeeth: [{
          required: true,
          message: '请输入缺齿',
          trigger: 'blur'
        }],
        alveolar: [{
          required: true,
          message: '',
          trigger: 'blur'
        }],
        other: [{
          required: true,
          message: '其它',
          trigger: 'blur'
        }],
        doctorOpinion: [{
          required: true,
          message: '',
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
          commitDentalForm(this.formData).then(response => {
            this.msgSuccess("录入成功");
            Cookies.remove("studentId");
            this.$router.push({ path:"/dental/input" || "/" }).catch(()=>{});
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
