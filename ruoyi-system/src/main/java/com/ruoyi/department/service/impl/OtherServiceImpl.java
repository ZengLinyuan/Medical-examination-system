package com.ruoyi.department.service.impl;

import java.util.List;

import com.ruoyi.health.domain.PhysicalExaminationForm;
import com.ruoyi.health.service.IPhysicalExaminationFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.department.mapper.OtherMapper;
import com.ruoyi.department.domain.Other;
import com.ruoyi.department.service.IOtherService;

/**
 * 其他科Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-06-16
 */
@Service
public class OtherServiceImpl implements IOtherService 
{
    @Autowired
    private OtherMapper otherMapper;

    @Autowired
    private IPhysicalExaminationFormService physicalExaminationFormService;
    /**
     * 查询其他科
     * 
     * @param studentId 其他科ID
     * @return 其他科
     */
    @Override
    public Other selectOtherById(String studentId)
    {
        return otherMapper.selectOtherById(studentId);
    }

    /**
     * 查询其他科列表
     * 
     * @param other 其他科
     * @return 其他科
     */
    @Override
    public List<Other> selectOtherList(Other other)
    {
        return otherMapper.selectOtherList(other);
    }

    /**
     * 新增其他科
     * 
     * @param other 其他科
     * @return 结果
     */
    @Override
    public int insertOther(Other other)
    {
        return otherMapper.insertOther(other);
    }

    /**
     * 修改其他科
     * 
     * @param other 其他科
     * @return 结果
     */
    @Override
    public int updateOther(Other other)
    {
        PhysicalExaminationForm physicalExaminationForm = new PhysicalExaminationForm();
        physicalExaminationForm.setStudentId(other.getStudentId());
        physicalExaminationForm.setDoctorAudit("未审核");
        physicalExaminationForm.setLeaderAudit("未审核");
        physicalExaminationFormService.updatePhysicalExaminationFormAudit(physicalExaminationForm);
        return otherMapper.updateOther(other);
    }

    /**
     * 批量删除其他科
     * 
     * @param studentIds 需要删除的其他科ID
     * @return 结果
     */
    @Override
    public int deleteOtherByIds(String[] studentIds)
    {
        return otherMapper.deleteOtherByIds(studentIds);
    }

    /**
     * 删除其他科信息
     * 
     * @param studentId 其他科ID
     * @return 结果
     */
    @Override
    public int deleteOtherById(String studentId)
    {
        return otherMapper.deleteOtherById(studentId);
    }

    public int updateOtherLeaderAudit(Other other)
    {
        return otherMapper.updateOtherLeaderAudit(other);
    }

    public int updateOtherDoctorAudit(Other other)
    {
        return otherMapper.updateOtherDoctorAudit(other);
    }
}
