package com.ruoyi.dental.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dental.mapper.DentalDepartmentMapper;
import com.ruoyi.dental.domain.DentalDepartment;
import com.ruoyi.dental.service.IDentalDepartmentService;

/**
 * 牙科Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
@Service
public class DentalDepartmentServiceImpl implements IDentalDepartmentService 
{
    @Autowired
    private DentalDepartmentMapper dentalDepartmentMapper;

    /**
     * 查询牙科
     * 
     * @param studentId 牙科ID
     * @return 牙科
     */
    @Override
    public DentalDepartment selectDentalDepartmentById(String studentId)
    {
        return dentalDepartmentMapper.selectDentalDepartmentById(studentId);
    }

    /**
     * 查询牙科列表
     * 
     * @param dentalDepartment 牙科
     * @return 牙科
     */
    @Override
    public List<DentalDepartment> selectDentalDepartmentList(DentalDepartment dentalDepartment)
    {
        return dentalDepartmentMapper.selectDentalDepartmentList(dentalDepartment);
    }

    /**
     * 新增牙科
     * 
     * @param dentalDepartment 牙科
     * @return 结果
     */
    @Override
    public int insertDentalDepartment(DentalDepartment dentalDepartment)
    {
        return dentalDepartmentMapper.insertDentalDepartment(dentalDepartment);
    }

    /**
     * 修改牙科
     * 
     * @param dentalDepartment 牙科
     * @return 结果
     */
    @Override
    public int updateDentalDepartment(DentalDepartment dentalDepartment)
    {
        return dentalDepartmentMapper.updateDentalDepartment(dentalDepartment);
    }

    /**
     * 批量删除牙科
     * 
     * @param studentIds 需要删除的牙科ID
     * @return 结果
     */
    @Override
    public int deleteDentalDepartmentByIds(String[] studentIds)
    {
        return dentalDepartmentMapper.deleteDentalDepartmentByIds(studentIds);
    }

    /**
     * 删除牙科信息
     * 
     * @param studentId 牙科ID
     * @return 结果
     */
    @Override
    public int deleteDentalDepartmentById(String studentId)
    {
        return dentalDepartmentMapper.deleteDentalDepartmentById(studentId);
    }
}