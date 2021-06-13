package com.ruoyi.health.mapper;

import java.util.List;
import com.ruoyi.health.domain.PhysicalExaminationForm;

/**
 * 体检总Mapper接口
 * 
 * @author qpg
 * @date 2021-06-10
 */
public interface PhysicalExaminationFormMapper 
{
    /**
     * 查询体检总
     * 
     * @param studentId 体检总ID
     * @return 体检总
     */
    public PhysicalExaminationForm selectPhysicalExaminationFormById(String studentId);

    /**
     * 查询体检总列表
     * 
     * @param physicalExaminationForm 体检总
     * @return 体检总集合
     */
    public List<PhysicalExaminationForm> selectPhysicalExaminationFormList(PhysicalExaminationForm physicalExaminationForm);

    /**
     * 新增体检总
     * 
     * @param physicalExaminationForm 体检总
     * @return 结果
     */
    public int insertPhysicalExaminationForm(PhysicalExaminationForm physicalExaminationForm);

    /**
     * 修改体检总
     * 
     * @param physicalExaminationForm 体检总
     * @return 结果
     */
    public int updatePhysicalExaminationForm(PhysicalExaminationForm physicalExaminationForm);

    /**
     * 删除体检总
     * 
     * @param studentId 体检总ID
     * @return 结果
     */
    public int deletePhysicalExaminationFormById(String studentId);

    /**
     * 批量删除体检总
     * 
     * @param studentIds 需要删除的数据ID
     * @return 结果
     */
    public int deletePhysicalExaminationFormByIds(String[] studentIds);
}
