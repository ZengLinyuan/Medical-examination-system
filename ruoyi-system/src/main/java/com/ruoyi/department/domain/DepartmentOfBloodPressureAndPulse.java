package com.ruoyi.department.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 血压脉搏科对象 department_of_blood_pressure_and_pulse
 * 
 * @author ruoyi
 * @date 2021-06-17
 */
public class DepartmentOfBloodPressureAndPulse extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学号 */
    @Excel(name = "学号")
    private String studentId;

    /** 诊断时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "诊断时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date diagnosisTime;

    /** 高压 */
    private BigDecimal bloodPressureHigh;

    /** 低压 */
    private BigDecimal bloodPressureLow;

    /** 脉搏 */
    private Long pulse;

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
    public void setBloodPressureHigh(BigDecimal bloodPressureHigh) 
    {
        this.bloodPressureHigh = bloodPressureHigh;
    }

    public BigDecimal getBloodPressureHigh() 
    {
        return bloodPressureHigh;
    }
    public void setBloodPressureLow(BigDecimal bloodPressureLow) 
    {
        this.bloodPressureLow = bloodPressureLow;
    }

    public BigDecimal getBloodPressureLow() 
    {
        return bloodPressureLow;
    }
    public void setPulse(Long pulse) 
    {
        this.pulse = pulse;
    }

    public Long getPulse() 
    {
        return pulse;
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
            .append("bloodPressureHigh", getBloodPressureHigh())
            .append("bloodPressureLow", getBloodPressureLow())
            .append("pulse", getPulse())
            .append("doctorOpinion", getDoctorOpinion())
            .append("doctorId", getDoctorId())
            .append("doctorAudit", getDoctorAudit())
            .append("leaderAudit", getLeaderAudit())
            .append("submitTime", getSubmitTime())
            .toString();
    }
}
