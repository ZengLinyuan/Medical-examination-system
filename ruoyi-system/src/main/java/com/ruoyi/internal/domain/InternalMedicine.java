package com.ruoyi.internal.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 内科对象 internal_medicine
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
public class InternalMedicine extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String studentId;

    /** $column.columnComment */
    private Date diagnosisTime;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String developmentalNutrition;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String nervesAndSpirits;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String lungAndRespiratoryTract;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String heartAndBloodVessels;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String liver;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String spleen;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String other;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String doctorOpinion;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String doctorId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String doctorAudit;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String leaderAudit;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
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
