<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px">
        <el-col :span="12">
          <el-form-item label="左眼视力" prop="sight_left_noglasses">
            <el-input v-model="formData.sight_left_noglasses" placeholder="请输入左眼视力" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="左矫正视力" prop="sight_left_withglasses">
            <el-input v-model="formData.sight_left_withglasses" placeholder="请输入左矫正视力" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="右眼视力" prop="sight_right_noglasses">
            <el-input v-model="formData.sight_right_noglasses" placeholder="请输入右眼视力" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="右矫正视力" prop="sight_right_withglasses">
            <el-input v-model="formData.sight_right_withglasses" placeholder="请输入右矫正视力" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="其他眼病" prop="eye_illness">
            <el-input v-model="formData.eye_illness" placeholder="请输入其他眼病" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="多选框组" prop="color">
            <el-checkbox-group v-model="formData.color" :max="5" size="medium">
              <el-checkbox v-for="(item, index) in colorOptions" :key="index" :label="item.value"
                :disabled="item.disabled">{{item.label}}</el-checkbox>
            </el-checkbox-group>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctor_opinion">
            <el-input v-model="formData.eye_doctor_opinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">眼科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="左耳听力" prop="hearing_left">
            <el-input v-model="formData.hearing_left" placeholder="请输入左耳听力" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="右耳听力" prop="hearing_right">
            <el-input v-model="formData.hearing_right" placeholder="请输入右耳听力" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="耳 疾" prop="ear_illness">
            <el-input v-model="formData.ear_illness" placeholder="请输入耳 疾" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="嗅 觉" prop="smell_sense">
            <el-input v-model="formData.smell_sense" placeholder="请输入嗅 觉" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="鼻及鼻窦疾病" prop="nose_illness">
            <el-input v-model="formData.nose_illness" placeholder="请输入鼻及鼻窦疾病" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="咽 喉" prop="throat">
            <el-input v-model="formData.throat" placeholder="请输入咽 喉" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="口 吃" prop="stutter">
            <el-input v-model="formData.stutter" placeholder="请输入口 吃" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctor_opinion">
            <el-input v-model="formData.ent_doctor_opinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">耳鼻喉</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="龋 齿" prop="dental_caries">
            <el-input v-model="formData.dental_caries" placeholder="请输入龋 齿" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="缺 齿" prop="missing_teeth">
            <el-input v-model="formData.missing_teeth" placeholder="请输入缺 齿" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="齿 槽" prop="alveolar">
            <el-input v-model="formData.alveolar" placeholder="请输入齿 槽" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="其 他" prop="other">
            <el-input v-model="formData.dental_other" placeholder="请输入其 他" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctor_opinion">
            <el-input v-model="formData.dental_doctor_opinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">口腔</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="身高" prop="height">
            <el-input v-model="formData.height" placeholder="请输入身高" readonly :style="{width: '100%'}">
              <template slot="append">公分</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="腰围" prop="waist">
            <el-input v-model="formData.waist" placeholder="请输入腰围" readonly :style="{width: '100%'}">
              <template slot="append">公分</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="体重" prop="weight">
            <el-input v-model="formData.weight" placeholder="请输入体重" readonly :style="{width: '100%'}">
              <template slot="append">公斤</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="皮肤" prop="skin">
            <el-input v-model="formData.skin" placeholder="请输入皮肤" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="淋 巴" prop="lymph">
            <el-input v-model="formData.lymph" placeholder="请输入淋 巴" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="甲状腺" prop="thyroid">
            <el-input v-model="formData.thyroid" placeholder="请输入甲状腺" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="脊 柱" prop="spine">
            <el-input v-model="formData.spine" placeholder="请输入脊 柱" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="四肢" prop="limb">
            <el-input v-model="formData.limb" placeholder="请输入四肢" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="关 节" prop="joint">
            <el-input v-model="formData.joint" placeholder="请输入关 节" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="平拓足" prop="flat_feet">
            <el-input v-model="formData.flat_feet" placeholder="请输入平拓足" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="其 他" prop="other">
            <el-input v-model="formData.surgery_other" placeholder="请输入其 他" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctor_opinion">
            <el-input v-model="formData.surgery_doctor_opinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">外科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="高血压" prop="blood_pressure_high">
            <el-input v-model="formData.blood_pressure_high" placeholder="请输入高血压" readonly
              :style="{width: '100%'}">
              <template slot="append">mmHg</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="低血压" prop="blood_pressure_low">
            <el-input v-model="formData.blood_pressure_low" placeholder="请输入低血压" readonly
              :style="{width: '100%'}">
              <template slot="append">mmHg</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="脉搏" prop="pulse">
            <el-input v-model="formData.pulse" placeholder="请输入脉搏" readonly :style="{width: '100%'}">
              <template slot="append">次/分</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctor_opinion">
            <el-input v-model="formData.pulse_doctor_opinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">血压脉搏科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="发育营养" prop="developmental_nutrition">
            <el-input v-model="formData.developmental_nutrition" placeholder="请输入发育营养" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="神经及精神" prop="nerves_and_spirits">
            <el-input v-model="formData.nerves_and_spirits" placeholder="请输入神经及精神" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="肺及呼吸道" prop="lung_and_respiratory_tract">
            <el-input v-model="formData.lung_and_respiratory_tract" placeholder="请输入肺及呼吸道" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="心脏及血管" prop="heart_and_blood_vessels">
            <el-input v-model="formData.heart_and_blood_vessels" placeholder="请输入心脏及血管" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="肝" prop="liver">
            <el-input v-model="formData.liver" placeholder="请输入肝" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="脾" prop="spleen">
            <el-input v-model="formData.spleen" placeholder="请输入脾" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="其 他" prop="other">
            <el-input v-model="formData.internal_other" placeholder="请输入其 他" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctor_opinion">
            <el-input v-model="formData.internal_doctor_opinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">内科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="化验检查" prop="laboratory_examination">
            <el-input v-model="formData.laboratory_examination" type="textarea" placeholder="请输入化验检查" readonly
              :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctor_opinion">
            <el-input v-model="formData.laboratory_doctor_opinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">化验科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="胸部放射检查" prop="chest_radiography">
            <el-input v-model="formData.chest_radiography" type="textarea" placeholder="请输入胸部放射检查" readonly
              :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctor_opinion">
            <el-input v-model="formData.chest_radiography_doctor_opinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">胸部放射科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="其他检查" prop="other_examination">
            <el-input v-model="formData.other_examination" type="textarea" placeholder="请输入其他检查" readonly
              :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctor_opinion">
            <el-input v-model="formData.other_doctor_opinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">胸部放射科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="负责医生建议" prop="conclusions">
            <el-input v-model="formData.conclusions" placeholder="请输入负责医生建议" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医院意见" prop="hospital_opinion">
            <el-input v-model="formData.hospital_opinion" placeholder="请输入医院意见" clearable
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="是否驳回" prop="leader_audit">
            <el-cascader v-model="formData.leader_audit" :options="leader_auditOptions"
              :props="leader_auditProps" :style="{width: '100%'}" placeholder="请选择是否驳回" clearable>
            </el-cascader>
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
import {getData} from "@/api/system/dict/data";

