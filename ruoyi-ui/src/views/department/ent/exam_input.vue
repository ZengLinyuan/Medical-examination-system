<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="108px"
               label-position="left">
        <el-col :span="12">
          <el-form-item label="左耳听力" prop="hearingLeft">
            <el-input v-model="formData.hearingLeft" placeholder="请输入左耳听力" clearable :style="{width: '100%'}">
              <template slot="append">公尺</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="右耳听力" prop="hearingRight">
            <el-input v-model="formData.hearingRight" placeholder="请输入右耳听力" clearable :style="{width: '100%'}">
              <template slot="append">公尺</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="耳疾" prop="earIllness">
            <el-input v-model="formData.earIllness" placeholder="请输入耳疾" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="嗅觉" prop="smellSense">
            <el-input v-model="formData.smellSense" placeholder="请输入嗅觉" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="鼻及鼻窦疾病" prop="noseIllness">
            <el-input v-model="formData.noseIllness" placeholder="请输入鼻及鼻窦疾病" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="咽喉" prop="throat">
            <el-input v-model="formData.throat" placeholder="请输入咽喉" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="口吃" prop="stutter">
            <el-input v-model="formData.stutter" placeholder="请输入口吃" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
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
import {commitEntForm} from "@/api/exam/input";
export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        hearingLeft: undefined,
        hearingRight: undefined,
        earIllness: '无',
        smellSense: '正常',
        noseIllness: '无',
        throat: '正常',
        stutter: '正常',
        doctorOpinion: '正常',
      },
      rules: {
        hearingLeft: [{
          required: true,
          message: '请输入左耳听力',
          trigger: 'blur'
        }],
        hearingRight: [{
          required: true,
          message: '请输入右耳听力',
          trigger: 'blur'
        }],
        earIllness: [{
          required: true,
          message: '请输入耳疾',
          trigger: 'blur'
        }],
        smellSense: [{
          required: true,
          message: '请输入嗅觉',
          trigger: 'blur'
        }],
        noseIllness: [{
          required: true,
          message: '请输入鼻及鼻窦疾病',
          trigger: 'blur'
        }],
        throat: [{
          required: true,
          message: '请输入咽喉',
          trigger: 'blur'
        }],
        stutter: [{
          required: true,
          message: '请输入口吃',
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
          commitEntForm(this.formData).then(response => {
            this.msgSuccess("录入成功");
            Cookies.remove("studentId");
            this.$router.push({ path:"/ent/input" || "/" }).catch(()=>{});
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
