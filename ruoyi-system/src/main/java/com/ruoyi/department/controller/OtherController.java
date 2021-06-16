package com.ruoyi.department.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.ruoyi.department.domain.Other;
import com.ruoyi.department.service.IOtherService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 其他科Controller
 * 
 * @author ruoyi
 * @date 2021-06-16
 */
@RestController
@RequestMapping("/department/other")
public class OtherController extends BaseController
{
    @Autowired
    private IOtherService otherService;

    /**
     * 查询其他科列表
     */
    @PreAuthorize("@ss.hasPermi('department:other:list')")
    @GetMapping("/list")
    public TableDataInfo list(Other other)
    {
        startPage();
        List<Other> list = otherService.selectOtherList(other);
        return getDataTable(list);
    }

    /**
     * 导出其他科列表
     */
    @PreAuthorize("@ss.hasPermi('department:other:export')")
    @Log(title = "其他科", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Other other)
    {
        List<Other> list = otherService.selectOtherList(other);
        ExcelUtil<Other> util = new ExcelUtil<Other>(Other.class);
        return util.exportExcel(list, "其他科数据");
    }

    /**
     * 获取其他科详细信息
     */
    @PreAuthorize("@ss.hasPermi('department:other:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {
        return AjaxResult.success(otherService.selectOtherById(studentId));
    }

    /**
     * 新增其他科
     */
    @PreAuthorize("@ss.hasPermi('department:other:add')")
    @Log(title = "其他科", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Other other)
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
        other.setSubmitTime(date);
        other.setDiagnosisTime(date);
        return toAjax(otherService.insertOther(other));
    }

    /**
     * 修改其他科
     */
    @PreAuthorize("@ss.hasPermi('department:other:edit')")
    @Log(title = "其他科", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Other other)
    {
        return toAjax(otherService.updateOther(other));
    }

    /**
     * 删除其他科
     */
    @PreAuthorize("@ss.hasPermi('department:other:remove')")
    @Log(title = "其他科", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(otherService.deleteOtherByIds(studentIds));
    }
}