export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        sight_left_noglasses: undefined,
        sight_left_withglasses: undefined,
        sight_right_noglasses: undefined,
        sight_right_withglasses: undefined,
        eye_illness: undefined,
        color: [""],
        eye_doctor_opinion: undefined,
        hearing_left: undefined,
        hearing_right: undefined,
        ear_illness: undefined,
        smell_sense: undefined,
        nose_illness: undefined,
        throat: undefined,
        stutter: undefined,
        ent_doctor_opinion: undefined,
        dental_caries: undefined,
        missing_teeth: undefined,
        alveolar: undefined,
        dental_other: undefined,
        dental_doctor_opinion: undefined,
        height: undefined,
        waist: undefined,
        weight: undefined,
        skin: undefined,
        lymph: undefined,
        thyroid: undefined,
        spine: undefined,
        limb: undefined,
        joint: undefined,
        flat_feet: undefined,
        surger_other: undefined,
        surgery_doctor_opinion: undefined,
        blood_pressure_high: undefined,
        blood_pressure_low: undefined,
        pulse: undefined,
        pulse_doctor_opinion: undefined,
        developmental_nutrition: undefined,
        nerves_and_spirits: undefined,
        lung_and_respiratory_tract: undefined,
        heart_and_blood_vessels: undefined,
        liver: undefined,
        spleen: undefined,
        other: undefined,
        internal_doctor_opinion: undefined,
        laboratory_examination: undefined,
        laboratory_doctor_opinion: undefined,
        chest_radiography: undefined,
        chest_radiography_doctor_opinion: undefined,
        other_examination: undefined,
        other_doctor_opinion: undefined,
        conclusions: '',
        hospital_opinion: '体检结果符合相关健康要求',
        leader_audit: ["通过"],
      },
      rules: {
        sight_left_noglasses: [],
        sight_left_withglasses: [],
        sight_right_noglasses: [],
        sight_right_withglasses: [],
        eye_illness: [],
        color: [],
        eye_doctor_opinion: [],
        hearing_left: [],
        hearing_right: [],
        ear_illness: [],
        smell_sense: [],
        nose_illness: [],
        throat: [],
        stutter: [],
        ent_doctor_opinion: [],
        dental_caries: [],
        missing_teeth: [],
        alveolar: [],
        dental_other: [],
        dental_doctor_opinion: [],
        height: [],
        waist: [],
        weight: [],
        skin: [],
        lymph: [],
        thyroid: [],
        spine: [],
        limb: [],
        joint: [],
        flat_feet: [],
        surgery_other: [],
        surgery_doctor_opinion: [],
        blood_pressure_high: [],
        blood_pressure_low: [],
        pulse: [],
        pulse_doctor_opinion: [],
        developmental_nutrition: [],
        nerves_and_spirits: [],
        lung_and_respiratory_tract: [],
        heart_and_blood_vessels: [],
        liver: [],
        spleen: [],
        other: [],
        internal_doctor_opinion: [],
        laboratory_examination: [],
        laboratory_doctor_opinion: [],
        chest_radiography: [],
        chest_radiography_doctor_opinion: [],
        other_examination: [],
        other_doctor_opinion: [],
        conclusions: [],
        hospital_opinion: [{
          required: true,
          message: '请输入医院意见',
          trigger: 'blur'
        }],
        leader_audit: [{
          required: true,
          type: 'array',
          message: '请至少选择一个leader_audit',
          trigger: 'change'
        }],
      },
      colorOptions: [{
        "label": "红",
        "value": 1
      }, {
        "label": "绿",
        "value": 1
      }, {
        "label": "紫",
        "value": 1
      }, {
        "label": "蓝",
        "value": 1
      }, {
        "label": "黄",
        "value": 1
      }],
      leader_auditOptions: [{
        "label": "通过",
        "value": "通过",
        "id": 100
      }, {
        "label": "驳回",
        "value": "眼科",
        "id": 101,
        "children": [{
          "label": "眼科",
          "value": "眼科",
          "id": 102
        }, {
          "label": "化验科",
          "value": "化验科",
          "id": 103
        }, {
          "label": "耳鼻喉",
          "value": "耳鼻喉",
          "id": 105
        }, {
          "label": "口腔科",
          "value": "口腔科",
          "id": 106
        }, {
          "label": "外科",
          "value": "外科",
          "id": 107
        }, {
          "label": "内科",
          "value": "内科",
          "id": 108
        }, {
          "label": "血压脉搏科",
          "value": "血压脉搏科",
          "id": 109
        }, {
          "label": "胸部放射科",
          "value": "胸部放射科",
          "id": 110
        }, {
          "label": "其他科",
          "value": "其他科",
          "id": 111
        }]
      }],
      leader_auditProps: {
        "multiple": false
      },
    }
  },
  computed: {},
  watch: {},
  created() {
    const studentId = this.$route.params && this.$route.params.studentId;
    getData(studentId).then(response => {
      this.formData = response.data;
      this.open = true;
      this.title = "体检详情";
    });
  },
  mounted() {},
  methods: {
    submitForm() {
      this.$refs['elForm'].validate(valid => {
        if (!valid) return
        // TODO 提交表单
      })
      this.$router.push({ path: "/leader/index" || "/" }).catch(()=>{});
    },
    resetForm() {
      this.$refs['elForm'].resetFields()
    },
  }
}

</script>
<style>
</style>
