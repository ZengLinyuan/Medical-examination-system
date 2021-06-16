package com.ruoyi.eye.controller;

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
import com.ruoyi.eye.domain.Ophthalmic;
import com.ruoyi.eye.service.IOphthalmicService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 眼科Controller
 * 
 * @author qpg
 * @date 2021-06-10
 */
@RestController
@RequestMapping("/department/ophthalmic")
public class OphthalmicController extends BaseController
{
    @Autowired
    private IOphthalmicService ophthalmicService;

    /**
     * 查询眼科列表
     */
    @PreAuthorize("@ss.hasPermi('eye:ophthalmic:list')")
    @GetMapping("/list")
    public TableDataInfo list(Ophthalmic ophthalmic)
    {
        startPage();
        List<Ophthalmic> list = ophthalmicService.selectOphthalmicList(ophthalmic);
        return getDataTable(list);
    }

    /**
     * 导出眼科列表
     */
    @PreAuthorize("@ss.hasPermi('eye:ophthalmic:export')")
    @Log(title = "眼科", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Ophthalmic ophthalmic)
    {
        List<Ophthalmic> list = ophthalmicService.selectOphthalmicList(ophthalmic);
        ExcelUtil<Ophthalmic> util = new ExcelUtil<Ophthalmic>(Ophthalmic.class);
        return util.exportExcel(list, "眼科数据");
    }

    /**
     * 获取眼科详细信息
     */
    @PreAuthorize("@ss.hasPermi('eye:ophthalmic:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {
        return AjaxResult.success(ophthalmicService.selectOphthalmicById(studentId));
    }

    /**
     * 新增眼科
     */
    @PreAuthorize("@ss.hasPermi('eye:ophthalmic:add')")
    @Log(title = "眼科", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Ophthalmic ophthalmic)
    {
        return toAjax(ophthalmicService.insertOphthalmic(ophthalmic));
    }

    /**
     * 修改眼科
     */
    @PreAuthorize("@ss.hasPermi('eye:ophthalmic:edit')")
    @Log(title = "眼科", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Ophthalmic ophthalmic)
    {
        return toAjax(ophthalmicService.updateOphthalmic(ophthalmic));
    }

    /**
     * 删除眼科
     */
    @PreAuthorize("@ss.hasPermi('eye:ophthalmic:remove')")
    @Log(title = "眼科", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(ophthalmicService.deleteOphthalmicByIds(studentIds));
    }
}
