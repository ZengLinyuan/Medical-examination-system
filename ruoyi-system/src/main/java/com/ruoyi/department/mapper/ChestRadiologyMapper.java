package com.ruoyi.department.mapper;

import java.util.List;
import com.ruoyi.department.domain.ChestRadiology;

/**
 * 胸部放射检查Mapper接口
 * 
 * @author qpg
 * @date 2021-06-16
 */
public interface ChestRadiologyMapper 
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
     * 删除胸部放射检查
     * 
     * @param studentId 胸部放射检查ID
     * @return 结果
     */
    public int deleteChestRadiologyById(String studentId);

    /**
     * 批量删除胸部放射检查
     * 
     * @param studentIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteChestRadiologyByIds(String[] studentIds);
}
