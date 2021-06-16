<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px"
               label-position="left">
        <el-col :span="12">
          <el-form-item label="身高" prop="field101">
            <el-input v-model="formData.field101" placeholder="请输入身高" clearable :style="{width: '100%'}">
              <template slot="append">cm</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="腰围" prop="field102">
            <el-input v-model="formData.field102" placeholder="请输入腰围" clearable :style="{width: '100%'}">
              <template slot="append">cm</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="体重" prop="field103">
            <el-input v-model="formData.field103" placeholder="请输入体重" clearable :style="{width: '100%'}">
              <template slot="append">kg</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="皮肤" prop="field104">
            <el-input v-model="formData.field104" placeholder="请输入皮肤" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="淋巴" prop="field105">
            <el-input v-model="formData.field105" placeholder="请输入淋巴" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="甲状腺" prop="field106">
            <el-input v-model="formData.field106" placeholder="请输入甲状腺" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="脊柱" prop="field107">
            <el-input v-model="formData.field107" placeholder="请输入脊柱" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="四肢" prop="field108">
            <el-input v-model="formData.field108" placeholder="请输入四肢" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="关节" prop="field110">
            <el-input v-model="formData.field110" placeholder="请输入关节" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="平拓足" prop="field109">
            <el-input v-model="formData.field109" placeholder="请输入平拓足" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="其它" prop="field111">
            <el-input v-model="formData.field111" placeholder="请输入其它" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="13">
          <el-form-item label="医生意见" prop="field115">
            <el-input v-model="formData.field115" type="textarea" placeholder="请输入医生意见"
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
        field101: '',
        field102: undefined,
        field103: undefined,
        field104: '正常',
        field105: '未触及',
        field106: '正常',
        field107: '正常',
        field108: '正常',
        field110: '正常',
        field109: '无',
        field111: '无',
        field115: '正常',
      },
      rules: {
        field101: [{
          required: true,
          message: '请输入身高',
          trigger: 'blur'
        }],
        field102: [{
          required: true,
          message: '请输入腰围',
          trigger: 'blur'
        }],
        field103: [{
          required: true,
          message: '请输入体重',
          trigger: 'blur'
        }],
        field104: [{
          required: true,
          message: '请输入皮肤',
          trigger: 'blur'
        }],
        field105: [{
          required: true,
          message: '请输入淋巴',
          trigger: 'blur'
        }],
        field106: [{
          required: true,
          message: '请输入甲状腺',
          trigger: 'blur'
        }],
        field107: [{
          required: true,
          message: '请输入脊柱',
          trigger: 'blur'
        }],
        field108: [{
          required: true,
          message: '请输入四肢',
          trigger: 'blur'
        }],
        field110: [{
          required: true,
          message: '请输入关节',
          trigger: 'blur'
        }],
        field109: [{
          required: true,
          message: '请输入平拓足',
          trigger: 'blur'
        }],
        field111: [{
          required: true,
          message: '请输入其它',
          trigger: 'blur'
        }],
        field115: [{
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
      this.$router.push({ path:"/surgery/input" || "/" }).catch(()=>{});
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
