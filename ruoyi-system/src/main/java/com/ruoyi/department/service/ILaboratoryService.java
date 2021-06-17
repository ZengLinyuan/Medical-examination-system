package com.ruoyi.department.service;

import java.util.Date;
import java.util.List;
import com.ruoyi.department.domain.Laboratory;

/**
 * 化验科Service接口
 * 
 * @author qpg
 * @date 2021-06-16
 */
public interface ILaboratoryService 
{
    /**
     * 查询化验科
     * 
     * @param studentId 化验科ID
     * @return 化验科
     */
    public Laboratory selectLaboratoryById(String studentId);

    /**
     * 查询化验科列表
     * 
     * @param laboratory 化验科
     * @return 化验科集合
     */
    public List<Laboratory> selectLaboratoryList(Laboratory laboratory);

    /**
     * 新增化验科
     * 
     * @param laboratory 化验科
     * @return 结果
     */
    public int insertLaboratory(Laboratory laboratory);

    /**
     * 修改化验科
     * 
     * @param laboratory 化验科
     * @return 结果
     */
    public int updateLaboratory(Laboratory laboratory);

    /**
     * 批量删除化验科
     * 
     * @param studentIds 需要删除的化验科ID
     * @return 结果
     */
    public int deleteLaboratoryByIds(String[] studentIds);

    /**
     * 删除化验科信息
     * 
     * @param studentId 化验科ID
     * @return 结果
     */
    public int deleteLaboratoryById(String studentId);

    public int updateLaboratoryAudit(Laboratory laboratory);
}
