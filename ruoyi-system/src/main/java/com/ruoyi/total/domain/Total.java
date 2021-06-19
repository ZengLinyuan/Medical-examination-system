package com.ruoyi.total.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;

import java.math.BigDecimal;
import java.util.Date;

public class Total {

    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String id;

    /** $column.columnComment */
    @Excel(name = "学院", readConverterExp = "学院.readConverterExp()")
    private String college;

    /** $column.columnComment */
    @Excel(name = "专业", readConverterExp = "专业.readConverterExp()")
    private String major;

    /** $column.columnComment */
    @Excel(name = "班级", readConverterExp = "班级.readConverterExp()")
    private String classroom;

    /** $column.columnComment */
    @Excel(name = "学号", readConverterExp = "学号.readConverterExp()")
    private Long studentId;

    /** $column.columnComment */
    @Excel(name = "姓名", readConverterExp = "姓名.readConverterExp()")
    private String name;

    /** $column.columnComment */
    @Excel(name = "性别", readConverterExp = "性别.readConverterExp()")
    private String gender;

    /** $column.columnComment */
    @Excel(name = "出生日期", readConverterExp = "出生日期.readConverterExp()")
    private Date birthDate;

    /** $column.columnComment */
    @Excel(name = "年龄", readConverterExp = "年龄.readConverterExp()")
    private Long age;

    /** $column.columnComment */
    @Excel(name = "文化程度", readConverterExp = "文化程度.readConverterExp()")
    private String degreeOfEducation;

    /** $column.columnComment */
    @Excel(name = "民族", readConverterExp = "民族.readConverterExp()")
    private String nation;

    /** $column.columnComment */
    @Excel(name = "职业", readConverterExp = "职业.readConverterExp()")
    private String occupation;

    /** $column.columnComment */
    @Excel(name = "籍贯", readConverterExp = "籍贯.readConverterExp()")
    private String nativePlace;

    /** $column.columnComment */
    @Excel(name = "地址", readConverterExp = "地址.readConverterExp()")
    private String address;

    /** $column.columnComment */
    @Excel(name = "毕业学校或工作单位", readConverterExp = "毕业学校或工作单位.readConverterExp()")
    private String draduationSchoolOrWorkUnit;

    /** $column.columnComment */
    @Excel(name = "既往病史", readConverterExp = "既往病史.readConverterExp()")
    private String pastMedicalHistory;

    /** 左视力 */
    @Excel(name = "左视力")
    private BigDecimal sightLeftNoglasses;

    /** 右视力 */
    @Excel(name = "右视力")
    private BigDecimal sightRightNoglasses;

    /** 左矫正视力 */
    @Excel(name = "左矫正视力")
    private BigDecimal sightLeftWithglasses;

    /** 右矫正视力 */
    @Excel(name = "右矫正视力")
    private BigDecimal sightRightWithglasses;

    /** 其他眼病 */
    @Excel(name = "其他眼病")
    private String eyeIllness;

    /** 红色色觉 */
    @Excel(name = "红色色觉")
    private Integer colorVisionRed;

    /** 绿色色觉 */
    @Excel(name = "绿色色觉")
    private Integer colorVisionGreen;

    /** 紫色色觉 */
    @Excel(name = "紫色色觉")
    private Integer colorVisionPurple;

    /** 蓝色色觉 */
    @Excel(name = "蓝色色觉")
    private Integer colorVisionBlue;

    /** 黄色色觉 */
    @Excel(name = "黄色色觉")
    private Integer colorVisionYellow;

    /** 医生意见 */
    @Excel(name = "眼科医生意见")
    private String eye_doctorOpinion;


    /** 左耳听力 */
    @Excel(name = "左耳听力")
    private Long hearingLeft;

    /** 右耳听力 */
    @Excel(name = "右耳听力")
    private Long hearingRight;

    /** 耳疾 */
    @Excel(name = "耳疾")
    private String earIllness;

    /** 嗅觉 */
    @Excel(name = "嗅觉")
    private String smellSense;

    /** 鼻及鼻窦疾病 */
    @Excel(name = "鼻及鼻窦疾病")
    private String noseIllness;

    /** 咽喉 */
    @Excel(name = "咽喉")
    private String throat;

    /** 口吃 */
    @Excel(name = "口吃")
    private String stutter;

    /** 医生意见 */
    @Excel(name = "耳鼻喉医生意见")
    private String ent_doctorOpinion;

    /** 龋齿 */
    @Excel(name = "龋齿")
    private String dentalCaries;

    /** 缺齿 */
    @Excel(name = "缺齿")
    private String missingTeeth;

    /** 齿槽 */
    @Excel(name = "齿槽")
    private String alveolar;

    /** 其他 */
    @Excel(name = "其他")
    private String other;

