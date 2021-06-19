package com.ruoyi.department.service;

import java.util.Date;
import java.util.List;
import com.ruoyi.department.domain.ChestRadiology;

/**
 * 胸部放射检查Service接口
 * 
 * @author qpg
 * @date 2021-06-16
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

    public int updateChestRadiologyLeaderAudit(ChestRadiology chestRadiology);

    public int updateChestRadiologyDoctorAudit(ChestRadiology chestRadiology);
}
