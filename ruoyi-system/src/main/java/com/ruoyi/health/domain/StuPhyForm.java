package com.ruoyi.health.domain;

import com.ruoyi.common.annotation.Excel;

import java.util.Date;

public class StuPhyForm {
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDoctorAudit() {
        return doctorAudit;
    }

    public void setDoctorAudit(String doctorAudit) {
        this.doctorAudit = doctorAudit;
    }

    public String getLeaderAudit() {
        return leaderAudit;
    }

    public void setLeaderAudit(String leaderAudit) {
        this.leaderAudit = leaderAudit;
    }

    /** $column.columnComment */
    private String id;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String college;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String major;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String name;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String doctorAudit;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String leaderAudit;

    public Date getSubmitTimeLeader() {
        return submitTimeLeader;
    }

    public void setSubmitTimeLeader(Date submitTimeLeader) {
        this.submitTimeLeader = submitTimeLeader;
    }

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Date submitTimeLeader;
}
