<template>
  <div class="app-container">
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="undefinedpx"
               label-position="left">
        <el-col :span="12">
          <el-form-item label="咽喉" prop="throat">
            <el-input v-model="formData.throat" clearable :style="{width: '50%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="口吃" prop="stutter">
            <el-input v-model="formData.stutter" clearable :style="{width: '50%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label-width="100px" label="医生意见" prop="doctorAdvice">
            <el-input v-model="formData.doctorAdvice" type="textarea" placeholder="请输入医生意见"
                      :autosize="{minRows: 4, maxRows: 4}" :style="{width: '50%'}"></el-input>
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
export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        throat: '正常',
        stutter: '正常',
        doctorAdvice: '正常',
      },
      rules: {
        throat: [{
          required: true,
          message: '',
          trigger: 'blur'
        }],
        stutter: [{
          required: true,
          message: '',
          trigger: 'blur'
        }],
        doctorAdvice: [{
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
      this.$router.push({ path:"/ent/input" || "/" }).catch(()=>{});
      this.$refs['elForm'].validate(valid => {
        if (!valid) return
        // TODO 提交表单
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
