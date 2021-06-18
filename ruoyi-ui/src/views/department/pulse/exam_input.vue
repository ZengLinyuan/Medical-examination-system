<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px">
        <el-col :span="12">
          <el-form-item label="高血压" prop="bloodPressureHigh">
            <el-input v-model="formData.bloodPressureHigh" placeholder="请输入高血压" clearable :style="{width: '100%'}">
              <template slot="append">mmHg</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="低血压" prop="bloodPressureLow">
            <el-input v-model="formData.bloodPressureLow" placeholder="请输入低血压" clearable :style="{width: '100%'}">
              <template slot="append">mmHg</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="脉搏" prop="pulse">
            <el-input v-model="formData.pulse" placeholder="请输入脉搏" clearable :style="{width: '100%'}">
              <template slot="append">次/分</template>
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
import {commitPulseForm} from "@/api/exam/input";
import Cookies from "js-cookie";
export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        bloodPressureHigh: undefined,
        bloodPressureLow: undefined,
        pulse: undefined,
        doctorOpinion: '正常',
      },
      rules: {
        bloodPressureHigh: [{
          required: true,
          message: '请输入高血压',
          trigger: 'blur'
        }],
        bloodPressureLow: [{
          required: true,
          message: '请输入低血压',
          trigger: 'blur'
        }],
        pulse: [{
          required: true,
          message: '请输入脉搏',
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
      this.$router.push({ path:"/pulse/input" || "/" }).catch(()=>{});
      this.$refs['elForm'].validate(valid => {
        if (valid) {
          this.$store.dispatch("GetInfo").then(() => {
            //this.formData.doctorId = user.state.userId;
          }).catch(() => {
          });
          this.formData.doctorId = Cookies.get("userId")
          this.formData.studentId = Cookies.get("studentId");
          commitPulseForm(this.formData).then(response => {
            this.msgSuccess("录入成功");
            Cookies.remove("studentId");
            this.$router.push({ path:"/pulse/input" || "/" }).catch(()=>{});
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
