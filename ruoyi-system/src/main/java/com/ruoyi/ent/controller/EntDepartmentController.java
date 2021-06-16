package com.ruoyi.ent.controller;

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
import com.ruoyi.ent.domain.EntDepartment;
import com.ruoyi.ent.service.IEntDepartmentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 耳鼻喉科Controller
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
@RestController
@RequestMapping("/system/department")
public class EntDepartmentController extends BaseController
{
    @Autowired
    private IEntDepartmentService entDepartmentService;

    /**
     * 查询耳鼻喉科列表
     */
    @PreAuthorize("@ss.hasPermi('system:department:list')")
    @GetMapping("/list")
    public TableDataInfo list(EntDepartment entDepartment)
    {
        startPage();
        List<EntDepartment> list = entDepartmentService.selectEntDepartmentList(entDepartment);
        return getDataTable(list);
    }

    /**
     * 导出耳鼻喉科列表
     */
    @PreAuthorize("@ss.hasPermi('system:department:export')")
    @Log(title = "耳鼻喉科", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(EntDepartment entDepartment)
    {
        List<EntDepartment> list = entDepartmentService.selectEntDepartmentList(entDepartment);
        ExcelUtil<EntDepartment> util = new ExcelUtil<EntDepartment>(EntDepartment.class);
        return util.exportExcel(list, "耳鼻喉科数据");
    }

    /**
     * 获取耳鼻喉科详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:department:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {
        return AjaxResult.success(entDepartmentService.selectEntDepartmentById(studentId));
    }

    /**
     * 新增耳鼻喉科
     */
    @PreAuthorize("@ss.hasPermi('system:department:add')")
    @Log(title = "耳鼻喉科", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EntDepartment entDepartment)
    {
        return toAjax(entDepartmentService.insertEntDepartment(entDepartment));
    }

    /**
     * 修改耳鼻喉科
     */
    @PreAuthorize("@ss.hasPermi('system:department:edit')")
    @Log(title = "耳鼻喉科", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EntDepartment entDepartment)
    {
        return toAjax(entDepartmentService.updateEntDepartment(entDepartment));
    }

    /**
     * 删除耳鼻喉科
     */
    @PreAuthorize("@ss.hasPermi('system:department:remove')")
    @Log(title = "耳鼻喉科", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(entDepartmentService.deleteEntDepartmentByIds(studentIds));
    }
}
