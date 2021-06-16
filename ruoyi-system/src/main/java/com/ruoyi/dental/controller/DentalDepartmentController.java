package com.ruoyi.dental.controller;

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
import com.ruoyi.dental.domain.DentalDepartment;
import com.ruoyi.dental.service.IDentalDepartmentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 牙科Controller
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
@RestController
@RequestMapping("/system/department")
public class DentalDepartmentController extends BaseController
{
    @Autowired
    private IDentalDepartmentService dentalDepartmentService;

    /**
     * 查询牙科列表
     */
    @PreAuthorize("@ss.hasPermi('system:department:list')")
    @GetMapping("/list")
    public TableDataInfo list(DentalDepartment dentalDepartment)
    {
        startPage();
        List<DentalDepartment> list = dentalDepartmentService.selectDentalDepartmentList(dentalDepartment);
        return getDataTable(list);
    }

    /**
     * 导出牙科列表
     */
    @PreAuthorize("@ss.hasPermi('system:department:export')")
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
    @PreAuthorize("@ss.hasPermi('system:department:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {
        return AjaxResult.success(dentalDepartmentService.selectDentalDepartmentById(studentId));
    }

    /**
     * 新增牙科
     */
    @PreAuthorize("@ss.hasPermi('system:department:add')")
    @Log(title = "牙科", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DentalDepartment dentalDepartment)
    {
        return toAjax(dentalDepartmentService.insertDentalDepartment(dentalDepartment));
    }

    /**
     * 修改牙科
     */
    @PreAuthorize("@ss.hasPermi('system:department:edit')")
    @Log(title = "牙科", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DentalDepartment dentalDepartment)
    {
        return toAjax(dentalDepartmentService.updateDentalDepartment(dentalDepartment));
    }

    /**
     * 删除牙科
     */
    @PreAuthorize("@ss.hasPermi('system:department:remove')")
    @Log(title = "牙科", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(dentalDepartmentService.deleteDentalDepartmentByIds(studentIds));
    }
}
