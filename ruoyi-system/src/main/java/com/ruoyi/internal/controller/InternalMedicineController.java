package com.ruoyi.internal.controller;

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
import com.ruoyi.internal.domain.InternalMedicine;
import com.ruoyi.internal.service.IInternalMedicineService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 内科Controller
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
@RestController
@RequestMapping("/system/medicine")
public class InternalMedicineController extends BaseController
{
    @Autowired
    private IInternalMedicineService internalMedicineService;

    /**
     * 查询内科列表
     */
    @PreAuthorize("@ss.hasPermi('system:medicine:list')")
    @GetMapping("/list")
    public TableDataInfo list(InternalMedicine internalMedicine)
    {
        startPage();
        List<InternalMedicine> list = internalMedicineService.selectInternalMedicineList(internalMedicine);
        return getDataTable(list);
    }

    /**
     * 导出内科列表
     */
    @PreAuthorize("@ss.hasPermi('system:medicine:export')")
    @Log(title = "内科", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(InternalMedicine internalMedicine)
    {
        List<InternalMedicine> list = internalMedicineService.selectInternalMedicineList(internalMedicine);
        ExcelUtil<InternalMedicine> util = new ExcelUtil<InternalMedicine>(InternalMedicine.class);
        return util.exportExcel(list, "内科数据");
    }

    /**
     * 获取内科详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:medicine:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {
        return AjaxResult.success(internalMedicineService.selectInternalMedicineById(studentId));
    }

    /**
     * 新增内科
     */
    @PreAuthorize("@ss.hasPermi('system:medicine:add')")
    @Log(title = "内科", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody InternalMedicine internalMedicine)
    {
        return toAjax(internalMedicineService.insertInternalMedicine(internalMedicine));
    }

    /**
     * 修改内科
     */
    @PreAuthorize("@ss.hasPermi('system:medicine:edit')")
    @Log(title = "内科", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody InternalMedicine internalMedicine)
    {
        return toAjax(internalMedicineService.updateInternalMedicine(internalMedicine));
    }

    /**
     * 删除内科
     */
    @PreAuthorize("@ss.hasPermi('system:medicine:remove')")
    @Log(title = "内科", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(internalMedicineService.deleteInternalMedicineByIds(studentIds));
    }
}
