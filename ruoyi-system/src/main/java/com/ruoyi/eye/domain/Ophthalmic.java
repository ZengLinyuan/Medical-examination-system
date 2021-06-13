package com.ruoyi.eye.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 眼科对象 ophthalmic
 * 
 * @author qpg
 * @date 2021-06-10
 */
public class Ophthalmic extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学号 */
    @Excel(name = "学号")
    private String studentId;

    /** 体检时间 */
    private Date diagnosisTime;

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
    private String doctorOpinion;

    /** 医生编号 */
    private String doctorId;

    /** 负责医生审查 */
    @Excel(name = "负责医生审查")
    private String doctorAudit;

    /** 院长审查 */
    @Excel(name = "院长审查")
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
    public void setSightLeftNoglasses(BigDecimal sightLeftNoglasses) 
    {
        this.sightLeftNoglasses = sightLeftNoglasses;
    }

    public BigDecimal getSightLeftNoglasses() 
    {
        return sightLeftNoglasses;
    }
    public void setSightRightNoglasses(BigDecimal sightRightNoglasses) 
    {
        this.sightRightNoglasses = sightRightNoglasses;
    }

    public BigDecimal getSightRightNoglasses() 
    {
        return sightRightNoglasses;
    }
    public void setSightLeftWithglasses(BigDecimal sightLeftWithglasses) 
    {
        this.sightLeftWithglasses = sightLeftWithglasses;
    }

    public BigDecimal getSightLeftWithglasses() 
    {
        return sightLeftWithglasses;
    }
    public void setSightRightWithglasses(BigDecimal sightRightWithglasses) 
    {
        this.sightRightWithglasses = sightRightWithglasses;
    }

    public BigDecimal getSightRightWithglasses() 
    {
        return sightRightWithglasses;
    }
    public void setEyeIllness(String eyeIllness) 
    {
        this.eyeIllness = eyeIllness;
    }

    public String getEyeIllness() 
    {
        return eyeIllness;
    }
    public void setColorVisionRed(Integer colorVisionRed) 
    {
        this.colorVisionRed = colorVisionRed;
    }

    public Integer getColorVisionRed() 
    {
        return colorVisionRed;
    }
    public void setColorVisionGreen(Integer colorVisionGreen) 
    {
        this.colorVisionGreen = colorVisionGreen;
    }

    public Integer getColorVisionGreen() 
    {
        return colorVisionGreen;
    }
    public void setColorVisionPurple(Integer colorVisionPurple) 
    {
        this.colorVisionPurple = colorVisionPurple;
    }

    public Integer getColorVisionPurple() 
    {
        return colorVisionPurple;
    }
    public void setColorVisionBlue(Integer colorVisionBlue) 
    {
        this.colorVisionBlue = colorVisionBlue;
    }

    public Integer getColorVisionBlue() 
    {
        return colorVisionBlue;
    }
    public void setColorVisionYellow(Integer colorVisionYellow) 
    {
        this.colorVisionYellow = colorVisionYellow;
    }

    public Integer getColorVisionYellow() 
    {
        return colorVisionYellow;
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
            .append("sightLeftNoglasses", getSightLeftNoglasses())
            .append("sightRightNoglasses", getSightRightNoglasses())
            .append("sightLeftWithglasses", getSightLeftWithglasses())
            .append("sightRightWithglasses", getSightRightWithglasses())
            .append("eyeIllness", getEyeIllness())
            .append("colorVisionRed", getColorVisionRed())
            .append("colorVisionGreen", getColorVisionGreen())
            .append("colorVisionPurple", getColorVisionPurple())
            .append("colorVisionBlue", getColorVisionBlue())
            .append("colorVisionYellow", getColorVisionYellow())
            .append("doctorOpinion", getDoctorOpinion())
            .append("doctorId", getDoctorId())
            .append("doctorAudit", getDoctorAudit())
            .append("leaderAudit", getLeaderAudit())
            .append("submitTime", getSubmitTime())
            .toString();
    }
}
