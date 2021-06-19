package com.ruoyi.department.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.ruoyi.department.domain.ChestRadiology;
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
import com.ruoyi.department.domain.Laboratory;
import com.ruoyi.department.service.ILaboratoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 化验科Controller
 * 
 * @author qpg
 * @date 2021-06-16
 */
@RestController
@RequestMapping("/department/laboratory")
public class LaboratoryController extends BaseController
{
    @Autowired
    private ILaboratoryService laboratoryService;

    @Autowired
    private IPhysicalExaminationFormService physicalExaminationFormService;
    /**
     * 查询化验科列表
     */
    @PreAuthorize("@ss.hasPermi('department:laboratory:list')")
    @GetMapping("/list")
    public TableDataInfo list(Laboratory laboratory)
    {
        startPage();
        List<Laboratory> list = laboratoryService.selectLaboratoryList(laboratory);
        Iterator<Laboratory> it = list.iterator();
        List<Laboratory> target = new ArrayList<Laboratory>();
        while(it.hasNext()){
            Laboratory entDepartment1 = it.next();
            if(entDepartment1.getDoctorAudit().equals("驳回") || entDepartment1.getLeaderAudit().equals("驳回")){
                target.add(entDepartment1);
            }
        }
        return getDataTable(target);
    }

    /**
     * 导出化验科列表
     */
    @PreAuthorize("@ss.hasPermi('department:laboratory:export')")
    @Log(title = "化验科", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Laboratory laboratory)
    {
        List<Laboratory> list = laboratoryService.selectLaboratoryList(laboratory);
        ExcelUtil<Laboratory> util = new ExcelUtil<Laboratory>(Laboratory.class);
        return util.exportExcel(list, "化验科数据");
    }

    /**
     * 获取化验科详细信息
     */
    @PreAuthorize("@ss.hasPermi('department:laboratory:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {
        return AjaxResult.success(laboratoryService.selectLaboratoryById(studentId));
    }

    /**
     * 新增化验科
     */
    @PreAuthorize("@ss.hasPermi('department:laboratory:add')")
    @Log(title = "化验科", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Laboratory laboratory)
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
        laboratory.setSubmitTime(date);
        laboratory.setDiagnosisTime(date);
        laboratory.setDoctorAudit("审核中");
        laboratory.setLeaderAudit("审核中");
        return toAjax(laboratoryService.insertLaboratory(laboratory));
    }

    /**
     * 修改化验科
     */
    @PreAuthorize("@ss.hasPermi('department:laboratory:edit')")
    @Log(title = "化验科", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Laboratory laboratory)
    {
        PhysicalExaminationForm physicalExaminationForm = new PhysicalExaminationForm();
        physicalExaminationForm.setStudentId(laboratory.getStudentId());
        physicalExaminationForm.setDoctorAudit("未审核");
        physicalExaminationForm.setLeaderAudit("未审核");
        physicalExaminationFormService.updatePhysicalExaminationFormAudit(physicalExaminationForm);
        return toAjax(laboratoryService.updateLaboratory(laboratory));
    }

    /**
     * 删除化验科
     */
    @PreAuthorize("@ss.hasPermi('department:laboratory:remove')")
    @Log(title = "化验科", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(laboratoryService.deleteLaboratoryByIds(studentIds));
    }
}
