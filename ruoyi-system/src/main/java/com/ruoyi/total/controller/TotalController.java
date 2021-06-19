//package com.ruoyi.total.controller;
//
//import com.ruoyi.common.annotation.Log;
//import com.ruoyi.common.core.domain.AjaxResult;
//import com.ruoyi.common.enums.BusinessType;
//import com.ruoyi.common.utils.poi.ExcelUtil;
//import com.ruoyi.eye.domain.Ophthalmic;
//import org.springframework.security.access.prepost.PreAuthorize;
//import org.springframework.web.bind.annotation.GetMapping;
//
//import java.util.List;
//
//public class TotalController {
//
//    /**
//     * 导出眼科列表
//     */
//    @PreAuthorize("@ss.hasPermi('health:form:export')")
//    @Log(title = "体检信息" , businessType = BusinessType.EXPORT)
//    @GetMapping("/export")
//    public AjaxResult export(Total)
//    {
//        List<Ophthalmic> list = ophthalmicService.selectOphthalmicList(ophthalmic);
//        ExcelUtil<Ophthalmic> util = new ExcelUtil<Ophthalmic>(Ophthalmic.class);
//        return util.exportExcel(list, "眼科数据");
//    }
//
//}
