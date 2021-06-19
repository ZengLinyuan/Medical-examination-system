package com.ruoyi.department.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.ruoyi.health.domain.PhysicalExaminationForm;
import com.ruoyi.health.service.IPhysicalExaminationFormService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.ruoyi.department.domain.DepartmentOfBloodPressureAndPulse;
import com.ruoyi.department.service.IDepartmentOfBloodPressureAndPulseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 血压脉搏科Controller
 * 
 * @author ruoyi
 * @date 2021-06-18
 */
@RestController
@RequestMapping("/department/pulse")
public class DepartmentOfBloodPressureAndPulseController extends BaseController
{
    @Autowired
    private IDepartmentOfBloodPressureAndPulseService departmentOfBloodPressureAndPulseService;

    @Autowired
    private IPhysicalExaminationFormService physicalExaminationFormService;
    /**
     * 查询血压脉搏科列表
     */
    @PreAuthorize("@ss.hasPermi('department:pulse:list')")
    @GetMapping("/list")
    public TableDataInfo list(DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse)
    {
        startPage();
        List<DepartmentOfBloodPressureAndPulse> list = departmentOfBloodPressureAndPulseService.selectDepartmentOfBloodPressureAndPulseList(departmentOfBloodPressureAndPulse);
        Iterator<DepartmentOfBloodPressureAndPulse> it = list.iterator();
        List<DepartmentOfBloodPressureAndPulse> target = new ArrayList<DepartmentOfBloodPressureAndPulse>();
        while(it.hasNext()){
            DepartmentOfBloodPressureAndPulse entDepartment1 = it.next();
            if(entDepartment1.getDoctorAudit().equals("驳回") || entDepartment1.getLeaderAudit().equals("驳回")){
                target.add(entDepartment1);
            }
        }
        return getDataTable(target);
    }

    /**
     * 导出血压脉搏科列表
     */
    @PreAuthorize("@ss.hasPermi('department:pulse:export')")
    @Log(title = "血压脉搏科", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse)
    {
        List<DepartmentOfBloodPressureAndPulse> list = departmentOfBloodPressureAndPulseService.selectDepartmentOfBloodPressureAndPulseList(departmentOfBloodPressureAndPulse);
        ExcelUtil<DepartmentOfBloodPressureAndPulse> util = new ExcelUtil<DepartmentOfBloodPressureAndPulse>(DepartmentOfBloodPressureAndPulse.class);
        return util.exportExcel(list, "血压脉搏科数据");
    }

    /**
     * 获取血压脉搏科详细信息
     */
    @PreAuthorize("@ss.hasPermi('department:pulse:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {

        return AjaxResult.success(departmentOfBloodPressureAndPulseService.selectDepartmentOfBloodPressureAndPulseById(studentId));
    }

    /**
     * 新增血压脉搏科
     */
    @PreAuthorize("@ss.hasPermi('department:pulse:add')")
    @Log(title = "血压脉搏科", businessType = BusinessType.INSERT)
    @PostMapping(value = "/add")
    public AjaxResult add(@RequestBody DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse)
    {
        Date date = new Date();//获取当前日期时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String now = df.format(date);//以格式处理date
        System.err.println(now);//打印处理的结果
        date = null;//清空date对象
        try {
            date = df.parse(now);//按格式逆转化now
        } catch (ParseException e) {
            e.printStackTrace();
        }
        departmentOfBloodPressureAndPulse.setSubmitTime(date);
        departmentOfBloodPressureAndPulse.setDiagnosisTime(date);
        departmentOfBloodPressureAndPulse.setDoctorAudit("审核中");
        departmentOfBloodPressureAndPulse.setLeaderAudit("审核中");
        return toAjax(departmentOfBloodPressureAndPulseService.insertDepartmentOfBloodPressureAndPulse(departmentOfBloodPressureAndPulse));
    }

    /**
     * 修改血压脉搏科
     */
    @PreAuthorize("@ss.hasPermi('department:pulse:edit')")
    @Log(title = "血压脉搏科", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse)
    {
        PhysicalExaminationForm physicalExaminationForm = new PhysicalExaminationForm();
        physicalExaminationForm.setStudentId(departmentOfBloodPressureAndPulse.getStudentId());
        physicalExaminationForm.setDoctorAudit("未审核");
        physicalExaminationForm.setLeaderAudit("未审核");
        physicalExaminationFormService.updatePhysicalExaminationFormAudit(physicalExaminationForm);
        return toAjax(departmentOfBloodPressureAndPulseService.updateDepartmentOfBloodPressureAndPulse(departmentOfBloodPressureAndPulse));
    }

    /**
     * 删除血压脉搏科
     */
    @PreAuthorize("@ss.hasPermi('department:pulse:remove')")
    @Log(title = "血压脉搏科", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(departmentOfBloodPressureAndPulseService.deleteDepartmentOfBloodPressureAndPulseByIds(studentIds));
    }
}
