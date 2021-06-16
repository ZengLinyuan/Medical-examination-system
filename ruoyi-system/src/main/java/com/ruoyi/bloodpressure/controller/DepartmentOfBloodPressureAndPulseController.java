package com.ruoyi.bloodpressure.controller;

import java.util.List;
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
import com.ruoyi.bloodpressure.domain.DepartmentOfBloodPressureAndPulse;
import com.ruoyi.bloodpressure.service.IDepartmentOfBloodPressureAndPulseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 血压脉搏科Controller
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
@RestController
@RequestMapping("/system/pulse")
public class DepartmentOfBloodPressureAndPulseController extends BaseController
{
    @Autowired
    private IDepartmentOfBloodPressureAndPulseService departmentOfBloodPressureAndPulseService;

    /**
     * 查询血压脉搏科列表
     */
    @PreAuthorize("@ss.hasPermi('system:pulse:list')")
    @GetMapping("/list")
    public TableDataInfo list(DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse)
    {
        startPage();
        List<DepartmentOfBloodPressureAndPulse> list = departmentOfBloodPressureAndPulseService.selectDepartmentOfBloodPressureAndPulseList(departmentOfBloodPressureAndPulse);
        return getDataTable(list);
    }

    /**
     * 导出血压脉搏科列表
     */
    @PreAuthorize("@ss.hasPermi('system:pulse:export')")
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
    @PreAuthorize("@ss.hasPermi('system:pulse:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {
        return AjaxResult.success(departmentOfBloodPressureAndPulseService.selectDepartmentOfBloodPressureAndPulseById(studentId));
    }

    /**
     * 新增血压脉搏科
     */
    @PreAuthorize("@ss.hasPermi('system:pulse:add')")
    @Log(title = "血压脉搏科", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse)
    {
        return toAjax(departmentOfBloodPressureAndPulseService.insertDepartmentOfBloodPressureAndPulse(departmentOfBloodPressureAndPulse));
    }

    /**
     * 修改血压脉搏科
     */
    @PreAuthorize("@ss.hasPermi('system:pulse:edit')")
    @Log(title = "血压脉搏科", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse)
    {
        return toAjax(departmentOfBloodPressureAndPulseService.updateDepartmentOfBloodPressureAndPulse(departmentOfBloodPressureAndPulse));
    }

    /**
     * 删除血压脉搏科
     */
    @PreAuthorize("@ss.hasPermi('system:pulse:remove')")
    @Log(title = "血压脉搏科", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(departmentOfBloodPressureAndPulseService.deleteDepartmentOfBloodPressureAndPulseByIds(studentIds));
    }
}
