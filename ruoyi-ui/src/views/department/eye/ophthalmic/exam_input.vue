<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="108px"
               label-position="left">
        <el-col :span="12">
          <el-form-item label="左眼视力" prop="field109">
            <el-select v-model="formData.field109" placeholder="请选择左眼视力" clearable :style="{width: '50%'}">
              <el-option v-for="(item, index) in field109Options" :key="index" :label="item.label"
                         :value="item.value" :disabled="item.disabled"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="右眼视力" prop="field110">
            <el-select v-model="formData.field110" placeholder="请选择右眼视力" clearable :style="{width: '50%'}">
              <el-option v-for="(item, index) in field110Options" :key="index" :label="item.label"
                         :value="item.value" :disabled="item.disabled"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="左眼矫正视力" prop="field111">
            <el-select v-model="formData.field111" placeholder="请选择左眼矫正视力" clearable :style="{width: '50%'}">
              <el-option v-for="(item, index) in field111Options" :key="index" :label="item.label"
                         :value="item.value" :disabled="item.disabled"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="右眼矫正视力" prop="field112">
            <el-select v-model="formData.field112" placeholder="请选择右眼矫正视力" clearable :style="{width: '50%'}">
              <el-option v-for="(item, index) in field112Options" :key="index" :label="item.label"
                         :value="item.value" :disabled="item.disabled"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="其他疾病" prop="field113">
            <el-input v-model="formData.field113" placeholder="请输入其他疾病" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="21">
          <el-form-item label-width="121px" label="彩色图案及编码" prop="field115">
            <el-checkbox-group v-model="formData.field115" size="medium">
              <el-checkbox v-for="(item, index) in field115Options" :key="index" :label="item.value"
                           :disabled="item.disabled">{{item.label}}</el-checkbox>
            </el-checkbox-group>
          </el-form-item>
        </el-col>
        <el-col :span="21">
          <el-form-item label="医生意见" prop="field117">
            <el-input v-model="formData.field117" type="textarea" placeholder="请输入医生意见"
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
        field109: undefined,
        field110: undefined,
        field111: undefined,
        field112: undefined,
        field113: '无',
        field115: [],
        field117: '无',
      },
      rules: {
        field109: [{
          required: true,
          message: '请选择左眼视力',
          trigger: 'change'
        }],
        field110: [{
          required: true,
          message: '请选择右眼视力',
          trigger: 'change'
        }],
        field111: [{
          required: true,
          message: '请选择左眼矫正视力',
          trigger: 'change'
        }],
        field112: [{
          required: true,
          message: '请选择右眼矫正视力',
          trigger: 'change'
        }],
        field113: [{
          required: true,
          message: '请输入其他疾病',
          trigger: 'blur'
        }],
        field115: [{
          required: true,
          type: 'array',
          message: '请至少选择一个field115',
          trigger: 'change'
        }],
        field117: [{
          required: true,
          message: '请输入医生意见',
          trigger: 'blur'
        }],
      },
      field109Options: [{
        "label": "4.0",
        "value": 1
      }, {
        "label": "4.1",
        "value": 2
      }, {
        "label": "4.2",
        "value": ""
      }, {
        "label": "4.3",
        "value": ""
      }, {
        "label": "4.4",
        "value": ""
      }, {
        "label": "4.5",
        "value": ""
      }, {
        "label": "4.6",
        "value": ""
      }, {
        "label": "4.7",
        "value": ""
      }, {
        "label": "4.8",
        "value": ""
      }, {
        "label": "4.9",
        "value": ""
      }, {
        "label": "5.0",
        "value": ""
      }, {
        "label": "5.1",
        "value": ""
      }, {
        "label": "5.2",
        "value": ""
      }],
      field110Options: [{
        "label": "4.0",
        "value": 1
      }, {
        "label": "4.1",
        "value": 2
      }, {
        "label": "4.2",
        "value": ""
      }, {
        "label": "4.3",
        "value": ""
      }, {
        "label": "4.4",
        "value": ""
      }, {
        "label": "4.5",
        "value": ""
      }, {
        "label": "4.6",
        "value": ""
      }, {
        "label": "4.7",
        "value": ""
      }, {
        "label": "4.8",
        "value": ""
      }, {
        "label": "4.9",
        "value": ""
      }, {
        "label": "5.0",
        "value": ""
      }, {
        "label": "5.1",
        "value": ""
      }, {
        "label": "5.2",
        "value": ""
      }],
      field111Options: [{
        "label": "4.0",
        "value": 1
      }, {
        "label": "4.1",
        "value": 2
      }, {
        "label": "4.2",
        "value": ""
      }, {
        "label": "4.3",
        "value": ""
      }, {
        "label": "4.4",
        "value": ""
      }, {
        "label": "4.5",
        "value": ""
      }, {
        "label": "4.6",
        "value": ""
      }, {
        "label": "4.7",
        "value": ""
      }, {
        "label": "4.8",
        "value": ""
      }, {
        "label": "4.9",
        "value": ""
      }, {
        "label": "5.0",
        "value": ""
      }, {
        "label": "5.1",
        "value": ""
      }, {
        "label": "5.2",
        "value": ""
      }],
      field112Options: [{
        "label": "4.0",
        "value": 1
      }, {
        "label": "4.1",
        "value": 2
      }, {
        "label": "4.2",
        "value": ""
      }, {
        "label": "4.3",
        "value": ""
      }, {
        "label": "4.4",
        "value": ""
      }, {
        "label": "4.5",
        "value": ""
      }, {
        "label": "4.6",
        "value": ""
      }, {
        "label": "4.7",
        "value": ""
      }, {
        "label": "4.8",
        "value": ""
      }, {
        "label": "4.9",
        "value": ""
      }, {
        "label": "5.0",
        "value": ""
      }, {
        "label": "5.1",
        "value": ""
      }, {
        "label": "5.2",
        "value": ""
      }],
      field115Options: [{
        "label": "红",
        "value": 1
      }, {
        "label": "绿",
        "value": 2
      }, {
        "label": "紫",
        "value": 3
      }, {
        "label": "蓝",
        "value": 4
      }, {
        "label": "黄",
        "value": 5
      }],
    }
  },
  computed: {},
  watch: {},
  created() {},
  mounted() {},
  methods: {
    submitForm() {
      this.$router.push({ path:"/ophthalmic/input" || "/" }).catch(()=>{});
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
