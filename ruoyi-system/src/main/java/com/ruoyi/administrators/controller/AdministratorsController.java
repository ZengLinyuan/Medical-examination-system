package com.ruoyi.administrators.controller;

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
import com.ruoyi.administrators.domain.Administrators;
import com.ruoyi.administrators.service.IAdministratorsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 管理员Controller
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
@RestController
@RequestMapping("/system/administrators")
public class AdministratorsController extends BaseController
{
    @Autowired
    private IAdministratorsService administratorsService;

    /**
     * 查询管理员列表
     */
    @PreAuthorize("@ss.hasPermi('system:administrators:list')")
    @GetMapping("/list")
    public TableDataInfo list(Administrators administrators)
    {
        startPage();
        List<Administrators> list = administratorsService.selectAdministratorsList(administrators);
        return getDataTable(list);
    }

    /**
     * 导出管理员列表
     */
    @PreAuthorize("@ss.hasPermi('system:administrators:export')")
    @Log(title = "管理员", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Administrators administrators)
    {
        List<Administrators> list = administratorsService.selectAdministratorsList(administrators);
        ExcelUtil<Administrators> util = new ExcelUtil<Administrators>(Administrators.class);
        return util.exportExcel(list, "管理员数据");
    }

    /**
     * 获取管理员详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:administrators:query')")
    @GetMapping(value = "/{userName}")
    public AjaxResult getInfo(@PathVariable("userName") String userName)
    {
        return AjaxResult.success(administratorsService.selectAdministratorsById(userName));
    }

    /**
     * 新增管理员
     */
    @PreAuthorize("@ss.hasPermi('system:administrators:add')")
    @Log(title = "管理员", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Administrators administrators)
    {
        return toAjax(administratorsService.insertAdministrators(administrators));
    }

    /**
     * 修改管理员
     */
    @PreAuthorize("@ss.hasPermi('system:administrators:edit')")
    @Log(title = "管理员", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Administrators administrators)
    {
        return toAjax(administratorsService.updateAdministrators(administrators));
    }

    /**
     * 删除管理员
     */
    @PreAuthorize("@ss.hasPermi('system:administrators:remove')")
    @Log(title = "管理员", businessType = BusinessType.DELETE)
	@DeleteMapping("/{userNames}")
    public AjaxResult remove(@PathVariable String[] userNames)
    {
        return toAjax(administratorsService.deleteAdministratorsByIds(userNames));
    }
}
