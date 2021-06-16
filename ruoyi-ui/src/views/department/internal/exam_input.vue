<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px"
               label-position="left">
        <el-col :span="12">
          <el-form-item label="发育营养" prop="field101">
            <el-input v-model="formData.field101" placeholder="请输入发育营养" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="神经及精神" prop="field102">
            <el-input v-model="formData.field102" placeholder="请输入神经及精神" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="肺及呼吸道" prop="field103">
            <el-input v-model="formData.field103" placeholder="请输入肺及呼吸道" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="心脏及血管" prop="field104">
            <el-input v-model="formData.field104" placeholder="请输入心脏及血管" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="肝" prop="field105">
            <el-input v-model="formData.field105" placeholder="请输入肝" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="脾" prop="field106">
            <el-input v-model="formData.field106" placeholder="请输入脾" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="其它" prop="field107">
            <el-input v-model="formData.field107" placeholder="请输入其它" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="13">
          <el-form-item label="医生意见" prop="field108">
            <el-input v-model="formData.field108" type="textarea" placeholder="请输入医生意见"
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
        field105: '正常',
        field106: '正常',
        field107: '无特殊',
        field108: '正常',
      },
      rules: {
        field101: [{
          required: true,
          message: '请输入发育营养',
          trigger: 'blur'
        }],
        field102: [{
          required: true,
          message: '请输入神经及精神',
          trigger: 'blur'
        }],
        field103: [{
          required: true,
          message: '请输入肺及呼吸道',
          trigger: 'blur'
        }],
        field104: [{
          required: true,
          message: '请输入心脏及血管',
          trigger: 'blur'
        }],
        field105: [{
          required: true,
          message: '请输入肝',
          trigger: 'blur'
        }],
        field106: [{
          required: true,
          message: '请输入脾',
          trigger: 'blur'
        }],
        field107: [{
          required: true,
          message: '请输入其它',
          trigger: 'blur'
        }],
        field108: [{
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
      this.$router.push({ path:"/internal/input" || "/" }).catch(()=>{});
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
