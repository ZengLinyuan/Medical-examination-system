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
import com.ruoyi.department.domain.Surgery;
import com.ruoyi.department.service.ISurgeryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 外科Controller
 * 
 * @author ruoyi
 * @date 2021-06-18
 */
@RestController
@RequestMapping("/department/surgery")
public class SurgeryController extends BaseController
{
    @Autowired
    private ISurgeryService surgeryService;

    @Autowired
    private IPhysicalExaminationFormService physicalExaminationFormService;
    /**
     * 查询外科列表
     */
    @PreAuthorize("@ss.hasPermi('department:surgery:list')")
    @GetMapping("/list")
    public TableDataInfo list(Surgery surgery)
    {
        startPage();
        List<Surgery> list = surgeryService.selectSurgeryList(surgery);
        Iterator<Surgery> it = list.iterator();
        List<Surgery> target = new ArrayList<Surgery>();
        while(it.hasNext()){
            Surgery entDepartment1 = it.next();
            if(entDepartment1.getDoctorAudit().equals("驳回") || entDepartment1.getLeaderAudit().equals("驳回")){
                target.add(entDepartment1);
            }
        }
        return getDataTable(target);
    }

    /**
     * 导出外科列表
     */
    @PreAuthorize("@ss.hasPermi('department:surgery:export')")
    @Log(title = "外科", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Surgery surgery)
    {
        List<Surgery> list = surgeryService.selectSurgeryList(surgery);
        ExcelUtil<Surgery> util = new ExcelUtil<Surgery>(Surgery.class);
        return util.exportExcel(list, "外科数据");
    }

    /**
     * 获取外科详细信息
     */
    @PreAuthorize("@ss.hasPermi('department:surgery:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {
        return AjaxResult.success(surgeryService.selectSurgeryById(studentId));
    }

    /**
     * 新增外科
     */
    @PreAuthorize("@ss.hasPermi('department:surgery:add')")
    @Log(title = "外科", businessType = BusinessType.INSERT)
    @PostMapping(value = "/add")
    public AjaxResult add(@RequestBody Surgery surgery)
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
        surgery.setSubmitTime(date);
        surgery.setDiagnosisTime(date);
        surgery.setDoctorAudit("审核中");
        surgery.setLeaderAudit("审核中");
        return toAjax(surgeryService.insertSurgery(surgery));
    }

    /**
     * 修改外科
     */
    @PreAuthorize("@ss.hasPermi('department:surgery:edit')")
    @Log(title = "外科", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Surgery surgery)
    {
        PhysicalExaminationForm physicalExaminationForm = new PhysicalExaminationForm();
        physicalExaminationForm.setStudentId(surgery.getStudentId());
        physicalExaminationForm.setDoctorAudit("未审核");
        physicalExaminationForm.setLeaderAudit("未审核");
        physicalExaminationFormService.updatePhysicalExaminationFormAudit(physicalExaminationForm);
        return toAjax(surgeryService.updateSurgery(surgery));
    }

    /**
     * 删除外科
     */
    @PreAuthorize("@ss.hasPermi('department:surgery:remove')")
    @Log(title = "外科", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(surgeryService.deleteSurgeryByIds(studentIds));
    }
}
