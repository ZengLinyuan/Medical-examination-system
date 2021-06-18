<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px"
               label-position="left">
        <el-col :span="12">
          <el-form-item label="身高" prop="height">
            <el-input v-model="formData.height" placeholder="请输入身高" clearable :style="{width: '100%'}">
              <template slot="append">cm</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="腰围" prop="waist">
            <el-input v-model="formData.waist" placeholder="请输入腰围" clearable :style="{width: '100%'}">
              <template slot="append">cm</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="体重" prop="weight">
            <el-input v-model="formData.weight" placeholder="请输入体重" clearable :style="{width: '100%'}">
              <template slot="append">kg</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="皮肤" prop="skin">
            <el-input v-model="formData.skin" placeholder="请输入皮肤" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="淋巴" prop="lymph">
            <el-input v-model="formData.lymph" placeholder="请输入淋巴" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="甲状腺" prop="thyroid">
            <el-input v-model="formData.thyroid" placeholder="请输入甲状腺" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="脊柱" prop="spine">
            <el-input v-model="formData.spine" placeholder="请输入脊柱" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="四肢" prop="limb">
            <el-input v-model="formData.limb" placeholder="请输入四肢" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="关节" prop="joint">
            <el-input v-model="formData.joint" placeholder="请输入关节" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="平拓足" prop="flatFeet">
            <el-input v-model="formData.flatFeet" placeholder="请输入平拓足" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="其它" prop="other">
            <el-input v-model="formData.other" placeholder="请输入其它" clearable :style="{width: '100%'}">
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
import {commitSurgeryForm} from "@/api/exam/input";
import Cookies from "js-cookie";
export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        height: '',
        waist: undefined,
        weight: undefined,
        skin: '正常',
        lymph: '未触及',
        thyroid: '正常',
        spine: '正常',
        limb: '正常',
        joint: '正常',
        flatFeet: '无',
        other: '无',
        doctorOpinion: '正常',
      },
      rules: {
        height: [{
          required: true,
          message: '请输入身高',
          trigger: 'blur'
        }],
        waist: [{
          required: true,
          message: '请输入腰围',
          trigger: 'blur'
        }],
        weight: [{
          required: true,
          message: '请输入体重',
          trigger: 'blur'
        }],
        skin: [{
          required: true,
          message: '请输入皮肤',
          trigger: 'blur'
        }],
        lymph: [{
          required: true,
          message: '请输入淋巴',
          trigger: 'blur'
        }],
        thyroid: [{
          required: true,
          message: '请输入甲状腺',
          trigger: 'blur'
        }],
        spine: [{
          required: true,
          message: '请输入脊柱',
          trigger: 'blur'
        }],
        limb: [{
          required: true,
          message: '请输入四肢',
          trigger: 'blur'
        }],
        joint: [{
          required: true,
          message: '请输入关节',
          trigger: 'blur'
        }],
        flatFeet: [{
          required: true,
          message: '请输入平拓足',
          trigger: 'blur'
        }],
        other: [{
          required: true,
          message: '请输入其它',
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
      this.$refs['elForm'].validate(valid => {
        if (valid) {
          this.$store.dispatch("GetInfo").then(() => {
            //this.formData.doctorId = user.state.userId;
          }).catch(() => {
          });
          this.formData.doctorId = Cookies.get("userId")
          this.formData.studentId = Cookies.get("studentId");
          commitSurgeryForm(this.formData).then(response => {
            this.msgSuccess("录入成功");
            Cookies.remove("studentId");
            this.$router.push({ path:"/surgery/input" || "/" }).catch(()=>{});
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
