<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px">
        <el-col :span="12">
          <el-form-item label="龋齿" prop="field101">
            <el-input v-model="formData.field101" clearable :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="缺齿" prop="field102">
            <el-input v-model="formData.field102" placeholder="请输入缺齿" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="齿槽" prop="field103">
            <el-input v-model="formData.field103" clearable :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="其它" prop="field104">
            <el-input v-model="formData.field104" placeholder="其它" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="医生意见" prop="field101">
            <el-input v-model="formData.field101" type="textarea" :autosize="{minRows: 4, maxRows: 4}"
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
export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        field101: '正常',
        field102: '正常',
        field103: '正常',
        field104: '正常',
        field101: '正常',
      },
      rules: {
        field101: [{
          required: true,
          message: '',
          trigger: 'blur'
        }],
        field102: [{
          required: true,
          message: '请输入缺齿',
          trigger: 'blur'
        }],
        field103: [{
          required: true,
          message: '',
          trigger: 'blur'
        }],
        field104: [{
          required: true,
          message: '其它',
          trigger: 'blur'
        }],
        field101: [{
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
      this.$router.push({ path:"/dental/input" || "/" }).catch(()=>{});
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
