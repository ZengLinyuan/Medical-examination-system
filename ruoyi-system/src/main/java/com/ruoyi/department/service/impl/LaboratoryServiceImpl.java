package com.ruoyi.department.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.health.domain.PhysicalExaminationForm;
import com.ruoyi.health.service.IPhysicalExaminationFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.department.mapper.LaboratoryMapper;
import com.ruoyi.department.domain.Laboratory;
import com.ruoyi.department.service.ILaboratoryService;

/**
 * 化验科Service业务层处理
 * 
 * @author qpg
 * @date 2021-06-16
 */
@Service
public class LaboratoryServiceImpl implements ILaboratoryService 
{
    @Autowired
    private LaboratoryMapper laboratoryMapper;

    @Autowired
    private IPhysicalExaminationFormService physicalExaminationFormService;
    /**
     * 查询化验科
     * 
     * @param studentId 化验科ID
     * @return 化验科
     */
    @Override
    public Laboratory selectLaboratoryById(String studentId)
    {
        return laboratoryMapper.selectLaboratoryById(studentId);
    }

    /**
     * 查询化验科列表
     * 
     * @param laboratory 化验科
     * @return 化验科
     */
    @Override
    public List<Laboratory> selectLaboratoryList(Laboratory laboratory)
    {
        return laboratoryMapper.selectLaboratoryList(laboratory);
    }

    /**
     * 新增化验科
     * 
     * @param laboratory 化验科
     * @return 结果
     */
    @Override
    public int insertLaboratory(Laboratory laboratory)
    {
        return laboratoryMapper.insertLaboratory(laboratory);
    }

    /**
     * 修改化验科
     * 
     * @param laboratory 化验科
     * @return 结果
     */
    @Override
    public int updateLaboratory(Laboratory laboratory)
    {
        PhysicalExaminationForm physicalExaminationForm = new PhysicalExaminationForm();
        physicalExaminationForm.setStudentId(laboratory.getStudentId());
        physicalExaminationForm.setDoctorAudit("未审核");
        physicalExaminationForm.setLeaderAudit("未审核");
        physicalExaminationFormService.updatePhysicalExaminationFormAudit(physicalExaminationForm);

        return laboratoryMapper.updateLaboratory(laboratory);
    }

    /**
     * 批量删除化验科
     * 
     * @param studentIds 需要删除的化验科ID
     * @return 结果
     */
    @Override
    public int deleteLaboratoryByIds(String[] studentIds)
    {
        return laboratoryMapper.deleteLaboratoryByIds(studentIds);
    }

    /**
     * 删除化验科信息
     * 
     * @param studentId 化验科ID
     * @return 结果
     */
    @Override
    public int deleteLaboratoryById(String studentId)
    {
        return laboratoryMapper.deleteLaboratoryById(studentId);
    }

    public int updateLaboratoryLeaderAudit(Laboratory laboratory)
    {
        return laboratoryMapper.updateLaboratoryLeaderAudit(laboratory);
    }

    public int updateLaboratoryDoctorAudit(Laboratory laboratory)
    {
        return laboratoryMapper.updateLaboratoryDoctorAudit(laboratory);
    }
}
