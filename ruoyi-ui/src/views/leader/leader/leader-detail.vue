<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px">
        <el-col :span="12">
          <el-form-item label="左眼视力" prop="sightLeftNoglasses">
            <el-input v-model="ophthalmic.sightLeftNoglasses" placeholder="请输入左眼视力" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="左矫正视力" prop="sightLeftWithglasses">
            <el-input v-model="ophthalmic.sightLeftWithglasses" placeholder="请输入左矫正视力" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="右眼视力" prop="sightRightNoglasses">
            <el-input v-model="ophthalmic.sightRightNoglasses" placeholder="请输入右眼视力" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="右矫正视力" prop="sightRightWithglasses">
            <el-input v-model="ophthalmic.sightRightWithglasses" placeholder="请输入右矫正视力" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="其他眼病" prop="eyeIllness">
            <el-input v-model="ophthalmic.eyeIllness" placeholder="请输入其他眼病" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="彩色编码" prop="color">
            <el-checkbox-group v-model="color" :max="5" size="medium">
              <el-checkbox v-for="(item, index) in colorOptions" :key="index" :label="item.value"
                :disabled="item.disabled">{{item.label}}</el-checkbox>
            </el-checkbox-group>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctorOpinion">
            <el-input v-model="ophthalmic.doctorOpinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">眼科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="左耳听力" prop="hearingLeft">
            <el-input v-model="entDepartment.hearingLeft" placeholder="请输入左耳听力" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="右耳听力" prop="hearingRight">
            <el-input v-model="entDepartment.hearingRight" placeholder="请输入右耳听力" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="耳 疾" prop="earIllness">
            <el-input v-model="entDepartment.earIllness" placeholder="请输入耳 疾" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="嗅 觉" prop="smellSense">
            <el-input v-model="entDepartment.smellSense" placeholder="请输入嗅 觉" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="鼻及鼻窦疾病" prop="noseIllness">
            <el-input v-model="entDepartment.noseIllness" placeholder="请输入鼻及鼻窦疾病" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="咽 喉" prop="throat">
            <el-input v-model="entDepartment.throat" placeholder="请输入咽 喉" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="口 吃" prop="stutter">
            <el-input v-model="entDepartment.stutter" placeholder="请输入口 吃" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctorOpinionn">
            <el-input v-model="entDepartment.doctorOpinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">耳鼻喉</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="龋 齿" prop="dentalCaries">
            <el-input v-model="dentalDepartment.dentalCaries" placeholder="请输入龋 齿" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="缺 齿" prop="missingTeeth">
            <el-input v-model="dentalDepartment.missingTeeth" placeholder="请输入缺 齿" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="齿 槽" prop="alveolar">
            <el-input v-model="dentalDepartment.alveolar" placeholder="请输入齿 槽" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="其 他" prop="other">
            <el-input v-model="dentalDepartment.other" placeholder="请输入其 他" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctorOpinion">
            <el-input v-model="dentalDepartment.doctorOpinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">口腔</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="身高" prop="height">
            <el-input v-model="surgery.height" placeholder="请输入身高" readonly :style="{width: '100%'}">
              <template slot="append">公分</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="腰围" prop="waist">
            <el-input v-model="surgery.waist" placeholder="请输入腰围" readonly :style="{width: '100%'}">
              <template slot="append">公分</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="体重" prop="weight">
            <el-input v-model="surgery.weight" placeholder="请输入体重" readonly :style="{width: '100%'}">
              <template slot="append">公斤</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="皮肤" prop="skin">
            <el-input v-model="surgery.skin" placeholder="请输入皮肤" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="淋 巴" prop="lymph">
            <el-input v-model="surgery.lymph" placeholder="请输入淋 巴" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="甲状腺" prop="thyroid">
            <el-input v-model="surgery.thyroid" placeholder="请输入甲状腺" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="脊 柱" prop="spine">
            <el-input v-model="surgery.spine" placeholder="请输入脊 柱" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="四肢" prop="limb">
            <el-input v-model="surgery.limb" placeholder="请输入四肢" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="关 节" prop="joint">
            <el-input v-model="surgery.joint" placeholder="请输入关 节" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="平拓足" prop="flatFeet">
            <el-input v-model="surgery.flatFeet" placeholder="请输入平拓足" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="其 他" prop="other">
            <el-input v-model="surgery.other" placeholder="请输入其 他" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctorOpinion">
            <el-input v-model="surgery.doctorOpinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">外科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="高血压" prop="bloodPressureHigh">
            <el-input v-model="bloodPressureAndPulse.bloodPressureHigh" placeholder="请输入高血压" readonly
              :style="{width: '100%'}">
              <template slot="append">mmHg</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="低血压" prop="bloodPressureLow">
            <el-input v-model="bloodPressureAndPulse.bloodPressureLow" placeholder="请输入低血压" readonly
              :style="{width: '100%'}">
              <template slot="append">mmHg</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="脉搏" prop="pulse">
            <el-input v-model="bloodPressureAndPulse.pulse" placeholder="请输入脉搏" readonly :style="{width: '100%'}">
              <template slot="append">次/分</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctorOpinion">
            <el-input v-model="bloodPressureAndPulse.doctorOpinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">血压脉搏科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="发育营养" prop="developmentalNutrition">
            <el-input v-model="internalMedicine.developmentalNutrition" placeholder="请输入发育营养" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="神经及精神" prop="nervesAndSpirits">
            <el-input v-model="internalMedicine.nervesAndSpirits" placeholder="请输入神经及精神" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="肺及呼吸道" prop="lungAndRespiratoryTract">
            <el-input v-model="internalMedicine.lungAndRespiratoryTract" placeholder="请输入肺及呼吸道" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="心脏及血管" prop="heartAndBloodVessels">
            <el-input v-model="internalMedicine.heartAndBloodVessels" placeholder="请输入心脏及血管" readonly
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="肝" prop="liver">
            <el-input v-model="internalMedicine.liver" placeholder="请输入肝" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="脾" prop="spleen">
            <el-input v-model="internalMedicine.spleen" placeholder="请输入脾" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="其 他" prop="other">
            <el-input v-model="internalMedicine.other" placeholder="请输入其 他" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctorOpinion">
            <el-input v-model="internalMedicine.doctorOpinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">内科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="化验检查" prop="laboratoryExamination">
            <el-input v-model="laboratory.laboratoryExamination" type="textarea" placeholder="请输入化验检查" readonly
              :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctorOpinion">
            <el-input v-model="laboratory.doctorOpinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">化验科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="胸部放射检查" prop="chestRadiography">
            <el-input v-model="chestRadiology.chestRadiography" type="textarea" placeholder="请输入胸部放射检查" readonly
              :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctorOpinion">
            <el-input v-model="chestRadiology.doctorOpinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">胸部放射科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="其他检查" prop="otherExamination">
            <el-input v-model="other.otherExamination" type="textarea" placeholder="请输入其他检查" readonly
              :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="doctorOpinion">
            <el-input v-model="other.doctorOpinion" placeholder="请输入医生意见" readonly
              :style="{width: '100%'}">
              <template slot="append">其他科</template>
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
          <el-form-item label="医院意见" prop="hospitalOpinion">
            <el-input v-model="formData.hospitalOpinion" placeholder="请输入医院意见" clearable
              :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="是否驳回" prop="leaderAudit">
            <el-cascader v-model="formData.leaderAudit" :options="leaderAuditOptions"
              :props="leaderAuditProps" :style="{width: '100%'}" placeholder="请选择是否驳回" clearable>
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
  import {getDetailData} from "../../../api/health/form";
  import {editDepartment} from "../../../api/leader/leader"

  export default {
  name: "Detail",
  components: {},
  props: [],
  data() {
    return {
      inforData:{
        studentId:null,
        diagnosisTime:null,
        deptName:null,
        opinion:null,
      },
      ophthalmic:{
        sightLeftNoglasses:undefined,
        sightRightNoglasses:undefined,
        sightRightNoglasses: undefined,
        sightRightWithglasses: undefined,
        eyeIllness: undefined,
        colorVisionRed:undefined,
        colorVisionGreen:undefined,
        colorVisionPurple:undefined,
        colorVisionBlue:undefined,
        colorVisionRed:undefined,
        colorVisionYellow:undefined,
        doctorOpinion: undefined,
      },
      color: [],

      entDepartment:{
        hearingLeft: undefined,
        hearingRight: undefined,
        earIllness: undefined,
        smellSense: undefined,
        noseIllness: undefined,
        throat: undefined,
        stutter: undefined,
        doctorOpinion: undefined,
      },

      dentalDepartment:{
        dentalCaries: undefined,
        missingTeeth: undefined,
        alveolar: undefined,
        other: undefined,
        doctorOpinion: undefined,
      },

      surgery:{
        height: undefined,
        waist: undefined,
        weight: undefined,
        skin: undefined,
        lymph: undefined,
        thyroid: undefined,
        spine: undefined,
        limb: undefined,
        joint: undefined,
        flatFeet: undefined,
        other: undefined,
        doctorOpinion: undefined,
      },

      bloodPressureAndPulse:{
        bloodPressureHigh: undefined,
        bloodPressureLow: undefined,
        pulse: undefined,
        doctorOpinion: undefined,
      },

      internalMedicine:{
        developmentalNutrition: undefined,
        nervesAndSpirits: undefined,
        lungAndRespiratoryTract: undefined,
        heartAndBloodVessels: undefined,
        liver: undefined,
        spleen: undefined,
        other: undefined,
        doctorOpinion: undefined,
      },

      laboratory:{
        laboratoryExamination: undefined,
        doctorOpinion: undefined,
      },

      chestRadiology:{
        chestRadiography: undefined,
        doctorOpinion: undefined,
      },

      other:{
        otherExamination: undefined,
        doctorOpinion: undefined,
      },

      formData: {
        studentId:null,
        diagnosisTime:null,
        conclusions: '', //负责医生意见
        leaderAudit: [],
        deptName: '',
        hospitalOpinion: '体检结果符合相关健康要求', //医院领导意见
      },
      rules: {
        sightLeftNoglasses: [],
        sightLeftWithglasses: [],
        sightRightNoglasses: [],
        sightRightWithglasses: [],
        eyeIllness: [],
        color: [],
        eyeDoctorOpinion: [],
        hearingLeft: [],
        hearingRight: [],
        earIllness: [],
        smellSense: [],
        noseIllness: [],
        throat: [],
        stutter: [],
        doctorOpinion: [],
        dentalCaries: [],
        missingTeeth: [],
        alveolar: [],
        dentalOther: [],
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
        hospitalOpinion: [{
          required: true,
          message: '请输入医院意见',
          trigger: 'blur'
        }],
        leaderAudit: [{
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
      leaderAuditOptions: [{
        "label": "通过",
        "value": 100,
      }, {
        "label": "驳回",
        "value": 101,
        "children": [{
          "label": "眼科",
          "value": 101,
        }, {
          "label": "化验科",
          "value": 102,
        }, {
          "label": "耳鼻喉",
          "value": 103,
        }, {
          "label": "口腔科",
          "value": 105,
        }, {
          "label": "外科",
          "value": 104,
        }, {
          "label": "内科",
          "value": 106,
        }, {
          "label": "血压脉搏科",
          "value": 107,
        }, {
          "label": "胸部放射科",
          "value": 108,
        }, {
          "label": "其他科",
          "value": 109,
        }]
      }],
      leaderAuditProps: {
        "multiple": false
      },
    }
  },
  created:function () {
    this.inforData.studentId = this.$route.query.studentId;
    this.inforData.diagnosisTime = this.$route.query.diagnosisTime;
    console.log(this.inforData.studentId)
    console.log(this.inforData.diagnosisTime)
    getDetailData(this.inforData).then(response => {
      this.ophthalmic = response.ophthalmic;
      if(this.ophthalmic.colorVisionRed == 1){
        this.color.push(1);
      }
      if(this.ophthalmic.colorVisionGreen == 1){
        this.color.push(2);
      }
      if(this.ophthalmic.colorVisionPurple ==1 ){
        this.color.push(3);
      }
      if(this.ophthalmic.colorVisionBlue == 1 ){
        this.color.push(4);
      }
      if(this.ophthalmic.colorVisionYellow == 1){
        this.color.push(5);
      }
      this.entDepartment = response.entDepartment;
      this.dentalDepartment = response.dentalDepartment;
      this.surgery = response.surgery;
      this.bloodPressureAndPulse = response.bloodPressureAndPulse;
      this.internalMedicine = response.internalMedicine;
      this.laboratory = response.laboratory;
      this.chestRadiology = response.chestRadiology;
      this.other = response.other;
      this.formData = response.physicalExaminationForm;
      this.open = true;
      this.title = "体检详情";
    });
  },
  methods: {
    submitForm() {
      this.formData.studentId = this.inforData.studentId;
      this.formData.diagnosisTime = this.inforData.diagnosisTime;
      if(this.formData.leaderAudit[0] == 100){
        this.formData.deptName = this.formData.leaderAudit[0]
      }
      if(this.formData.leaderAudit[0] == 101){
        this.formData.deptName = this.formData.leaderAudit[1]
      }
      //this.formData.deptName = this.formData.leaderAudit;
      //this.msgSuccess("科室："+ this.formData.deptName);
      editDepartment(this.formData).then(response => {
        this.msgSuccess("提交成功");
        this.$router.push({ path: "/leader/index" || "/" }).catch(()=>{});
      });
    },
    resetForm() {
      this.$refs['elForm'].resetFields()
    },
  }
}
</script>
<style>
</style>
