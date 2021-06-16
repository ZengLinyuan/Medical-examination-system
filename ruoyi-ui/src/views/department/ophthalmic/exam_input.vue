<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="108px"
               label-position="left">
        <el-col :span="12">
          <el-form-item label="左眼视力" prop="sightLeftNoglasses">
            <el-select v-model="formData.sightLeftNoglasses" placeholder="请选择左眼视力" clearable :style="{width: '50%'}">
              <el-option v-for="(item, index) in sightLeftNoglassesOptions" :key="index" :label="item.label"
                         :value="item.value" :disabled="item.disabled"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="右眼视力" prop="sightRightNoglasses">
            <el-select v-model="formData.sightRightNoglasses" placeholder="请选择右眼视力" clearable :style="{width: '50%'}">
              <el-option v-for="(item, index) in sightRightNoglassesOptions" :key="index" :label="item.label"
                         :value="item.value" :disabled="item.disabled"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="左眼矫正视力" prop="sightLeftWithglasses">
            <el-select v-model="formData.sightLeftWithglasses" placeholder="请选择左眼矫正视力" clearable :style="{width: '50%'}">
              <el-option v-for="(item, index) in sightLeftWithglassesOptions" :key="index" :label="item.label"
                         :value="item.value" :disabled="item.disabled"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="右眼矫正视力" prop="sightRightWithglasses">
            <el-select v-model="formData.sightRightWithglasses" placeholder="请选择右眼矫正视力" clearable :style="{width: '50%'}">
              <el-option v-for="(item, index) in sightRightWithglassesOptions" :key="index" :label="item.label"
                         :value="item.value" :disabled="item.disabled"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="其他疾病" prop="eyeIllness">
            <el-input v-model="formData.eyeIllness" placeholder="请输入其他疾病" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="21">
          <el-form-item label-width="121px" label="彩色图案及编码" prop="colorVision">
            <el-checkbox-group v-model="formData.colorVision" size="medium">
              <el-checkbox v-for="(item, index) in colorVisionOptions" :key="index" :label="item.value"
                           :disabled="item.disabled">{{item.label}}</el-checkbox>
            </el-checkbox-group>
          </el-form-item>
        </el-col>
        <el-col :span="21">
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
import {addForm, updateForm} from "@/api/health/form";
import {commitEyeForm} from "@/api/exam/input";
import Cookies from "js-cookie";

export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
          studentId:'',
          userId:'',
          sightLeftNoglasses: undefined,
          sightRightNoglasses: undefined,
          sightLeftWithglasses: undefined,
          sightRightWithglasses: undefined,
          eyeIllness: '无',
          colorVision: [],
          doctorOpinion: '无',
      },
      rules: {
        sightLeftNoglasses: [{
          required: true,
          message: '请选择左眼视力',
          trigger: 'change'
        }],
        sightRightNoglasses: [{
          required: true,
          message: '请选择右眼视力',
          trigger: 'change'
        }],
        sightLeftWithglasses: [{
          required: true,
          message: '请选择左眼矫正视力',
          trigger: 'change'
        }],
        sightRightWithglasses: [{
          required: true,
          message: '请选择右眼矫正视力',
          trigger: 'change'
        }],
        eyeIllness: [{
          required: true,
          message: '请输入其他疾病',
          trigger: 'blur'
        }],
        colorVision: [{
          required: true,
          type: 'array',
          message: '请至少选择一个field115',
          trigger: 'change'
        }],
        doctorOpinion: [{
          required: true,
          message: '请输入医生意见',
          trigger: 'blur'
        }],
      },
      sightLeftNoglassesOptions: [{
        "label": "4.0",
        "value": 1
      }, {
        "label": "4.1",
        "value": 2
      }, {
        "label": "4.2",
        "value": 3
      }, {
        "label": "4.3",
        "value": 4
      }, {
        "label": "4.4",
        "value": 5
      }, {
        "label": "4.5",
        "value": 6
      }, {
        "label": "4.6",
        "value": 7
      }, {
        "label": "4.7",
        "value": 8
      }, {
        "label": "4.8",
        "value": 9
      }, {
        "label": "4.9",
        "value": 10
      }, {
        "label": "5.0",
        "value": 11
      }, {
        "label": "5.1",
        "value": 12
      }, {
        "label": "5.2",
        "value": 13
      }],
      sightRightNoglassesOptions: [{
        "label": "4.0",
        "value": 1
      }, {
        "label": "4.1",
        "value": 2
      }, {
        "label": "4.2",
        "value": 3
      }, {
        "label": "4.3",
        "value": 4
      }, {
        "label": "4.4",
        "value": 5
      }, {
        "label": "4.5",
        "value": 6
      }, {
        "label": "4.6",
        "value": 7
      }, {
        "label": "4.7",
        "value": 8
      }, {
        "label": "4.8",
        "value": 9
      }, {
        "label": "4.9",
        "value": 10
      }, {
        "label": "5.0",
        "value": 11
      }, {
        "label": "5.1",
        "value": 12
      }, {
        "label": "5.2",
        "value": 13
      }],
      sightLeftWithglassesOptions: [{
        "label": "4.0",
        "value": 1
      }, {
        "label": "4.1",
        "value": 2
      }, {
        "label": "4.2",
        "value": 3
      }, {
        "label": "4.3",
        "value": 4
      }, {
        "label": "4.4",
        "value": 5
      }, {
        "label": "4.5",
        "value": 6
      }, {
        "label": "4.6",
        "value": 7
      }, {
        "label": "4.7",
        "value": 8
      }, {
        "label": "4.8",
        "value": 9
      }, {
        "label": "4.9",
        "value": 10
      }, {
        "label": "5.0",
        "value": 11
      }, {
        "label": "5.1",
        "value": 12
      }, {
        "label": "5.2",
        "value": 13
      }],
      sightRightWithglassesOptions: [{
        "label": "4.0",
        "value": 1
      }, {
        "label": "4.1",
        "value": 2
      }, {
        "label": "4.2",
        "value": 3
      }, {
        "label": "4.3",
        "value": 4
      }, {
        "label": "4.4",
        "value": 5
      }, {
        "label": "4.5",
        "value": 6
      }, {
        "label": "4.6",
        "value": 7
      }, {
        "label": "4.7",
        "value": 8
      }, {
        "label": "4.8",
        "value": 9
      }, {
        "label": "4.9",
        "value": 10
      }, {
        "label": "5.0",
        "value": 11
      }, {
        "label": "5.1",
        "value": 12
      }, {
        "label": "5.2",
        "value": 13
      }],
      colorVisionOptions: [{
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
      this.$refs['elForm'].validate(valid => {
        if (valid) {
          this.formData.studentId = Cookies.get("studentId");
          commitEyeForm(this.formData).then(response => {
            this.msgSuccess("录入成功");
            Cookies.remove("studentId");
            this.$router.push({ path:"/ophthalmic/input" || "/" }).catch(()=>{});
          }).catch(() => {
            this.getCode();
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