    /** 医生意见 */
    @Excel(name = "口腔医生意见")
    private String dental_doctorOpinion;

    /** 身长 */
    @Excel(name = "身长")
    private BigDecimal height;

    /** 腰围 */
    @Excel(name = "腰围")
    private BigDecimal waist;

    /** 体重 */
    @Excel(name = "体重")
    private BigDecimal weight;

    /** 皮肤 */
    @Excel(name = "皮肤")
    private String skin;

    /** 淋巴 */
    @Excel(name = "淋巴")
    private String lymph;

    /** 甲状腺 */
    @Excel(name = "甲状腺")
    private String thyroid;

    /** 脊柱 */
    @Excel(name = "脊柱")
    private String spine;

    /** 四肢 */
    @Excel(name = "四肢")
    private String limb;

    /** 关节 */
    @Excel(name = "关节")
    private String joint;

    /** 平跖足 */
    @Excel(name = "平拓足")
    private String flatFeet;

    /** 其它 */
    @Excel(name = "外科其他")
    private String surgery_other;

    /** 医生意见 */
    @Excel(name = "外科医生意见")
    private String surgery_doctorOpinion;

    /** 高压 */
    @Excel(name = "高压")
    private BigDecimal bloodPressureHigh;

    /** 低压 */
    @Excel(name = "低压")
    private BigDecimal bloodPressureLow;

    /** 脉搏 */
    @Excel(name = "脉搏")
    private Long pulse;

    /** 医生意见 */
    @Excel(name = "血压脉搏医生意见")
    private String pulse_doctorOpinion;

    /** 发育营养 */
    @Excel(name = "发育营养")
    private String developmentalNutrition;

    /** 神经及精神 */
    @Excel(name = "神经及精神")
    private String nervesAndSpirits;

    /** 肺及呼吸道 */
    @Excel(name = "肺及呼吸道")
    private String lungAndRespiratoryTract;

    /** 心脏及血管 */
    @Excel(name = "心脏及血管")
    private String heartAndBloodVessels;

    /** 肝 */
    @Excel(name = "肝")
    private String liver;

    /** 脾 */
    @Excel(name = "脾")
    private String spleen;

    /** 其他 */
    @Excel(name = "内科其他")
    private String internal_other;

    /** 医生意见 */
    @Excel(name = "内科医生意见")
    private String internal_doctorOpinion;

    /** 化验检查 */
    @Excel(name = "化验检查")
    private String laboratoryExamination;

    /** 医生意见 */
    @Excel(name = "化验医生意见")
    private String laboratory_doctorOpinion;

    /** 胸部放射检查 */
    @Excel(name = "胸部放射检查")
    private String chestRadiography;

    /** 医生意见 */
    @Excel(name = "胸部放射医生意见")
    private String chest_doctorOpinion;

    /** 其他检查 */
    @Excel(name = "其他检查")
    private String otherExamination;

    /** 医生意见 */
    @Excel(name = "其他医生意见")
    private String other_doctorOpinion;

    @Excel(name = "负责医生结论")
    private String conclusions;


    @Excel(name = "医院意见")
    private String hospitalOpinion;


