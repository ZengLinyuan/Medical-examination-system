package com.ruoyi.department.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 外科对象 surgery
 * 
 * @author ruoyi
 * @date 2021-06-17
 */
public class Surgery extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学号 */
    @Excel(name = "学号")
    private String studentId;

    /** 诊断时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "诊断时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date diagnosisTime;

    /** 身长 */
    private BigDecimal height;

    /** 腰围 */
    private BigDecimal waist;

    /** 体重 */
    private BigDecimal weight;

    /** 皮肤 */
    private String skin;

    /** 淋巴 */
    private String lymph;

    /** 甲状腺 */
    private String thyroid;

    /** 脊柱 */
    private String spine;

    /** 四肢 */
    private String limb;

    /** 关节 */
    private String joint;

    /** 平跖足 */
    private String flatFeet;

    /** 其它 */
    private String other;

    /** 医生意见 */
    private String doctorOpinion;

    /** 医生编号 */
    private String doctorId;

    /** 医生审查 */
    @Excel(name = "医生审查")
    private String doctorAudit;

    /** 领导审查 */
    @Excel(name = "领导审查")
    private String leaderAudit;

    /** 提交时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "提交时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date submitTime;

    public void setStudentId(String studentId) 
    {
        this.studentId = studentId;
    }

    public String getStudentId() 
    {
        return studentId;
    }
    public void setDiagnosisTime(Date diagnosisTime) 
    {
        this.diagnosisTime = diagnosisTime;
    }

    public Date getDiagnosisTime() 
    {
        return diagnosisTime;
    }
    public void setHeight(BigDecimal height) 
    {
        this.height = height;
    }

    public BigDecimal getHeight() 
    {
        return height;
    }
    public void setWaist(BigDecimal waist) 
    {
        this.waist = waist;
    }

    public BigDecimal getWaist() 
    {
        return waist;
    }
    public void setWeight(BigDecimal weight) 
    {
        this.weight = weight;
    }

    public BigDecimal getWeight() 
    {
        return weight;
    }
    public void setSkin(String skin) 
    {
        this.skin = skin;
    }

    public String getSkin() 
    {
        return skin;
    }
    public void setLymph(String lymph) 
    {
        this.lymph = lymph;
    }

    public String getLymph() 
    {
        return lymph;
    }
    public void setThyroid(String thyroid) 
    {
        this.thyroid = thyroid;
    }

    public String getThyroid() 
    {
        return thyroid;
    }
    public void setSpine(String spine) 
    {
        this.spine = spine;
    }

    public String getSpine() 
    {
        return spine;
    }
    public void setLimb(String limb) 
    {
        this.limb = limb;
    }

    public String getLimb() 
    {
        return limb;
    }
    public void setJoint(String joint) 
    {
        this.joint = joint;
    }

    public String getJoint() 
    {
        return joint;
    }
    public void setFlatFeet(String flatFeet) 
    {
        this.flatFeet = flatFeet;
    }

    public String getFlatFeet() 
    {
        return flatFeet;
    }
    public void setOther(String other) 
    {
        this.other = other;
    }

    public String getOther() 
    {
        return other;
    }
    public void setDoctorOpinion(String doctorOpinion) 
    {
        this.doctorOpinion = doctorOpinion;
    }

    public String getDoctorOpinion() 
    {
        return doctorOpinion;
    }
    public void setDoctorId(String doctorId) 
    {
        this.doctorId = doctorId;
    }

    public String getDoctorId() 
    {
        return doctorId;
    }
    public void setDoctorAudit(String doctorAudit) 
    {
        this.doctorAudit = doctorAudit;
    }

    public String getDoctorAudit() 
    {
        return doctorAudit;
    }
    public void setLeaderAudit(String leaderAudit) 
    {
        this.leaderAudit = leaderAudit;
    }

    public String getLeaderAudit() 
    {
        return leaderAudit;
    }
    public void setSubmitTime(Date submitTime) 
    {
        this.submitTime = submitTime;
    }

    public Date getSubmitTime() 
    {
        return submitTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("studentId", getStudentId())
            .append("diagnosisTime", getDiagnosisTime())
            .append("height", getHeight())
            .append("waist", getWaist())
            .append("weight", getWeight())
            .append("skin", getSkin())
            .append("lymph", getLymph())
            .append("thyroid", getThyroid())
            .append("spine", getSpine())
            .append("limb", getLimb())
            .append("joint", getJoint())
            .append("flatFeet", getFlatFeet())
            .append("other", getOther())
            .append("doctorOpinion", getDoctorOpinion())
            .append("doctorId", getDoctorId())
            .append("doctorAudit", getDoctorAudit())
            .append("leaderAudit", getLeaderAudit())
            .append("submitTime", getSubmitTime())
            .toString();
    }
}
