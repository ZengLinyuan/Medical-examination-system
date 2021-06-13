<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px">
        <el-col :span="12">
          <el-form-item label="左眼视力" prop="field101">
            <el-input v-model="formData.field101" placeholder="请输入左眼视力" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="左矫正视力" prop="field102">
            <el-input v-model="formData.field102" placeholder="请输入左矫正视力" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="右眼视力" prop="field103">
            <el-input v-model="formData.field103" placeholder="请输入右眼视力" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="右矫正视力" prop="field104">
            <el-input v-model="formData.field104" placeholder="请输入右矫正视力" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="其他眼病" prop="field105">
            <el-input v-model="formData.field105" placeholder="请输入其他眼病" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="红色色觉" prop="field106">
            <el-input v-model="formData.field106" placeholder="请输入红色色觉" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="绿色色觉" prop="field107">
            <el-input v-model="formData.field107" placeholder="请输入绿色色觉" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="紫色色觉" prop="field108">
            <el-input v-model="formData.field108" placeholder="请输入紫色色觉" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="蓝色色觉" prop="field109">
            <el-input v-model="formData.field109" placeholder="请输入蓝色色觉" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="黄色色觉" prop="field110">
            <el-input v-model="formData.field110" placeholder="请输入黄色色觉" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="field111">
            <el-input v-model="formData.field111" placeholder="请输入医生意见" readonly :style="{width: '100%'}">
              <template slot="append">眼科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="咽喉" prop="field112">
            <el-input v-model="formData.field112" placeholder="请输入咽喉" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="口吃" prop="field113">
            <el-input v-model="formData.field113" placeholder="请输入口吃" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="field118">
            <el-input v-model="formData.field118" placeholder="请输入医生意见" readonly :style="{width: '100%'}">
              <template slot="append">耳鼻喉</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="龋 齿" prop="field119">
            <el-input v-model="formData.field119" placeholder="请输入龋 齿" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="缺 齿" prop="field120">
            <el-input v-model="formData.field120" placeholder="请输入缺 齿" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="齿 槽" prop="field121">
            <el-input v-model="formData.field121" placeholder="请输入齿 槽" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="其他" prop="field123">
            <el-input v-model="formData.field123" placeholder="请输入其他" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="field124">
            <el-input v-model="formData.field124" placeholder="请输入医生意见" readonly :style="{width: '100%'}">
              <template slot="append">口腔</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="身 长" prop="field114">
            <el-input v-model="formData.field114" placeholder="请输入身 长" readonly :style="{width: '100%'}">
              <template slot="append">公分</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="腰 围" prop="field115">
            <el-input v-model="formData.field115" placeholder="请输入腰 围" readonly :style="{width: '100%'}">
              <template slot="append">公分</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="体 重" prop="field116">
            <el-input v-model="formData.field116" placeholder="请输入体 重" readonly :style="{width: '100%'}">
              <template slot="append">公斤</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="左眼视力" prop="field125">
            <el-input v-model="formData.field125" placeholder="请输入左眼视力" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="淋 巴" prop="field136">
            <el-input v-model="formData.field136" placeholder="请输入淋 巴" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="甲状腺" prop="field137">
            <el-input v-model="formData.field137" placeholder="请输入甲状腺" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="脊 柱" prop="field139">
            <el-input v-model="formData.field139" placeholder="请输入脊 柱" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="四 肢" prop="field138">
            <el-input v-model="formData.field138" placeholder="请输入四 肢" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="关 节" prop="field135">
            <el-input v-model="formData.field135" placeholder="请输入关 节" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="平拓足" prop="field140">
            <el-input v-model="formData.field140" placeholder="请输入平拓足" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="其他" prop="field141">
            <el-input v-model="formData.field141" placeholder="请输入其他" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="field142">
            <el-input v-model="formData.field142" placeholder="请输入医生意见" readonly :style="{width: '100%'}">
              <template slot="append">外科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="血压" prop="field126">
            <el-input v-model="formData.field126" placeholder="请输入血压" readonly :style="{width: '100%'}">
              <template slot="append">nnHg</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="脉搏" prop="field127">
            <el-input v-model="formData.field127" placeholder="请输入脉搏" readonly :style="{width: '100%'}">
              <template slot="append">次/分</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="field143">
            <el-input v-model="formData.field143" placeholder="请输入医生意见" readonly :style="{width: '100%'}">
              <template slot="append">血压与脉搏</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="发育营养" prop="field128">
            <el-input v-model="formData.field128" placeholder="请输入发育营养" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="神经及精神" prop="field129">
            <el-input v-model="formData.field129" placeholder="请输入神经及精神" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="肺及呼吸道" prop="field130">
            <el-input v-model="formData.field130" placeholder="请输入肺及呼吸道" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="心脏及血管" prop="field131">
            <el-input v-model="formData.field131" placeholder="请输入心脏及血管" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="肝" prop="field132">
            <el-input v-model="formData.field132" placeholder="请输入肝" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="脾" prop="field133">
            <el-input v-model="formData.field133" placeholder="请输入脾" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="其他" prop="field144">
            <el-input v-model="formData.field144" placeholder="请输入其他" readonly :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="field145">
            <el-input v-model="formData.field145" placeholder="请输入医生意见" readonly :style="{width: '100%'}">
              <template slot="append">内科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="化验检查" prop="field146">
            <el-input v-model="formData.field146" type="textarea" placeholder="请输入化验检查" readonly
              :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="field147">
            <el-input v-model="formData.field147" placeholder="请输入医生意见" readonly :style="{width: '100%'}">
              <template slot="append">化验科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="胸部放射检查" prop="field148">
            <el-input v-model="formData.field148" type="textarea" placeholder="请输入胸部放射检查" readonly
              :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="field149">
            <el-input v-model="formData.field149" placeholder="请输入医生意见" readonly :style="{width: '100%'}">
              <template slot="append">胸部放射科</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="其他检查" prop="field150">
            <el-input v-model="formData.field150" type="textarea" placeholder="请输入其他检查" readonly
              :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="医生意见" prop="field151">
            <el-input v-model="formData.field151" placeholder="请输入医生意见" readonly :style="{width: '100%'}">
              <template slot="append">其他</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="检查结论（负责医生）" prop="field152">
            <el-input v-model="formData.field152" type="textarea" placeholder="请输入检查结论（负责医生）" readonly
              :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="检查结论（院长）" prop="field153">
            <el-input v-model="formData.field153" type="textarea" placeholder="请输入检查结论（院长）"
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
  props: [],
  data() {
    return {
      formData: {
        field101: undefined,
        field102: undefined,
        field103: undefined,
        field104: undefined,
        field105: undefined,
        field106: undefined,
        field107: undefined,
        field108: undefined,
        field109: undefined,
        field110: undefined,
        field111: undefined,
        field112: undefined,
        field113: undefined,
        field118: undefined,
        field119: undefined,
        field120: undefined,
        field121: undefined,
        field123: undefined,
        field124: undefined,
        field114: undefined,
        field115: undefined,
        field116: undefined,
        field125: undefined,
        field136: undefined,
        field137: undefined,
        field139: undefined,
        field138: undefined,
        field135: undefined,
        field140: undefined,
        field141: undefined,
        field142: undefined,
        field126: undefined,
        field127: undefined,
        field143: undefined,
        field128: undefined,
        field129: undefined,
        field130: undefined,
        field131: undefined,
        field132: undefined,
        field133: undefined,
        field144: undefined,
        field145: undefined,
        field146: undefined,
        field147: undefined,
        field148: undefined,
        field149: undefined,
        field150: undefined,
        field151: undefined,
        field152: undefined,
        field153: '体检结果符合相关健康要求',
      },
      rules: {
        field101: [],
        field102: [],
        field103: [],
        field104: [],
        field105: [],
        field106: [],
        field107: [],
        field108: [],
        field109: [],
        field110: [],
        field111: [],
        field112: [],
        field113: [],
        field118: [],
        field119: [],
        field120: [],
        field121: [],
        field123: [],
        field124: [],
        field114: [],
        field115: [],
        field116: [],
        field125: [],
        field136: [],
        field137: [],
        field139: [],
        field138: [],
        field135: [],
        field140: [],
        field141: [],
        field142: [],
        field126: [],
        field127: [],
        field143: [],
        field128: [],
        field129: [],
        field130: [],
        field131: [],
        field132: [],
        field133: [],
        field144: [],
        field145: [],
        field146: [],
        field147: [],
        field148: [],
        field149: [],
        field150: [],
        field151: [],
        field152: [],
        field153: [{
          required: true,
          message: '请输入检查结论（院长）',
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
