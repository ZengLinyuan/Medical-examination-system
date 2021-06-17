<template>
  <div>
    <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px">
      <el-form-item label="胸部放射检查" prop="chestRadiography">
        <el-input v-model="formData.field101" type="textarea" placeholder="请输入胸部放射检查"
                  :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
      </el-form-item>
      <el-form-item label="医生意见" prop="doctorOpinion">
        <el-input v-model="formData.field102" type="textarea" placeholder="请输入医生意见"
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
export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        chestRadiography: '胸部未见活动性结核病灶，肺未见重要发现',
        doctorOpinion: '正常',
      },
      rules: {
        chestRadiography: [{
          required: true,
          message: '请输入胸部放射检查',
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
      this.$router.push({ path:"/chest/input" || "/" }).catch(()=>{});
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
