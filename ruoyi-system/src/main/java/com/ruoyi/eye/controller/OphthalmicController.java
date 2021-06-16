package com.ruoyi.eye.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.List;
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
import java.util.Date;
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

    /**
     * 新增眼科
     */
    @PreAuthorize("@ss.hasPermi('eye:ophthalmic:load')")
    @Log(title = "眼科", businessType = BusinessType.INSERT)
    @PostMapping(value = "/load")
    public AjaxResult load(//@PathVariable("studentId") String studentId,
                           //@RequestParam("field109") BigDecimal sight_left_noglasses,
                           //@RequestParam("field110") BigDecimal sight_right_noglasses,
                           //@RequestParam("field111") BigDecimal sight_left_withglasses,
                           //@RequestParam("field112") BigDecimal sight_right_withglasses,
                           //@RequestParam("field113") String eye_illness,
                           //@RequestParam("field115") int[] color_vision,
                           //@RequestParam("field117") String doctor_opinion
    )
    {
        System.out.println(111);
        Ophthalmic ophthalmic = new Ophthalmic();
        ophthalmic.setStudentId("620111200001010003");
        //ophthalmic.setSightLeftNoglasses(sight_left_noglasses);
//        ophthalmic.setSightRightNoglasses(sight_right_noglasses);
//        ophthalmic.setSightLeftWithglasses(sight_left_withglasses);
//        ophthalmic.setSightRightWithglasses(sight_left_withglasses);
//        ophthalmic.setEyeIllness(eye_illness);
//        ophthalmic.setColorVisionRed(color_vision[0]);
//        ophthalmic.setColorVisionGreen(color_vision[1]);
//        ophthalmic.setColorVisionPurple(color_vision[2]);
//        ophthalmic.setColorVisionBlue(color_vision[3]);
//        ophthalmic.setColorVisionYellow(color_vision[4]);
        //ophthalmic.setDoctorOpinion(doctor_opinion);
        ophthalmic.setDoctorId("1");
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
        ophthalmic.setSubmitTime(date);
        ophthalmic.setDiagnosisTime(date);
        return toAjax(ophthalmicService.insertOphthalmic(ophthalmic));
    }
}
