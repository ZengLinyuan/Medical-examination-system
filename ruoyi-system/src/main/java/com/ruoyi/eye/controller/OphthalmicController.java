package com.ruoyi.eye.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.*;

import com.ruoyi.common.annotation.RepeatSubmit;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.health.domain.PhysicalExaminationForm;
import com.ruoyi.health.service.IPhysicalExaminationFormService;
import com.ruoyi.student.domain.Student;
import com.ruoyi.student.service.IStudentService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.eye.domain.Ophthalmic;
import com.ruoyi.eye.service.IOphthalmicService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import java.text.SimpleDateFormat;

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

    @Autowired
    private IStudentService studentService;

    @Autowired
    private IPhysicalExaminationFormService physicalExaminationFormService;
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
     * 获取眼科详细信息
     */
    @PreAuthorize("@ss.hasPermi('eye:ophthalmic:querystudent')")
    @PostMapping( "/querystudent")
    public AjaxResult getStuInfo(@PathVariable("studentId") String studentId)
    {
        Student student = new Student();
        Ophthalmic ophthalmic = new Ophthalmic();
        student = studentService.selectStudentById(studentId);
        ophthalmic = ophthalmicService.selectOphthalmicById(studentId);
        AjaxResult ajax = new AjaxResult();
        ajax.put("name",student.getName());
        ajax.put("college",student.getCollege());
        ajax.put("major",student.getMajor());
        ajax.put("diagnosisTime",ophthalmic.getDiagnosisTime());
        return ajax;
    }

    /**
     * 新增眼科
     */
    @PreAuthorize("@ss.hasPermi('eye:ophthalmic:add')")
    @Log(title = "眼科", businessType = BusinessType.INSERT)
    @PostMapping(value = "/add")
    public AjaxResult add(@RequestBody Ophthalmic ophthalmic)
    {
        Date date = new Date();//获取当前日期时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String now = df.format(date);//以格式处理date
        //System.err.println(now);//打印处理的结果
        date = null;//清空date对象
        try {
            date = df.parse(now);//按格式逆转化now
        } catch (ParseException e) {
            e.printStackTrace();
        }
        ophthalmic.setSubmitTime(date);
        ophthalmic.setDiagnosisTime(date);
        ophthalmic.setColorVisionRed(0);
        ophthalmic.setColorVisionGreen(0);
        ophthalmic.setColorVisionPurple(0);
        ophthalmic.setColorVisionBlue(0);
        ophthalmic.setColorVisionYellow(0);
        int[] color = ophthalmic.getColorVision();
        for(int i = 0;i < color.length;i++){
            if(color[i] == 1){
                ophthalmic.setColorVisionRed(1);
            }else if(color[i] == 2){
                ophthalmic.setColorVisionGreen(1);
            }else if(color[i] == 3){
                ophthalmic.setColorVisionPurple(1);
            }else if(color[i] == 4){
                ophthalmic.setColorVisionBlue(1);
            }else if(color[i] == 5){
                ophthalmic.setColorVisionYellow(1);
            }
        }
        ophthalmic.setDoctorAudit("审核中");
        ophthalmic.setLeaderAudit("审核中");
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
        PhysicalExaminationForm physicalExaminationForm = new PhysicalExaminationForm();
        physicalExaminationForm.setStudentId(ophthalmic.getStudentId());
        physicalExaminationForm.setDoctorAudit("未审核");
        physicalExaminationForm.setLeaderAudit("未审核");
        physicalExaminationFormService.updatePhysicalExaminationFormAudit(physicalExaminationForm);
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
