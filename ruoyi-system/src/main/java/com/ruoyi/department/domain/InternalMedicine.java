package com.ruoyi.department.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 内科对象 internal_medicine
 * 
 * @author qpg
 * @date 2021-06-16
 */
public class InternalMedicine extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学号 */
    @Excel(name = "学号")
    private String studentId;

    /** 诊断时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "诊断时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date diagnosisTime;

    /** 发育营养 */
    private String developmentalNutrition;

    /** 神经及精神 */
    private String nervesAndSpirits;

    /** 肺及呼吸道 */
    private String lungAndRespiratoryTract;

    /** 心脏及血管 */
    private String heartAndBloodVessels;

    /** 肝 */
    private String liver;

    /** 脾 */
    private String spleen;

    /** 其他 */
    private String other;

    /** 医生意见 */
    private String doctorOpinion;

    /** 负责医生编号 */
    @Excel(name = "负责医生编号")
    private String doctorId;

    /** 负责医生审查 */
    @Excel(name = "负责医生审查")
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
    public void setDevelopmentalNutrition(String developmentalNutrition) 
    {
        this.developmentalNutrition = developmentalNutrition;
    }

    public String getDevelopmentalNutrition() 
    {
        return developmentalNutrition;
    }
    public void setNervesAndSpirits(String nervesAndSpirits) 
    {
        this.nervesAndSpirits = nervesAndSpirits;
    }

    public String getNervesAndSpirits() 
    {
        return nervesAndSpirits;
    }
    public void setLungAndRespiratoryTract(String lungAndRespiratoryTract) 
    {
        this.lungAndRespiratoryTract = lungAndRespiratoryTract;
    }

    public String getLungAndRespiratoryTract() 
    {
        return lungAndRespiratoryTract;
    }
    public void setHeartAndBloodVessels(String heartAndBloodVessels) 
    {
        this.heartAndBloodVessels = heartAndBloodVessels;
    }

    public String getHeartAndBloodVessels() 
    {
        return heartAndBloodVessels;
    }
    public void setLiver(String liver) 
    {
        this.liver = liver;
    }

    public String getLiver() 
    {
        return liver;
    }
    public void setSpleen(String spleen) 
    {
        this.spleen = spleen;
    }

    public String getSpleen() 
    {
        return spleen;
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
            .append("developmentalNutrition", getDevelopmentalNutrition())
            .append("nervesAndSpirits", getNervesAndSpirits())
            .append("lungAndRespiratoryTract", getLungAndRespiratoryTract())
            .append("heartAndBloodVessels", getHeartAndBloodVessels())
            .append("liver", getLiver())
            .append("spleen", getSpleen())
            .append("other", getOther())
            .append("doctorOpinion", getDoctorOpinion())
            .append("doctorId", getDoctorId())
            .append("doctorAudit", getDoctorAudit())
            .append("leaderAudit", getLeaderAudit())
            .append("submitTime", getSubmitTime())
            .toString();
    }
}
