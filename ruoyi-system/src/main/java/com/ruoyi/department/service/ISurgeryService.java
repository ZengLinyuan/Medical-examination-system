package com.ruoyi.department.service;

import java.util.List;
import com.ruoyi.department.domain.Surgery;

/**
 * 外科Service接口
 * 
 * @author ruoyi
 * @date 2021-06-17
 */
public interface ISurgeryService 
{
    /**
     * 查询外科
     * 
     * @param studentId 外科ID
     * @return 外科
     */
    public Surgery selectSurgeryById(String studentId);

    /**
     * 查询外科列表
     * 
     * @param surgery 外科
     * @return 外科集合
     */
    public List<Surgery> selectSurgeryList(Surgery surgery);

    /**
     * 新增外科
     * 
     * @param surgery 外科
     * @return 结果
     */
    public int insertSurgery(Surgery surgery);

    /**
     * 修改外科
     * 
     * @param surgery 外科
     * @return 结果
     */
    public int updateSurgery(Surgery surgery);

    /**
     * 批量删除外科
     * 
     * @param studentIds 需要删除的外科ID
     * @return 结果
     */
    public int deleteSurgeryByIds(String[] studentIds);

    /**
     * 删除外科信息
     * 
     * @param studentId 外科ID
     * @return 结果
     */
    public int deleteSurgeryById(String studentId);
}
