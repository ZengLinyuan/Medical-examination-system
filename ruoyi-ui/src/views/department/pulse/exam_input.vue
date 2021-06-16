<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px">
        <el-col :span="12">
          <el-form-item label="高血压" prop="field101">
            <el-input v-model="formData.field101" placeholder="请输入高血压" clearable :style="{width: '100%'}">
              <template slot="append">mmHg</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="低血压" prop="field102">
            <el-input v-model="formData.field102" placeholder="请输入低血压" clearable :style="{width: '100%'}">
              <template slot="append">mmHg</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="脉搏" prop="field103">
            <el-input v-model="formData.field103" placeholder="请输入脉搏" clearable :style="{width: '100%'}">
              <template slot="append">次/分</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="13">
          <el-form-item label="医生意见" prop="field104">
            <el-input v-model="formData.field104" type="textarea" placeholder="请输入医生意见"
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
        field101: undefined,
        field102: undefined,
        field103: undefined,
        field104: '正常',
      },
      rules: {
        field101: [{
          required: true,
          message: '请输入高血压',
          trigger: 'blur'
        }],
        field102: [{
          required: true,
          message: '请输入低血压',
          trigger: 'blur'
        }],
        field103: [{
          required: true,
          message: '请输入脉搏',
          trigger: 'blur'
        }],
        field104: [{
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
