package com.ruoyi.health.domain;

import java.util.Date;

public class Reject {
    private String stundetId;

    public String getStundetId() {
        return stundetId;
    }

    public void setStundetId(String stundetId) {
        this.stundetId = stundetId;
    }

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


}
