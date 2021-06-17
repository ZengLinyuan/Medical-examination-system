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
import com.ruoyi.department.domain.EntDepartment;
import com.ruoyi.department.service.IEntDepartmentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 耳鼻喉科Controller
 * 
 * @author ruoyi
 * @date 2021-06-17
 */
@RestController
@RequestMapping("/department/ent")
public class EntDepartmentController extends BaseController
{
    @Autowired
    private IEntDepartmentService entDepartmentService;

    /**
     * 查询耳鼻喉科列表
     */
    @PreAuthorize("@ss.hasPermi('department:ent:list')")
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
    @PreAuthorize("@ss.hasPermi('department:ent:export')")
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
    @PreAuthorize("@ss.hasPermi('department:ent:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") String studentId)
    {
        return AjaxResult.success(entDepartmentService.selectEntDepartmentById(studentId));
    }

    /**
     * 新增耳鼻喉科
     */
    @PreAuthorize("@ss.hasPermi('department:ent:add')")
    @Log(title = "耳鼻喉科", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EntDepartment entDepartment)
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
        entDepartment.setSubmitTime(date);
        entDepartment.setDiagnosisTime(date);
        entDepartment.setDoctorAudit("审核中");
        entDepartment.setLeaderAudit("审核中");
        return toAjax(entDepartmentService.insertEntDepartment(entDepartment));
    }

    /**
     * 修改耳鼻喉科
     */
    @PreAuthorize("@ss.hasPermi('department:ent:edit')")
    @Log(title = "耳鼻喉科", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EntDepartment entDepartment)
    {
        return toAjax(entDepartmentService.updateEntDepartment(entDepartment));
    }

    /**
     * 删除耳鼻喉科
     */
    @PreAuthorize("@ss.hasPermi('department:ent:remove')")
    @Log(title = "耳鼻喉科", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable String[] studentIds)
    {
        return toAjax(entDepartmentService.deleteEntDepartmentByIds(studentIds));
    }
}
