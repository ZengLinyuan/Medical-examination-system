package com.ruoyi.laboratory.mapper;

import java.util.List;
import com.ruoyi.laboratory.domain.Laboratory;

/**
 * 化验科Mapper接口
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
public interface LaboratoryMapper 
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
     * 删除化验科
     * 
     * @param studentId 化验科ID
     * @return 结果
     */
    public int deleteLaboratoryById(String studentId);

    /**
     * 批量删除化验科
     * 
     * @param studentIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteLaboratoryByIds(String[] studentIds);
}
