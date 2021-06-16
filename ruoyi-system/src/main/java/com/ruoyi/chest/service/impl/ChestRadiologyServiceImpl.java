package com.ruoyi.chest.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.chest.mapper.ChestRadiologyMapper;
import com.ruoyi.chest.domain.ChestRadiology;
import com.ruoyi.chest.service.IChestRadiologyService;

/**
 * 胸部放射检查Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
@Service
public class ChestRadiologyServiceImpl implements IChestRadiologyService 
{
    @Autowired
    private ChestRadiologyMapper chestRadiologyMapper;

    /**
     * 查询胸部放射检查
     * 
     * @param studentId 胸部放射检查ID
     * @return 胸部放射检查
     */
    @Override
    public ChestRadiology selectChestRadiologyById(String studentId)
    {
        return chestRadiologyMapper.selectChestRadiologyById(studentId);
    }

    /**
     * 查询胸部放射检查列表
     * 
     * @param chestRadiology 胸部放射检查
     * @return 胸部放射检查
     */
    @Override
    public List<ChestRadiology> selectChestRadiologyList(ChestRadiology chestRadiology)
    {
        return chestRadiologyMapper.selectChestRadiologyList(chestRadiology);
    }

    /**
     * 新增胸部放射检查
     * 
     * @param chestRadiology 胸部放射检查
     * @return 结果
     */
    @Override
    public int insertChestRadiology(ChestRadiology chestRadiology)
    {
        return chestRadiologyMapper.insertChestRadiology(chestRadiology);
    }

    /**
     * 修改胸部放射检查
     * 
     * @param chestRadiology 胸部放射检查
     * @return 结果
     */
    @Override
    public int updateChestRadiology(ChestRadiology chestRadiology)
    {
        return chestRadiologyMapper.updateChestRadiology(chestRadiology);
    }

    /**
     * 批量删除胸部放射检查
     * 
     * @param studentIds 需要删除的胸部放射检查ID
     * @return 结果
     */
    @Override
    public int deleteChestRadiologyByIds(String[] studentIds)
    {
        return chestRadiologyMapper.deleteChestRadiologyByIds(studentIds);
    }

    /**
     * 删除胸部放射检查信息
     * 
     * @param studentId 胸部放射检查ID
     * @return 结果
     */
    @Override
    public int deleteChestRadiologyById(String studentId)
    {
        return chestRadiologyMapper.deleteChestRadiologyById(studentId);
    }
}
