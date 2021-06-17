<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px"
               label-position="left">
        <el-col :span="12">
          <el-form-item label="发育营养" prop="developmentalNutrition">
            <el-input v-model="formData.developmentalNutrition" placeholder="请输入发育营养" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="神经及精神" prop="nervesAndSpirits">
            <el-input v-model="formData.nervesAndSpirits" placeholder="请输入神经及精神" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="肺及呼吸道" prop="lungAndRespiratoryTract">
            <el-input v-model="formData.lungAndRespiratoryTract" placeholder="请输入肺及呼吸道" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="心脏及血管" prop="heartAndBloodVessels">
            <el-input v-model="formData.heartAndBloodVessels" placeholder="请输入心脏及血管" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="肝" prop="liver">
            <el-input v-model="formData.liver" placeholder="请输入肝" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="脾" prop="spleen">
            <el-input v-model="formData.spleen" placeholder="请输入脾" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="其它" prop="other">
            <el-input v-model="formData.other" placeholder="请输入其它" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="13">
          <el-form-item label="医生意见" prop="doctorOpinion">
            <el-input v-model="formData.doctorOpinion" type="textarea" placeholder="请输入医生意见"
                      :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
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
import Cookies from "js-cookie";
import {commitInternalForm} from "@/api/exam/input";

export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        developmentalNutrition: '正常',
        nervesAndSpirits: '正常',
        lungAndRespiratoryTract: '正常',
        heartAndBloodVessels: '正常',
        liver: '正常',
        spleen: '正常',
        other: '无特殊',
        doctorOpinion: '正常',
      },
      rules: {
        developmentalNutrition: [{
          required: true,
          message: '请输入发育营养',
          trigger: 'blur'
        }],
        nervesAndSpirits: [{
          required: true,
          message: '请输入神经及精神',
          trigger: 'blur'
        }],
        lungAndRespiratoryTract: [{
          required: true,
          message: '请输入肺及呼吸道',
          trigger: 'blur'
        }],
        heartAndBloodVessels: [{
          required: true,
          message: '请输入心脏及血管',
          trigger: 'blur'
        }],
        liver: [{
          required: true,
          message: '请输入肝',
          trigger: 'blur'
        }],
        spleen: [{
          required: true,
          message: '请输入脾',
          trigger: 'blur'
        }],
        other: [{
          required: true,
          message: '请输入其它',
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
          commitInternalForm(this.formData).then(response => {
            this.msgSuccess("录入成功");
            Cookies.remove("studentId");
            this.$router.push({ path:"/internal/input" || "/" }).catch(()=>{});
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
