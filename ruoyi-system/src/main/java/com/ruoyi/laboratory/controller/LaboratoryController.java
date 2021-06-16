package com.ruoyi.laboratory.controller;

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
import com.ruoyi.laboratory.domain.Laboratory;
import com.ruoyi.laboratory.service.ILaboratoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 化验科Controller
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
@RestController
@RequestMapping("/system/laboratory")
public class LaboratoryController extends BaseController
{
    @Autowired
    private ILaboratoryService laboratoryService;

    /**
     * 查询化验科列表
     */
    @PreAuthorize("@ss.hasPermi('system:laboratory:list')")
    @GetMapping("/list")
    public TableDataInfo list(Laboratory laboratory)
    {
        startPage();
        List<Laboratory> list = laboratoryService.selectLaboratoryList(laboratory);
        return getDataTable(list);
    }

    /**
     * 导出化验科列表
     */
    @PreAuthorize("@ss.hasPermi('system:laboratory:export')")
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
    @PreAuthorize("@ss.hasPermi('system:laboratory:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {
        return AjaxResult.success(laboratoryService.selectLaboratoryById(studentId));
    }

    /**
     * 新增化验科
     */
    @PreAuthorize("@ss.hasPermi('system:laboratory:add')")
    @Log(title = "化验科", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Laboratory laboratory)
    {
        return toAjax(laboratoryService.insertLaboratory(laboratory));
    }

    /**
     * 修改化验科
     */
    @PreAuthorize("@ss.hasPermi('system:laboratory:edit')")
    @Log(title = "化验科", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Laboratory laboratory)
    {
        return toAjax(laboratoryService.updateLaboratory(laboratory));
    }

    /**
     * 删除化验科
     */
    @PreAuthorize("@ss.hasPermi('system:laboratory:remove')")
    @Log(title = "化验科", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(laboratoryService.deleteLaboratoryByIds(studentIds));
    }
}
