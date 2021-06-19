package com.ruoyi.health.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.health.mapper.PhysicalExaminationFormMapper;
import com.ruoyi.health.domain.PhysicalExaminationForm;
import com.ruoyi.health.service.IPhysicalExaminationFormService;

/**
 * 体检总Service业务层处理
 * 
 * @author qpg
 * @date 2021-06-10
 */
@Service
public class PhysicalExaminationFormServiceImpl implements IPhysicalExaminationFormService 
{
    @Autowired
    private PhysicalExaminationFormMapper physicalExaminationFormMapper;

    /**
     * 查询体检总
     * 
     * @param studentId 体检总ID
     * @return 体检总
     */
    @Override
    public PhysicalExaminationForm selectPhysicalExaminationFormById(String studentId)
    {
        return physicalExaminationFormMapper.selectPhysicalExaminationFormById(studentId);
    }

    /**
     * 查询体检总列表
     * 
     * @param physicalExaminationForm 体检总
     * @return 体检总
     */
    @Override
    public List<PhysicalExaminationForm> selectPhysicalExaminationFormList(PhysicalExaminationForm physicalExaminationForm)
    {
        return physicalExaminationFormMapper.selectPhysicalExaminationFormList(physicalExaminationForm);
    }

    /**
     * 新增体检总
     * 
     * @param physicalExaminationForm 体检总
     * @return 结果
     */
    @Override
    public int insertPhysicalExaminationForm(PhysicalExaminationForm physicalExaminationForm)
    {
        return physicalExaminationFormMapper.insertPhysicalExaminationForm(physicalExaminationForm);
    }

    /**
     * 修改体检总
     * 
     * @param physicalExaminationForm 体检总
     * @return 结果
     */
    @Override
    public int updatePhysicalExaminationForm(PhysicalExaminationForm physicalExaminationForm)
    {
        return physicalExaminationFormMapper.updatePhysicalExaminationForm(physicalExaminationForm);
    }

    /**
     * 批量删除体检总
     * 
     * @param studentIds 需要删除的体检总ID
     * @return 结果
     */
    @Override
    public int deletePhysicalExaminationFormByIds(String[] studentIds)
    {
        return physicalExaminationFormMapper.deletePhysicalExaminationFormByIds(studentIds);
    }

    /**
     * 删除体检总信息
     * 
     * @param studentId 体检总ID
     * @return 结果
     */
    @Override
    public int deletePhysicalExaminationFormById(String studentId)
    {
        return physicalExaminationFormMapper.deletePhysicalExaminationFormById(studentId);
    }


    @Override
    public List<PhysicalExaminationForm> selectAllPhysicalExaminationFormList()
    {
        return physicalExaminationFormMapper.selectAllPhysicalExaminationFormList();
    }

    public int updatePhysicalExaminationFormAudit(PhysicalExaminationForm physicalExaminationForm)
    {
        return physicalExaminationFormMapper.updatePhysicalExaminationFormAudit(physicalExaminationForm);
    }

}
