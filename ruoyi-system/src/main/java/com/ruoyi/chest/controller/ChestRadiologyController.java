package com.ruoyi.chest.controller;

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
import com.ruoyi.chest.domain.ChestRadiology;
import com.ruoyi.chest.service.IChestRadiologyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 胸部放射检查Controller
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
@RestController
@RequestMapping("/system/radiology")
public class ChestRadiologyController extends BaseController
{
    @Autowired
    private IChestRadiologyService chestRadiologyService;

    /**
     * 查询胸部放射检查列表
     */
    @PreAuthorize("@ss.hasPermi('system:radiology:list')")
    @GetMapping("/list")
    public TableDataInfo list(ChestRadiology chestRadiology)
    {
        startPage();
        List<ChestRadiology> list = chestRadiologyService.selectChestRadiologyList(chestRadiology);
        return getDataTable(list);
    }

    /**
     * 导出胸部放射检查列表
     */
    @PreAuthorize("@ss.hasPermi('system:radiology:export')")
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
    @PreAuthorize("@ss.hasPermi('system:radiology:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {
        return AjaxResult.success(chestRadiologyService.selectChestRadiologyById(studentId));
    }

    /**
     * 新增胸部放射检查
     */
    @PreAuthorize("@ss.hasPermi('system:radiology:add')")
    @Log(title = "胸部放射检查", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ChestRadiology chestRadiology)
    {
        return toAjax(chestRadiologyService.insertChestRadiology(chestRadiology));
    }

    /**
     * 修改胸部放射检查
     */
    @PreAuthorize("@ss.hasPermi('system:radiology:edit')")
    @Log(title = "胸部放射检查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ChestRadiology chestRadiology)
    {
        return toAjax(chestRadiologyService.updateChestRadiology(chestRadiology));
    }

    /**
     * 删除胸部放射检查
     */
    @PreAuthorize("@ss.hasPermi('system:radiology:remove')")
    @Log(title = "胸部放射检查", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(chestRadiologyService.deleteChestRadiologyByIds(studentIds));
    }
}
