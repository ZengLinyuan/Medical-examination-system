package com.ruoyi.total.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.department.domain.*;
import com.ruoyi.department.service.*;
import com.ruoyi.eye.domain.Ophthalmic;
import com.ruoyi.eye.service.IOphthalmicService;
import com.ruoyi.health.domain.PhysicalExaminationForm;
import com.ruoyi.health.service.IPhysicalExaminationFormService;
import com.ruoyi.student.domain.Student;
import com.ruoyi.student.service.IStudentService;
import com.ruoyi.total.domain.Total;
import com.ruoyi.total.domain.BasisData;
import com.ruoyi.total.service.ITotalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/total")
public class TotalController {

    @Autowired
    private IPhysicalExaminationFormService physicalExaminationFormService;

    @Autowired
    private IStudentService studentService;

    @Autowired
    private IChestRadiologyService chestRadiologyService;

    @Autowired
    private IDentalDepartmentService dentalDepartmentService;

    @Autowired
    private IDepartmentOfBloodPressureAndPulseService departmentOfBloodPressureAndPulseService;

    @Autowired
    private IEntDepartmentService entDepartmentService;

    @Autowired
    private IInternalMedicineService internalMedicineService;

    @Autowired
    private ILaboratoryService laboratoryService;

    @Autowired
    private IOtherService otherService;

    @Autowired
    private ISurgeryService surgeryService;

    @Autowired
    private IOphthalmicService ophthalmicService;

