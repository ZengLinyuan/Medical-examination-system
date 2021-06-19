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
import com.ruoyi.department.domain.ChestRadiology;
import com.ruoyi.department.service.IChestRadiologyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 胸部放射检查Controller
 * 
 * @author qpg
 * @date 2021-06-16
 */
@RestController
@RequestMapping("/department/chest")
public class ChestRadiologyController extends BaseController
{
    @Autowired
    private IChestRadiologyService chestRadiologyService;

    @Autowired
    private IPhysicalExaminationFormService physicalExaminationFormService;



    /**
     * 查询胸部放射检查列表
     */
    @PreAuthorize("@ss.hasPermi('department:chest:list')")
    @GetMapping("/list")
    public TableDataInfo list(ChestRadiology chestRadiology)
    {
        startPage();
        List<ChestRadiology> list = chestRadiologyService.selectChestRadiologyList(chestRadiology);
        Iterator<ChestRadiology> it = list.iterator();
        List<ChestRadiology> target = new ArrayList<ChestRadiology>();
        while(it.hasNext()){
            ChestRadiology entDepartment1 = it.next();
            if(entDepartment1.getDoctorAudit().equals("驳回") || entDepartment1.getLeaderAudit().equals("驳回")){
                target.add(entDepartment1);
            }
        }
        return getDataTable(target);
    }

    /**
     * 导出胸部放射检查列表
     */
    @PreAuthorize("@ss.hasPermi('department:chest:export')")
    @Log(title = "胸部放射检查", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ChestRadiology chestRadiology)
    {
        List<ChestRadiology> list = chestRadiologyService.selectChestRadiologyList(chestRadiology);
        ExcelUtil<ChestRadiology> util = new ExcelUtil<ChestRadiology>(ChestRadiology.class);
        return util.exportExcel(list, "胸部放射检查数据");
    }

    /**
     * 获取胸部放射检查详细信息
     */
    @PreAuthorize("@ss.hasPermi('department:chest:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {
        return AjaxResult.success(chestRadiologyService.selectChestRadiologyById(studentId));
    }

    /**
     * 新增胸部放射检查
     */
    @PreAuthorize("@ss.hasPermi('department:chest:add')")
    @Log(title = "胸部放射检查", businessType = BusinessType.INSERT)
    @PostMapping(value = "/add")
    public AjaxResult add(@RequestBody ChestRadiology chestRadiology)
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
        chestRadiology.setSubmitTime(date);
        chestRadiology.setDiagnosisTime(date);
        chestRadiology.setDoctorAudit("审核中");
        chestRadiology.setLeaderAudit("审核中");
        return toAjax(chestRadiologyService.insertChestRadiology(chestRadiology));
    }

    /**
     * 修改胸部放射检查
     */
    @PreAuthorize("@ss.hasPermi('department:chest:edit')")
    @Log(title = "胸部放射检查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ChestRadiology chestRadiology)
    {
        PhysicalExaminationForm physicalExaminationForm = new PhysicalExaminationForm();
        physicalExaminationForm.setStudentId(chestRadiology.getStudentId());
        physicalExaminationForm.setDoctorAudit("未审核");
        physicalExaminationForm.setLeaderAudit("未审核");
        physicalExaminationFormService.updatePhysicalExaminationFormAudit(physicalExaminationForm);
        return toAjax(chestRadiologyService.updateChestRadiology(chestRadiology));
    }

    /**
     * 删除胸部放射检查
     */
    @PreAuthorize("@ss.hasPermi('department:chest:remove')")
    @Log(title = "胸部放射检查", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {

        return toAjax(chestRadiologyService.deleteChestRadiologyByIds(studentIds));
    }


}
