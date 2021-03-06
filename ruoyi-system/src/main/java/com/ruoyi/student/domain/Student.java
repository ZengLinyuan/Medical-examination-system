package com.ruoyi.student.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 学生对象 student
 * 
 * @author qpg
 * @date 2021-06-09
 */
public class Student extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String id;

    /** $column.columnComment */
    @Excel(name = "学院", readConverterExp = "学院.readConverterExp()")
    private String college;

    /** $column.columnComment */
    @Excel(name = "专业", readConverterExp = "专业.readConverterExp()")
    private String major;

    /** $column.columnComment */
    @Excel(name = "班级", readConverterExp = "班级.readConverterExp()")
    private String classroom;

    /** $column.columnComment */
    @Excel(name = "学号", readConverterExp = "学号.readConverterExp()")
    private Long studentId;

    /** $column.columnComment */
    @Excel(name = "姓名", readConverterExp = "姓名.readConverterExp()")
    private String name;

    /** $column.columnComment */
    @Excel(name = "性别", readConverterExp = "性别.readConverterExp()")
    private String gender;

    /** $column.columnComment */
    @Excel(name = "出生日期", readConverterExp = "出生日期.readConverterExp()")
    private Date birthDate;

    /** $column.columnComment */
    @Excel(name = "年龄", readConverterExp = "年龄.readConverterExp()")
    private Long age;

    /** $column.columnComment */
    @Excel(name = "文化程度", readConverterExp = "文化程度.readConverterExp()")
    private String degreeOfEducation;

    /** $column.columnComment */
    @Excel(name = "民族", readConverterExp = "民族.readConverterExp()")
    private String nation;

    /** $column.columnComment */
    @Excel(name = "职业", readConverterExp = "职业.readConverterExp()")
    private String occupation;

    /** $column.columnComment */
    @Excel(name = "籍贯", readConverterExp = "籍贯.readConverterExp()")
    private String nativePlace;

    /** $column.columnComment */
    @Excel(name = "地址", readConverterExp = "地址.readConverterExp()")
    private String address;

    /** $column.columnComment */
    @Excel(name = "毕业学校或工作单位", readConverterExp = "毕业学校或工作单位.readConverterExp()")
    private String draduationSchoolOrWorkUnit;

    /** $column.columnComment */
    @Excel(name = "既往病史", readConverterExp = "既往病史.readConverterExp()")
    private String pastMedicalHistory;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setCollege(String college) 
    {
        this.college = college;
    }

    public String getCollege() 
    {
        return college;
    }
    public void setMajor(String major) 
    {
        this.major = major;
    }

    public String getMajor() 
    {
        return major;
    }
    public void setClassroom(String classroom) 
    {
        this.classroom = classroom;
    }

    public String getClassroom() 
    {
        return classroom;
    }
    public void setStudentId(Long studentId) 
    {
        this.studentId = studentId;
    }

    public Long getStudentId() 
    {
        return studentId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setGender(String gender) 
    {
        this.gender = gender;
    }

    public String getGender() 
    {
        return gender;
    }
    public void setBirthDate(Date birthDate) 
    {
        this.birthDate = birthDate;
    }

    public Date getBirthDate() 
    {
        return birthDate;
    }
    public void setAge(Long age) 
    {
        this.age = age;
    }

    public Long getAge() 
    {
        return age;
    }
    public void setDegreeOfEducation(String degreeOfEducation) 
    {
        this.degreeOfEducation = degreeOfEducation;
    }

    public String getDegreeOfEducation() 
    {
        return degreeOfEducation;
    }
    public void setNation(String nation) 
    {
        this.nation = nation;
    }

    public String getNation() 
    {
        return nation;
    }
    public void setOccupation(String occupation) 
    {
        this.occupation = occupation;
    }

    public String getOccupation() 
    {
        return occupation;
    }
    public void setNativePlace(String nativePlace) 
    {
        this.nativePlace = nativePlace;
    }

    public String getNativePlace() 
    {
        return nativePlace;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setDraduationSchoolOrWorkUnit(String draduationSchoolOrWorkUnit) 
    {
        this.draduationSchoolOrWorkUnit = draduationSchoolOrWorkUnit;
    }

    public String getDraduationSchoolOrWorkUnit() 
    {
        return draduationSchoolOrWorkUnit;
    }
    public void setPastMedicalHistory(String pastMedicalHistory) 
    {
        this.pastMedicalHistory = pastMedicalHistory;
    }

    public String getPastMedicalHistory() 
    {
        return pastMedicalHistory;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("college", getCollege())
            .append("major", getMajor())
            .append("classroom", getClassroom())
            .append("studentId", getStudentId())
            .append("name", getName())
            .append("gender", getGender())
            .append("birthDate", getBirthDate())
            .append("age", getAge())
            .append("degreeOfEducation", getDegreeOfEducation())
            .append("nation", getNation())
            .append("occupation", getOccupation())
            .append("nativePlace", getNativePlace())
            .append("address", getAddress())
            .append("draduationSchoolOrWorkUnit", getDraduationSchoolOrWorkUnit())
            .append("pastMedicalHistory", getPastMedicalHistory())
            .toString();
    }
}