    /**
     * 导出眼科列表
     */
    @PreAuthorize("@ss.hasPermi('health:form:export')")
    @Log(title = "体检信息" , businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BasisData reject)
    {
        Total total=new Total();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date newTime = null;
        try {
            newTime = format.parse(reject.getDiagnosisTime());
            System.out.println("获取体检表转换以后的时间：："+newTime);//Sun Feb 02 02:02:02 CST 2020
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String studentId = reject.getStudentId();

        System.out.println("导出体检表学生学号ID：" + studentId);

        Student student = new Student();
        student.setId(studentId);
        Student list0 = studentService.selectStudentList(student).get(0);

        total.setStudentId(studentId);
        total.setId(studentId);
        System.out.println("屁股后立即打印：" + total.getStudentId());
        total.setCollege(student.getCollege());
        total.setMajor(student.getMajor());
        total.setClassroom(student.getClassroom());
        total.setName(student.getName());
        total.setGender(student.getGender());
        total.setBirthDate(student.getBirthDate());
        total.setAge(student.getAge());
        total.setDegreeOfEducation(student.getDegreeOfEducation());
        total.setNation(student.getNation());
        total.setOccupation(student.getOccupation());
        total.setNativePlace(student.getNativePlace());
        total.setAddress(student.getAddress());
        total.setDraduationSchoolOrWorkUnit(student.getDraduationSchoolOrWorkUnit());
        total.setPastMedicalHistory(student.getPastMedicalHistory());

        Ophthalmic ophthalmic = new Ophthalmic();
        ophthalmic.setStudentId(studentId);
        ophthalmic.setDiagnosisTime(newTime);
        Ophthalmic list1 = ophthalmicService.selectOphthalmicList(ophthalmic).get(0);
        System.out.println("查询眼科视力：" + list1.getColorVisionBlue());
        total.setSightLeftNoglasses(list1.getSightLeftNoglasses());
        total.setSightRightNoglasses(list1.getSightRightNoglasses());
        total.setSightLeftWithglasses(list1.getSightLeftWithglasses());
        total.setSightRightWithglasses(list1.getSightRightWithglasses());
        total.setEyeIllness(list1.getEyeIllness());
        total.setColorVisionRed(list1.getColorVisionRed());
        total.setColorVisionGreen(list1.getColorVisionGreen());
        total.setColorVisionPurple(list1.getColorVisionPurple());
        total.setColorVisionBlue(list1.getColorVisionBlue());
        total.setColorVisionYellow(list1.getColorVisionYellow());
        total.setEye_doctorOpinion(list1.getDoctorOpinion());
        System.out.println("眼科视力：" + total.getColorVisionBlue());

        EntDepartment entDepartment = new EntDepartment();
        entDepartment.setStudentId(studentId);
        entDepartment.setDiagnosisTime(newTime);
        EntDepartment list2 = entDepartmentService.selectEntDepartmentList(entDepartment).get(0);
        total.setHearingLeft(entDepartment.getHearingLeft());
        total.setHearingRight(entDepartment.getHearingRight());
        total.setEarIllness(entDepartment.getEarIllness());
        total.setSmellSense(entDepartment.getSmellSense());
        total.setNoseIllness(entDepartment.getNoseIllness());
        total.setThroat(entDepartment.getThroat());
        total.setStutter(entDepartment.getStutter());
        total.setEnt_doctorOpinion(entDepartment.getDoctorOpinion());

        DentalDepartment dentalDepartment = new DentalDepartment();
        dentalDepartment.setStudentId(studentId);
        dentalDepartment.setDiagnosisTime(newTime);
        DentalDepartment list3 = dentalDepartmentService.selectDentalDepartmentList(dentalDepartment).get(0);
        total.setDentalCaries(dentalDepartment.getDentalCaries());
        total.setMissingTeeth(dentalDepartment.getMissingTeeth());
        total.setAlveolar(dentalDepartment.getAlveolar());
        total.setOther(dentalDepartment.getOther());
        total.setDental_doctorOpinion(dentalDepartment.getDoctorOpinion());

        Surgery surgery = new Surgery();
        surgery.setStudentId(studentId);
        surgery.setDiagnosisTime(newTime);
        Surgery list4 = surgeryService.selectSurgeryList(surgery).get(0);
        total.setHeight(surgery.getHeight());
        total.setWaist(surgery.getWaist());
        total.setWeight(surgery.getWeight());
        total.setSkin(surgery.getSkin());
        total.setLymph(surgery.getLymph());
        total.setThyroid(surgery.getThyroid());
        total.setSpine(surgery.getSpine());
        total.setLimb(surgery.getLimb());
        total.setJoint(surgery.getJoint());
        total.setFlatFeet(surgery.getFlatFeet());
        total.setSurgery_other(surgery.getOther());
        total.setSurgery_doctorOpinion(surgery.getDoctorOpinion());

        DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse = new DepartmentOfBloodPressureAndPulse();
        departmentOfBloodPressureAndPulse.setStudentId(studentId);
        departmentOfBloodPressureAndPulse.setDiagnosisTime(newTime);
        DepartmentOfBloodPressureAndPulse list5 = departmentOfBloodPressureAndPulseService.selectDepartmentOfBloodPressureAndPulseList(departmentOfBloodPressureAndPulse).get(0);
        total.setBloodPressureHigh(departmentOfBloodPressureAndPulse.getBloodPressureHigh());
        total.setBloodPressureLow(departmentOfBloodPressureAndPulse.getBloodPressureLow());
        total.setPulse(departmentOfBloodPressureAndPulse.getPulse());
        total.setPulse_doctorOpinion(departmentOfBloodPressureAndPulse.getDoctorOpinion());

        InternalMedicine internalMedicine = new InternalMedicine();
        internalMedicine.setStudentId(studentId);
        internalMedicine.setDiagnosisTime(newTime);
        InternalMedicine list6 = internalMedicineService.selectInternalMedicineList(internalMedicine).get(0);
        total.setNervesAndSpirits(internalMedicine.getNervesAndSpirits());
        total.setLungAndRespiratoryTract(internalMedicine.getLungAndRespiratoryTract());
        total.setHeartAndBloodVessels(internalMedicine.getHeartAndBloodVessels());
        total.setLiver(internalMedicine.getLiver());
        total.setSpine(internalMedicine.getSpleen());
        total.setInternal_doctorOpinion(internalMedicine.getDoctorOpinion());

        Laboratory laboratory = new Laboratory();
        laboratory.setStudentId(studentId);
        laboratory.setDiagnosisTime(newTime);
        Laboratory list7 = laboratoryService.selectLaboratoryList(laboratory).get(0);
        total.setLaboratoryExamination(laboratory.getLaboratoryExamination());
        total.setLaboratory_doctorOpinion(laboratory.getDoctorOpinion());

        ChestRadiology chestRadiology = new ChestRadiology();
        chestRadiology.setStudentId(studentId);
        chestRadiology.setDiagnosisTime(newTime);
        ChestRadiology list8 = chestRadiologyService.selectChestRadiologyList(chestRadiology).get(0);
        total.setChestRadiography(chestRadiology.getChestRadiography());
        total.setChest_doctorOpinion(chestRadiology.getDoctorOpinion());

        Other other = new Other();
        other.setStudentId(studentId);
        other.setDiagnosisTime(newTime);
        Other list9 = otherService.selectOtherList(other).get(0);
        total.setOtherExamination(other.getOtherExamination());
        total.setOther_doctorOpinion(other.getDoctorOpinion());

        PhysicalExaminationForm physicalExaminationForm = new PhysicalExaminationForm();
        physicalExaminationForm.setStudentId(studentId);
        physicalExaminationForm.setInspectorTime(newTime);
        PhysicalExaminationForm list10 = physicalExaminationFormService.selectPhysicalExaminationFormList(physicalExaminationForm).get(0);
        total.setConclusions(physicalExaminationForm.getConclusions());
        total.setHospitalOpinion(physicalExaminationForm.getHospitalOpinion());
        total.setSubmitTimeLeader(physicalExaminationForm.getSubmitTimeLeader());

        ArrayList<Total> list = new ArrayList<>();
        System.out.println("体检信息表：" + total.getStudentId());
        list.add(total);
        System.out.println("导出体检表：" + list.get(0).getStudentId());
        System.out.println("导出其它信息：" + list.get(0).getChest_doctorOpinion());
        System.out.println("导出其它信息：" + total.getChest_doctorOpinion());
        ExcelUtil<Total> util = new ExcelUtil<Total>(Total.class);
        return util.exportExcel(list, "体检数据");
    }

}
