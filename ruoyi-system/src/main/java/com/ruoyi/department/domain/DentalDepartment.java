package com.ruoyi.department.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 牙科对象 dental_department
 * 
 * @author ruoyi
 * @date 2021-06-17
 */
public class DentalDepartment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学号 */
    @Excel(name = "学号")
    private Long studentId;

    /** 诊断时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "诊断时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date diagnosisTime;

    /** 龋齿 */
    private String dentalCaries;

    /** 缺齿 */
    private String missingTeeth;

    /** 齿槽 */
    private String alveolar;

    /** 其他 */
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

    public void setStudentId(Long studentId) 
    {
        this.studentId = studentId;
    }

    public Long getStudentId() 
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
    public void setDentalCaries(String dentalCaries) 
    {
        this.dentalCaries = dentalCaries;
    }

    public String getDentalCaries() 
    {
        return dentalCaries;
    }
    public void setMissingTeeth(String missingTeeth) 
    {
        this.missingTeeth = missingTeeth;
    }

    public String getMissingTeeth() 
    {
        return missingTeeth;
    }
    public void setAlveolar(String alveolar) 
    {
        this.alveolar = alveolar;
    }

    public String getAlveolar() 
    {
        return alveolar;
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
            .append("dentalCaries", getDentalCaries())
            .append("missingTeeth", getMissingTeeth())
            .append("alveolar", getAlveolar())
            .append("other", getOther())
            .append("doctorOpinion", getDoctorOpinion())
            .append("doctorId", getDoctorId())
            .append("doctorAudit", getDoctorAudit())
            .append("leaderAudit", getLeaderAudit())
            .append("submitTime", getSubmitTime())
            .toString();
    }
}
