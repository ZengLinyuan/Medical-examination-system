package com.ruoyi.health.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 体检总对象 physical_examination_form
 * 
 * @author qpg
 * @date 2021-06-10
 */
public class PhysicalExaminationForm extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String studentId;

    /** $column.columnComment */
    private Date inspectorTime;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String conclusions;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String doctorAudit;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String doctorId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Date submitTimeDoctor;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String hospitalOpinion;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String leaderAudit;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String leaderId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Date submitTimeLeader;

    public void setStudentId(String studentId) 
    {
        this.studentId = studentId;
    }

    public String getStudentId() 
    {
        return studentId;
    }
    public void setInspectorTime(Date inspectorTime) 
    {
        this.inspectorTime = inspectorTime;
    }

    public Date getInspectorTime() 
    {
        return inspectorTime;
    }
    public void setConclusions(String conclusions) 
    {
        this.conclusions = conclusions;
    }

    public String getConclusions() 
    {
        return conclusions;
    }
    public void setDoctorAudit(String doctorAudit) 
    {
        this.doctorAudit = doctorAudit;
    }

    public String getDoctorAudit() 
    {
        return doctorAudit;
    }
    public void setDoctorId(String doctorId) 
    {
        this.doctorId = doctorId;
    }

    public String getDoctorId() 
    {
        return doctorId;
    }
    public void setSubmitTimeDoctor(Date submitTimeDoctor) 
    {
        this.submitTimeDoctor = submitTimeDoctor;
    }

    public Date getSubmitTimeDoctor() 
    {
        return submitTimeDoctor;
    }
    public void setHospitalOpinion(String hospitalOpinion) 
    {
        this.hospitalOpinion = hospitalOpinion;
    }

    public String getHospitalOpinion() 
    {
        return hospitalOpinion;
    }
    public void setLeaderAudit(String leaderAudit) 
    {
        this.leaderAudit = leaderAudit;
    }

    public String getLeaderAudit() 
    {
        return leaderAudit;
    }
    public void setLeaderId(String leaderId) 
    {
        this.leaderId = leaderId;
    }

    public String getLeaderId() 
    {
        return leaderId;
    }
    public void setSubmitTimeLeader(Date submitTimeLeader) 
    {
        this.submitTimeLeader = submitTimeLeader;
    }

    public Date getSubmitTimeLeader() 
    {
        return submitTimeLeader;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("studentId", getStudentId())
            .append("inspectorTime", getInspectorTime())
            .append("conclusions", getConclusions())
            .append("doctorAudit", getDoctorAudit())
            .append("doctorId", getDoctorId())
            .append("submitTimeDoctor", getSubmitTimeDoctor())
            .append("hospitalOpinion", getHospitalOpinion())
            .append("leaderAudit", getLeaderAudit())
            .append("leaderId", getLeaderId())
            .append("submitTimeLeader", getSubmitTimeLeader())
            .toString();
    }
}
