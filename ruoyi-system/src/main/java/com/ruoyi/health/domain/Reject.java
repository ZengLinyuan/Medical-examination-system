package com.ruoyi.health.domain;

import java.util.Date;

public class Reject {
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    private String studentId;

    public void setDiagnosisTime(String diagnosisTime) {
        this.diagnosisTime = diagnosisTime;
    }

    public String getDiagnosisTime() {
        return diagnosisTime;
    }

    private String diagnosisTime;

    public int getDeptName() {
        return deptName;
    }

    public void setDeptName(int deptName) {
        this.deptName = deptName;
    }

    private int deptName;

    public String getOpinion() {
        return opinion;
    }

    public void setOpinion(String opinion) {
        this.opinion = opinion;
    }

    public String getAudit() {
        return audit;
    }

    public void setAudit(String audit) {
        this.audit = audit;
    }

    private String opinion;

    private String audit;
}
