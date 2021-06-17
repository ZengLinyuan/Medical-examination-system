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
import com.ruoyi.department.domain.InternalMedicine;
import com.ruoyi.department.service.IInternalMedicineService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 内科Controller
 * 
 * @author qpg
 * @date 2021-06-16
 */
@RestController
@RequestMapping("/department/internal")
public class InternalMedicineController extends BaseController
{
    @Autowired
    private IInternalMedicineService internalMedicineService;

    /**
     * 查询内科列表
     */
    @PreAuthorize("@ss.hasPermi('department:internal:list')")
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
    @PreAuthorize("@ss.hasPermi('department:internal:export')")
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
    @PreAuthorize("@ss.hasPermi('department:internal:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {
        return AjaxResult.success(internalMedicineService.selectInternalMedicineById(studentId));
    }

    /**
     * 新增内科
     */
    @PreAuthorize("@ss.hasPermi('department:internal:add')")
    @Log(title = "内科", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody InternalMedicine internalMedicine)
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
        internalMedicine.setSubmitTime(date);
        internalMedicine.setDiagnosisTime(date);
        internalMedicine.setDoctorAudit("审核中");
        internalMedicine.setLeaderAudit("审核中");
        return toAjax(internalMedicineService.insertInternalMedicine(internalMedicine));
    }

    /**
     * 修改内科
     */
    @PreAuthorize("@ss.hasPermi('department:internal:edit')")
    @Log(title = "内科", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody InternalMedicine internalMedicine)
    {
        return toAjax(internalMedicineService.updateInternalMedicine(internalMedicine));
    }

    /**
     * 删除内科
     */
    @PreAuthorize("@ss.hasPermi('department:internal:remove')")
    @Log(title = "内科", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(internalMedicineService.deleteInternalMedicineByIds(studentIds));
    }
}
