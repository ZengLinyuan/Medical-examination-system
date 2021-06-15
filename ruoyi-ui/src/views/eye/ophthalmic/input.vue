<template>
  <div>
    <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px"
             label-position="left">
      <el-row gutter="15">
        <el-col :span="12">
          <el-form-item label="学生身份证" prop="field101">
            <el-input v-model="formData.field101" placeholder="请输入学生身份证" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label-width="1px" label="" prop="field101">
            <el-button type="primary" icon="el-icon-search" size="medium"> 主要按钮 </el-button>
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
export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        field101: '',
        field101: undefined,
      },
      rules: {
        field101: [{
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
      this.$router.push({ path:"/ophthalmic/exam_input" || "/" }).catch(()=>{});
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
