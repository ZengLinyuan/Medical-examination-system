package com.ruoyi.health.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ruoyi.department.domain.ChestRadiology;
import com.ruoyi.department.service.*;
import com.ruoyi.eye.service.IOphthalmicService;
import com.ruoyi.health.domain.Reject;
import com.ruoyi.health.domain.StuPhyForm;
import com.ruoyi.student.domain.Student;
import com.ruoyi.student.service.IStudentService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.health.domain.PhysicalExaminationForm;
import com.ruoyi.health.service.IPhysicalExaminationFormService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 体检总Controller
 * 
 * @author qpg
 * @date 2021-06-10
 */
@RestController
@RequestMapping("/health/form")
public class PhysicalExaminationFormController extends BaseController
{
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
     * 查询体检总列表
     */
    @PreAuthorize("@ss.hasPermi('health:form:list')")
    @GetMapping("/list")
    public TableDataInfo list(PhysicalExaminationForm physicalExaminationForm)
    {
        startPage();
        List<PhysicalExaminationForm> list = physicalExaminationFormService.selectPhysicalExaminationFormList(physicalExaminationForm);
        return getDataTable(list);
    }

    /**
     * 导出体检总列表
     */
    @PreAuthorize("@ss.hasPermi('health:form:export')")
    @Log(title = "体检总", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(PhysicalExaminationForm physicalExaminationForm)
    {
        List<PhysicalExaminationForm> list = physicalExaminationFormService.selectPhysicalExaminationFormList(physicalExaminationForm);
        ExcelUtil<PhysicalExaminationForm> util = new ExcelUtil<PhysicalExaminationForm>(PhysicalExaminationForm.class);
        return util.exportExcel(list, "体检总数据");
    }

    /**
     * 获取体检总详细信息
     */
    @PreAuthorize("@ss.hasPermi('health:form:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {
        return AjaxResult.success(physicalExaminationFormService.selectPhysicalExaminationFormById(studentId));
    }

    /**
     * 新增体检总
     */
    @PreAuthorize("@ss.hasPermi('health:form:add')")
    @Log(title = "体检总", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PhysicalExaminationForm physicalExaminationForm)
    {
        System.out.println(1);
        return toAjax(physicalExaminationFormService.insertPhysicalExaminationForm(physicalExaminationForm));
    }

    /**
     * 修改体检总
     */
    @PreAuthorize("@ss.hasPermi('health:form:edit')")
    @Log(title = "体检总", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PhysicalExaminationForm physicalExaminationForm)
    {
        return toAjax(physicalExaminationFormService.updatePhysicalExaminationForm(physicalExaminationForm));
    }

    /**
     * 删除体检总
     */
    @PreAuthorize("@ss.hasPermi('health:form:remove')")
    @Log(title = "体检总", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(physicalExaminationFormService.deletePhysicalExaminationFormByIds(studentIds));
    }

    /**
     * 查询审核总列表
     */
    @PreAuthorize("@ss.hasPermi('health:form:stuList')")
    @GetMapping("/stuList")
    public TableDataInfo stuList(StuPhyForm stuPhyForm)
    {
        startPage();
        List<PhysicalExaminationForm> phyList = physicalExaminationFormService.selectAllPhysicalExaminationFormList();
        List<Student> stuList = studentService.selectAllStudentList();
        List<StuPhyForm> stuPhyList = new ArrayList<StuPhyForm>();
        for(PhysicalExaminationForm physicalExaminationForm : phyList){
            for(Student student : stuList){ ;
                if(physicalExaminationForm.getStudentId().equals(student.getId()) &&
                physicalExaminationForm.getDoctorAudit().equals("通过")
                && physicalExaminationForm.getLeaderAudit().equals("未审核")
                ){
                    StuPhyForm tempstuPhyForm = new StuPhyForm();
                    tempstuPhyForm.setId(student.getId());
                    tempstuPhyForm.setName(student.getName());
                    tempstuPhyForm.setCollege(student.getCollege());
                    tempstuPhyForm.setMajor(student.getMajor());
                    tempstuPhyForm.setDoctorAudit(physicalExaminationForm.getDoctorAudit());
                    tempstuPhyForm.setLeaderAudit(physicalExaminationForm.getLeaderAudit());
                    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
                    String time = sdf.format(physicalExaminationForm.getInspectorTime());
                    tempstuPhyForm.setSubmitTimeLeader(time);
                    stuPhyList.add(tempstuPhyForm);
                }
            }
        }
        return getDataTable(stuPhyList);
    }

    /**
     * 修改各科
     */
    @PreAuthorize("@ss.hasPermi('health:form:editDepartment')")
    @GetMapping("/editDepartment")
    public AjaxResult editDepartment(@RequestBody Reject reject)
    {
        System.out.println("进入驳回操作");
        switch(reject.getDeptName()){
//            case 101:
//                ophthalmicService.updateOphthalmic();
//                break;
//            case 102:
//                laboratoryService.updateLaboratory();
//                break;
//            case 103:
//                entDepartmentService.updateEntDepartment();
//                break;
//            case 104:
//                surgeryService.updateSurgery();
//                break;
//            case 105:
//                dentalDepartmentService.updateDentalDepartment();
//                break;
//            case 106:
//                internalMedicineService.updateInternalMedicine();
//                break;
//            case 107:
//                departmentOfBloodPressureAndPulseService.updateDepartmentOfBloodPressureAndPulse();
//                break;
            case 108:
                ChestRadiology chestRadiology = new ChestRadiology();
                chestRadiology.setStudentId(reject.getStundetId());
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                Date newTime = null;
                try {
                    newTime = format.parse(reject.getDiagnosisTime());
                    System.out.println("转换以后的时间：："+newTime);//Sun Feb 02 02:02:02 CST 2020
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                chestRadiology.setDiagnosisTime(newTime);
                chestRadiology.setLeaderAudit("驳回");
                return toAjax(chestRadiologyService.updateChestRadiology(chestRadiology));

//            case 109:
//                otherService.updateOther();
//                break;
        }
        return null;
    }
}
