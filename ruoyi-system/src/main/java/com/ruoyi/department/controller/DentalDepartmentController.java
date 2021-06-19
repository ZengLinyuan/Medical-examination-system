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
import com.ruoyi.department.domain.DentalDepartment;
import com.ruoyi.department.service.IDentalDepartmentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 牙科Controller
 * 
 * @author ruoyi
 * @date 2021-06-18
 */
@RestController
@RequestMapping("/department/dental")
public class DentalDepartmentController extends BaseController
{
    @Autowired
    private IDentalDepartmentService dentalDepartmentService;

    @Autowired
    private IPhysicalExaminationFormService physicalExaminationFormService;

    /**
     * 查询牙科列表
     */
    @PreAuthorize("@ss.hasPermi('department:dental:list')")
    @GetMapping("/list")
    public TableDataInfo list(DentalDepartment dentalDepartment)
    {
        startPage();
        List<DentalDepartment> list = dentalDepartmentService.selectDentalDepartmentList(dentalDepartment);
        Iterator<DentalDepartment> it = list.iterator();
        List<DentalDepartment> target = new ArrayList<DentalDepartment>();
        while(it.hasNext()){
            DentalDepartment entDepartment1 = it.next();
            if(entDepartment1.getDoctorAudit().equals("驳回") || entDepartment1.getLeaderAudit().equals("驳回")){
                target.add(entDepartment1);
            }
        }
        return getDataTable(target);
    }

    /**
     * 导出牙科列表
     */
    @PreAuthorize("@ss.hasPermi('department:dental:export')")
    @Log(title = "牙科", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(DentalDepartment dentalDepartment)
    {
        List<DentalDepartment> list = dentalDepartmentService.selectDentalDepartmentList(dentalDepartment);
        ExcelUtil<DentalDepartment> util = new ExcelUtil<DentalDepartment>(DentalDepartment.class);
        return util.exportExcel(list, "牙科数据");
    }

    /**
     * 获取牙科详细信息
     */
    @PreAuthorize("@ss.hasPermi('department:dental:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {

        return AjaxResult.success(dentalDepartmentService.selectDentalDepartmentById(studentId));
    }

    /**
     * 新增牙科
     */
    @PreAuthorize("@ss.hasPermi('department:dental:add')")
    @Log(title = "牙科", businessType = BusinessType.INSERT)
    @PostMapping(value = "/add")
    public AjaxResult add(@RequestBody DentalDepartment dentalDepartment)
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
        dentalDepartment.setSubmitTime(date);
        dentalDepartment.setDiagnosisTime(date);
        dentalDepartment.setDoctorAudit("审核中");
        dentalDepartment.setLeaderAudit("审核中");
        return toAjax(dentalDepartmentService.insertDentalDepartment(dentalDepartment));
    }

    /**
     * 修改牙科
     */
    @PreAuthorize("@ss.hasPermi('department:dental:edit')")
    @Log(title = "牙科", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DentalDepartment dentalDepartment)
    {
        PhysicalExaminationForm physicalExaminationForm = new PhysicalExaminationForm();
        physicalExaminationForm.setStudentId(dentalDepartment.getStudentId());
        physicalExaminationForm.setDoctorAudit("未审核");
        physicalExaminationForm.setLeaderAudit("未审核");
        physicalExaminationFormService.updatePhysicalExaminationFormAudit(physicalExaminationForm);
        return toAjax(dentalDepartmentService.updateDentalDepartment(dentalDepartment));
    }

    /**
     * 删除牙科
     */
    @PreAuthorize("@ss.hasPermi('department:dental:remove')")
    @Log(title = "牙科", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(dentalDepartmentService.deleteDentalDepartmentByIds(studentIds));
    }
}
