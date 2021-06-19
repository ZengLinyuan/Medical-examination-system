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
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String studentId = reject.getStudentId();
        Student student = new Student();
        student.setId(studentId);
        Student list0 = studentService.selectStudentList(student).get(0);

        total.setStudentId(list0.getStudentId().toString());
        total.setId(list0.getId());
        total.setCollege(list0.getCollege());
        total.setMajor(list0.getMajor());
        total.setClassroom(list0.getClassroom());
        total.setName(list0.getName());
        total.setGender(list0.getGender());
        total.setBirthDate(list0.getBirthDate());
        total.setAge(list0.getAge());
        total.setDegreeOfEducation(list0.getDegreeOfEducation());
        total.setNation(list0.getNation());
        total.setOccupation(list0.getOccupation());
        total.setNativePlace(list0.getNativePlace());
        total.setAddress(list0.getAddress());
        total.setDraduationSchoolOrWorkUnit(list0.getDraduationSchoolOrWorkUnit());
        total.setPastMedicalHistory(list0.getPastMedicalHistory());
        System.out.println("学生籍贯：" + list0.getAddress());
        System.out.println("体检表籍贯：" + total.getAddress());

        Ophthalmic ophthalmic = new Ophthalmic();
        ophthalmic.setStudentId(studentId);
        ophthalmic.setDiagnosisTime(newTime);
        Ophthalmic list1 = ophthalmicService.selectOphthalmicList(ophthalmic).get(0);
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

        EntDepartment entDepartment = new EntDepartment();
        entDepartment.setStudentId(studentId);
        entDepartment.setDiagnosisTime(newTime);
        EntDepartment list2 = entDepartmentService.selectEntDepartmentList(entDepartment).get(0);
        total.setHearingLeft(list2.getHearingLeft());
        total.setHearingRight(list2.getHearingRight());
        total.setEarIllness(list2.getEarIllness());
        total.setSmellSense(list2.getSmellSense());
        total.setNoseIllness(list2.getNoseIllness());
        total.setThroat(list2.getThroat());
        total.setStutter(list2.getStutter());
        total.setEnt_doctorOpinion(list2.getDoctorOpinion());

        DentalDepartment dentalDepartment = new DentalDepartment();
        dentalDepartment.setStudentId(studentId);
        dentalDepartment.setDiagnosisTime(newTime);
        DentalDepartment list3 = dentalDepartmentService.selectDentalDepartmentList(dentalDepartment).get(0);
        total.setDentalCaries(list3.getDentalCaries());
        total.setMissingTeeth(list3.getMissingTeeth());
        total.setAlveolar(list3.getAlveolar());
        total.setOther(list3.getOther());
        total.setDental_doctorOpinion(list3.getDoctorOpinion());

        Surgery surgery = new Surgery();
        surgery.setStudentId(studentId);
        surgery.setDiagnosisTime(newTime);
        Surgery list4 = surgeryService.selectSurgeryList(surgery).get(0);
        total.setHeight(list4.getHeight());
        total.setWaist(list4.getWaist());
        total.setWeight(list4.getWeight());
        total.setSkin(list4.getSkin());
        total.setLymph(list4.getLymph());
        total.setThyroid(list4.getThyroid());
        total.setSpine(list4.getSpine());
        total.setLimb(list4.getLimb());
        total.setJoint(list4.getJoint());
        total.setFlatFeet(list4.getFlatFeet());
        total.setSurgery_other(list4.getOther());
        total.setSurgery_doctorOpinion(list4.getDoctorOpinion());

        DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse = new DepartmentOfBloodPressureAndPulse();
        departmentOfBloodPressureAndPulse.setStudentId(studentId);
        departmentOfBloodPressureAndPulse.setDiagnosisTime(newTime);
        DepartmentOfBloodPressureAndPulse list5 = departmentOfBloodPressureAndPulseService.selectDepartmentOfBloodPressureAndPulseList(departmentOfBloodPressureAndPulse).get(0);
        total.setBloodPressureHigh(list5.getBloodPressureHigh());
        total.setBloodPressureLow(list5.getBloodPressureLow());
        total.setPulse(list5.getPulse());
        total.setPulse_doctorOpinion(list5.getDoctorOpinion());

        InternalMedicine internalMedicine = new InternalMedicine();
        internalMedicine.setStudentId(studentId);
        internalMedicine.setDiagnosisTime(newTime);
        InternalMedicine list6 = internalMedicineService.selectInternalMedicineList(internalMedicine).get(0);
        total.setDevelopmentalNutrition(list6.getDevelopmentalNutrition());
        total.setNervesAndSpirits(list6.getNervesAndSpirits());
        total.setLungAndRespiratoryTract(list6.getLungAndRespiratoryTract());
        total.setHeartAndBloodVessels(list6.getHeartAndBloodVessels());
        total.setLiver(list6.getLiver());
        total.setSpleen(list6.getSpleen());
        total.setInternal_other(list6.getOther());
        total.setInternal_doctorOpinion(list6.getDoctorOpinion());

        Laboratory laboratory = new Laboratory();
        laboratory.setStudentId(studentId);
        laboratory.setDiagnosisTime(newTime);
        Laboratory list7 = laboratoryService.selectLaboratoryList(laboratory).get(0);
        total.setLaboratoryExamination(list7.getLaboratoryExamination());
        total.setLaboratory_doctorOpinion(list7.getDoctorOpinion());

        ChestRadiology chestRadiology = new ChestRadiology();
        chestRadiology.setStudentId(studentId);
        chestRadiology.setDiagnosisTime(newTime);
        ChestRadiology list8 = chestRadiologyService.selectChestRadiologyList(chestRadiology).get(0);
        total.setChestRadiography(list8.getChestRadiography());
        total.setChest_doctorOpinion(list8.getDoctorOpinion());

        Other other = new Other();
        other.setStudentId(studentId);
        other.setDiagnosisTime(newTime);
        Other list9 = otherService.selectOtherList(other).get(0);
        total.setOtherExamination(list9.getOtherExamination());
        total.setOther_doctorOpinion(list9.getDoctorOpinion());

        PhysicalExaminationForm physicalExaminationForm = new PhysicalExaminationForm();
        physicalExaminationForm.setStudentId(studentId);
        physicalExaminationForm.setInspectorTime(newTime);
        PhysicalExaminationForm list10 = physicalExaminationFormService.selectPhysicalExaminationFormList(physicalExaminationForm).get(0);
        total.setConclusions(list10.getConclusions());
        total.setHospitalOpinion(list10.getHospitalOpinion());
        total.setSubmitTimeLeader(list10.getSubmitTimeLeader());

        ArrayList<Total> list = new ArrayList<>();
        list.add(total);
        ExcelUtil<Total> util = new ExcelUtil<Total>(Total.class);
        return util.exportExcel(list, "体检数据");
    }

}