    @Excel(name = "体检时间")
    private Date submitTimeLeader;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getClassroom() {
        return classroom;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public Long getAge() {
        return age;
    }

    public void setAge(Long age) {
        this.age = age;
    }

    public String getDegreeOfEducation() {
        return degreeOfEducation;
    }

    public void setDegreeOfEducation(String degreeOfEducation) {
        this.degreeOfEducation = degreeOfEducation;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getNativePlace() {
        return nativePlace;
    }

    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDraduationSchoolOrWorkUnit() {
        return draduationSchoolOrWorkUnit;
    }

    public void setDraduationSchoolOrWorkUnit(String draduationSchoolOrWorkUnit) {
        this.draduationSchoolOrWorkUnit = draduationSchoolOrWorkUnit;
    }

    public String getPastMedicalHistory() {
        return pastMedicalHistory;
    }

    public void setPastMedicalHistory(String pastMedicalHistory) {
        this.pastMedicalHistory = pastMedicalHistory;
    }

    public BigDecimal getSightLeftNoglasses() {
        return sightLeftNoglasses;
    }

    public void setSightLeftNoglasses(BigDecimal sightLeftNoglasses) {
        this.sightLeftNoglasses = sightLeftNoglasses;
    }

    public BigDecimal getSightRightNoglasses() {
        return sightRightNoglasses;
    }

    public void setSightRightNoglasses(BigDecimal sightRightNoglasses) {
        this.sightRightNoglasses = sightRightNoglasses;
    }

    public BigDecimal getSightLeftWithglasses() {
        return sightLeftWithglasses;
    }

    public void setSightLeftWithglasses(BigDecimal sightLeftWithglasses) {
        this.sightLeftWithglasses = sightLeftWithglasses;
    }

    public BigDecimal getSightRightWithglasses() {
        return sightRightWithglasses;
    }

    public void setSightRightWithglasses(BigDecimal sightRightWithglasses) {
        this.sightRightWithglasses = sightRightWithglasses;
    }

    public String getEyeIllness() {
        return eyeIllness;
    }

    public void setEyeIllness(String eyeIllness) {
        this.eyeIllness = eyeIllness;
    }

    public Integer getColorVisionRed() {
        return colorVisionRed;
    }

    public void setColorVisionRed(Integer colorVisionRed) {
        this.colorVisionRed = colorVisionRed;
    }

    public Integer getColorVisionGreen() {
        return colorVisionGreen;
    }

    public void setColorVisionGreen(Integer colorVisionGreen) {
        this.colorVisionGreen = colorVisionGreen;
    }

    public Integer getColorVisionPurple() {
        return colorVisionPurple;
    }

    public void setColorVisionPurple(Integer colorVisionPurple) {
        this.colorVisionPurple = colorVisionPurple;
    }

    public Integer getColorVisionBlue() {
        return colorVisionBlue;
    }

    public void setColorVisionBlue(Integer colorVisionBlue) {
        this.colorVisionBlue = colorVisionBlue;
    }

    public Integer getColorVisionYellow() {
        return colorVisionYellow;
    }

    public void setColorVisionYellow(Integer colorVisionYellow) {
        this.colorVisionYellow = colorVisionYellow;
    }

    public String getEye_doctorOpinion() {
        return eye_doctorOpinion;
    }

    public void setEye_doctorOpinion(String eye_doctorOpinion) {
        this.eye_doctorOpinion = eye_doctorOpinion;
    }

    public Long getHearingLeft() {
        return hearingLeft;
    }

    public void setHearingLeft(Long hearingLeft) {
        this.hearingLeft = hearingLeft;
    }

    public Long getHearingRight() {
        return hearingRight;
    }

    public void setHearingRight(Long hearingRight) {
        this.hearingRight = hearingRight;
    }

    public String getEarIllness() {
        return earIllness;
    }

    public void setEarIllness(String earIllness) {
        this.earIllness = earIllness;
    }

    public String getSmellSense() {
        return smellSense;
    }

    public void setSmellSense(String smellSense) {
        this.smellSense = smellSense;
    }

    public String getNoseIllness() {
        return noseIllness;
    }

    public void setNoseIllness(String noseIllness) {
        this.noseIllness = noseIllness;
    }

    public String getThroat() {
        return throat;
    }

    public void setThroat(String throat) {
        this.throat = throat;
    }

    public String getStutter() {
        return stutter;
    }

    public void setStutter(String stutter) {
        this.stutter = stutter;
    }

    public String getEnt_doctorOpinion() {
        return ent_doctorOpinion;
    }

    public void setEnt_doctorOpinion(String ent_doctorOpinion) {
        this.ent_doctorOpinion = ent_doctorOpinion;
    }

    public String getDentalCaries() {
        return dentalCaries;
    }

    public void setDentalCaries(String dentalCaries) {
        this.dentalCaries = dentalCaries;
    }

    public String getMissingTeeth() {
        return missingTeeth;
    }

    public void setMissingTeeth(String missingTeeth) {
        this.missingTeeth = missingTeeth;
    }

    public String getAlveolar() {
        return alveolar;
    }

    public void setAlveolar(String alveolar) {
        this.alveolar = alveolar;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

    public String getDental_doctorOpinion() {
        return dental_doctorOpinion;
    }

    public void setDental_doctorOpinion(String dental_doctorOpinion) {
        this.dental_doctorOpinion = dental_doctorOpinion;
    }

    public BigDecimal getHeight() {
        return height;
    }

    public void setHeight(BigDecimal height) {
        this.height = height;
    }

    public BigDecimal getWaist() {
        return waist;
    }

    public void setWaist(BigDecimal waist) {
        this.waist = waist;
    }

    public BigDecimal getWeight() {
        return weight;
    }

    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }

    public String getSkin() {
        return skin;
    }

    public void setSkin(String skin) {
        this.skin = skin;
    }

    public String getLymph() {
        return lymph;
    }

    public void setLymph(String lymph) {
        this.lymph = lymph;
    }

    public String getThyroid() {
        return thyroid;
    }

    public void setThyroid(String thyroid) {
        this.thyroid = thyroid;
    }

    public String getSpine() {
        return spine;
    }

    public void setSpine(String spine) {
        this.spine = spine;
    }

    public String getLimb() {
        return limb;
    }

    public void setLimb(String limb) {
        this.limb = limb;
    }

    public String getJoint() {
        return joint;
    }

    public void setJoint(String joint) {
        this.joint = joint;
    }

    public String getFlatFeet() {
        return flatFeet;
    }

    public void setFlatFeet(String flatFeet) {
        this.flatFeet = flatFeet;
    }

    public String getSurgery_other() {
        return surgery_other;
    }

    public void setSurgery_other(String surgery_other) {
        this.surgery_other = surgery_other;
    }

    public String getSurgery_doctorOpinion() {
        return surgery_doctorOpinion;
    }

    public void setSurgery_doctorOpinion(String surgery_doctorOpinion) {
        this.surgery_doctorOpinion = surgery_doctorOpinion;
    }

    public BigDecimal getBloodPressureHigh() {
        return bloodPressureHigh;
    }

    public void setBloodPressureHigh(BigDecimal bloodPressureHigh) {
        this.bloodPressureHigh = bloodPressureHigh;
    }

    public BigDecimal getBloodPressureLow() {
        return bloodPressureLow;
    }

    public void setBloodPressureLow(BigDecimal bloodPressureLow) {
        this.bloodPressureLow = bloodPressureLow;
    }

    public Long getPulse() {
        return pulse;
    }

    public void setPulse(Long pulse) {
        this.pulse = pulse;
    }

    public String getPulse_doctorOpinion() {
        return pulse_doctorOpinion;
    }

    public void setPulse_doctorOpinion(String pulse_doctorOpinion) {
        this.pulse_doctorOpinion = pulse_doctorOpinion;
    }

    public String getDevelopmentalNutrition() {
        return developmentalNutrition;
    }

    public void setDevelopmentalNutrition(String developmentalNutrition) {
        this.developmentalNutrition = developmentalNutrition;
    }

    public String getNervesAndSpirits() {
        return nervesAndSpirits;
    }

    public void setNervesAndSpirits(String nervesAndSpirits) {
        this.nervesAndSpirits = nervesAndSpirits;
    }

    public String getLungAndRespiratoryTract() {
        return lungAndRespiratoryTract;
    }

    public void setLungAndRespiratoryTract(String lungAndRespiratoryTract) {
        this.lungAndRespiratoryTract = lungAndRespiratoryTract;
    }

    public String getHeartAndBloodVessels() {
        return heartAndBloodVessels;
    }

    public void setHeartAndBloodVessels(String heartAndBloodVessels) {
        this.heartAndBloodVessels = heartAndBloodVessels;
    }

    public String getLiver() {
        return liver;
    }

    public void setLiver(String liver) {
        this.liver = liver;
    }

    public String getSpleen() {
        return spleen;
    }

    public void setSpleen(String spleen) {
        this.spleen = spleen;
    }

    public String getInternal_other() {
        return internal_other;
    }

    public void setInternal_other(String internal_other) {
        this.internal_other = internal_other;
    }

    public String getInternal_doctorOpinion() {
        return internal_doctorOpinion;
    }

    public void setInternal_doctorOpinion(String internal_doctorOpinion) {
        this.internal_doctorOpinion = internal_doctorOpinion;
    }

    public String getLaboratoryExamination() {
        return laboratoryExamination;
    }

    public void setLaboratoryExamination(String laboratoryExamination) {
        this.laboratoryExamination = laboratoryExamination;
    }

    public String getLaboratory_doctorOpinion() {
        return laboratory_doctorOpinion;
    }

    public void setLaboratory_doctorOpinion(String laboratory_doctorOpinion) {
        this.laboratory_doctorOpinion = laboratory_doctorOpinion;
    }

    public String getChestRadiography() {
        return chestRadiography;
    }

    public void setChestRadiography(String chestRadiography) {
        this.chestRadiography = chestRadiography;
    }

    public String getChest_doctorOpinion() {
        return chest_doctorOpinion;
    }

    public void setChest_doctorOpinion(String chest_doctorOpinion) {
        this.chest_doctorOpinion = chest_doctorOpinion;
    }

    public String getOtherExamination() {
        return otherExamination;
    }

    public void setOtherExamination(String otherExamination) {
        this.otherExamination = otherExamination;
    }

    public String getOther_doctorOpinion() {
        return other_doctorOpinion;
    }

    public void setOther_doctorOpinion(String other_doctorOpinion) {
        this.other_doctorOpinion = other_doctorOpinion;
    }

    public String getConclusions() {
        return conclusions;
    }

    public void setConclusions(String conclusions) {
        this.conclusions = conclusions;
    }

    public String getHospitalOpinion() {
        return hospitalOpinion;
    }

    public void setHospitalOpinion(String hospitalOpinion) {
        this.hospitalOpinion = hospitalOpinion;
    }

    public Date getSubmitTimeLeader() {
        return submitTimeLeader;
    }

    public void setSubmitTimeLeader(Date submitTimeLeader) {
        this.submitTimeLeader = submitTimeLeader;
    }

}
