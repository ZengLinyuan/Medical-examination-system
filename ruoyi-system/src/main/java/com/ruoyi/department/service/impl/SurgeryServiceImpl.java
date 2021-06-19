package com.ruoyi.department.service.impl;

import java.util.List;

import com.ruoyi.health.domain.PhysicalExaminationForm;
import com.ruoyi.health.service.IPhysicalExaminationFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.department.mapper.SurgeryMapper;
import com.ruoyi.department.domain.Surgery;
import com.ruoyi.department.service.ISurgeryService;

/**
 * 外科Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-06-18
 */
@Service
public class SurgeryServiceImpl implements ISurgeryService 
{
    @Autowired
    private SurgeryMapper surgeryMapper;

    @Autowired
    private IPhysicalExaminationFormService physicalExaminationFormService;
    /**
     * 查询外科
     * 
     * @param studentId 外科ID
     * @return 外科
     */
    @Override
    public Surgery selectSurgeryById(String studentId)
    {
        return surgeryMapper.selectSurgeryById(studentId);
    }

    /**
     * 查询外科列表
     * 
     * @param surgery 外科
     * @return 外科
     */
    @Override
    public List<Surgery> selectSurgeryList(Surgery surgery)
    {
        return surgeryMapper.selectSurgeryList(surgery);
    }

    /**
     * 新增外科
     * 
     * @param surgery 外科
     * @return 结果
     */
    @Override
    public int insertSurgery(Surgery surgery)
    {
        return surgeryMapper.insertSurgery(surgery);
    }

    /**
     * 修改外科
     * 
     * @param surgery 外科
     * @return 结果
     */
    @Override
    public int updateSurgery(Surgery surgery)
    {
        PhysicalExaminationForm physicalExaminationForm = new PhysicalExaminationForm();
        physicalExaminationForm.setStudentId(surgery.getStudentId());
        physicalExaminationForm.setDoctorAudit("未审核");
        physicalExaminationForm.setLeaderAudit("未审核");
        physicalExaminationFormService.updatePhysicalExaminationFormAudit(physicalExaminationForm);
        return surgeryMapper.updateSurgery(surgery);
    }

    /**
     * 批量删除外科
     * 
     * @param studentIds 需要删除的外科ID
     * @return 结果
     */
    @Override
    public int deleteSurgeryByIds(String[] studentIds)
    {
        return surgeryMapper.deleteSurgeryByIds(studentIds);
    }

    /**
     * 删除外科信息
     * 
     * @param studentId 外科ID
     * @return 结果
     */
    @Override
    public int deleteSurgeryById(String studentId)
    {
        return surgeryMapper.deleteSurgeryById(studentId);
    }

    public int updateSurgeryLeaderAudit(Surgery surgery)
    {
        return surgeryMapper.updateSurgeryLeaderAudit(surgery);
    }

    public int updateSurgeryDoctorAudit(Surgery surgery)
    {
        return surgeryMapper.updateSurgeryDoctorAudit(surgery);
    }
}
