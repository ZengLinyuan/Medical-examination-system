package com.ruoyi.chest.service;

import java.util.List;
import com.ruoyi.chest.domain.ChestRadiology;

/**
 * 胸部放射检查Service接口
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
public interface IChestRadiologyService 
{
    /**
     * 查询胸部放射检查
     * 
     * @param studentId 胸部放射检查ID
     * @return 胸部放射检查
     */
    public ChestRadiology selectChestRadiologyById(String studentId);

    /**
     * 查询胸部放射检查列表
     * 
     * @param chestRadiology 胸部放射检查
     * @return 胸部放射检查集合
     */
    public List<ChestRadiology> selectChestRadiologyList(ChestRadiology chestRadiology);

    /**
     * 新增胸部放射检查
     * 
     * @param chestRadiology 胸部放射检查
     * @return 结果
     */
    public int insertChestRadiology(ChestRadiology chestRadiology);

    /**
     * 修改胸部放射检查
     * 
     * @param chestRadiology 胸部放射检查
     * @return 结果
     */
    public int updateChestRadiology(ChestRadiology chestRadiology);

    /**
     * 批量删除胸部放射检查
     * 
     * @param studentIds 需要删除的胸部放射检查ID
     * @return 结果
     */
    public int deleteChestRadiologyByIds(String[] studentIds);

    /**
     * 删除胸部放射检查信息
     * 
     * @param studentId 胸部放射检查ID
     * @return 结果
     */
    public int deleteChestRadiologyById(String studentId);
}
