package com.ruoyi.department.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 耳鼻喉科对象 ent_department
 * 
 * @author ruoyi
 * @date 2021-06-17
 */
public class EntDepartment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学号 */
    @Excel(name = "学号")
    private String studentId;

    /** 诊断时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "诊断时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date diagnosisTime;

    /** 左耳听力 */
    private Long hearingLeft;

    /** 右耳听力 */
    private Long hearingRight;

    /** 耳疾 */
    private String earIllness;

    /** 嗅觉 */
    private String smellSense;

    /** 鼻及鼻窦疾病 */
    private String noseIllness;

    /** 咽喉 */
    private String throat;

    /** 口吃 */
    private String stutter;

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
    public void setHearingLeft(Long hearingLeft) 
    {
        this.hearingLeft = hearingLeft;
    }

    public Long getHearingLeft() 
    {
        return hearingLeft;
    }
    public void setHearingRight(Long hearingRight) 
    {
        this.hearingRight = hearingRight;
    }

    public Long getHearingRight() 
    {
        return hearingRight;
    }
    public void setEarIllness(String earIllness) 
    {
        this.earIllness = earIllness;
    }

    public String getEarIllness() 
    {
        return earIllness;
    }
    public void setSmellSense(String smellSense) 
    {
        this.smellSense = smellSense;
    }

    public String getSmellSense() 
    {
        return smellSense;
    }
    public void setNoseIllness(String noseIllness) 
    {
        this.noseIllness = noseIllness;
    }

    public String getNoseIllness() 
    {
        return noseIllness;
    }
    public void setThroat(String throat) 
    {
        this.throat = throat;
    }

    public String getThroat() 
    {
        return throat;
    }
    public void setStutter(String stutter) 
    {
        this.stutter = stutter;
    }

    public String getStutter() 
    {
        return stutter;
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
            .append("hearingLeft", getHearingLeft())
            .append("hearingRight", getHearingRight())
            .append("earIllness", getEarIllness())
            .append("smellSense", getSmellSense())
            .append("noseIllness", getNoseIllness())
            .append("throat", getThroat())
            .append("stutter", getStutter())
            .append("doctorOpinion", getDoctorOpinion())
            .append("doctorId", getDoctorId())
            .append("doctorAudit", getDoctorAudit())
            .append("leaderAudit", getLeaderAudit())
            .append("submitTime", getSubmitTime())
            .toString();
    }
}
