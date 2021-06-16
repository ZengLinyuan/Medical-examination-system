package com.ruoyi.dental.service;

import java.util.List;
import com.ruoyi.dental.domain.DentalDepartment;

/**
 * 牙科Service接口
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
public interface IDentalDepartmentService 
{
    /**
     * 查询牙科
     * 
     * @param studentId 牙科ID
     * @return 牙科
     */
    public DentalDepartment selectDentalDepartmentById(String studentId);

    /**
     * 查询牙科列表
     * 
     * @param dentalDepartment 牙科
     * @return 牙科集合
     */
    public List<DentalDepartment> selectDentalDepartmentList(DentalDepartment dentalDepartment);

    /**
     * 新增牙科
     * 
     * @param dentalDepartment 牙科
     * @return 结果
     */
    public int insertDentalDepartment(DentalDepartment dentalDepartment);

    /**
     * 修改牙科
     * 
     * @param dentalDepartment 牙科
     * @return 结果
     */
    public int updateDentalDepartment(DentalDepartment dentalDepartment);

    /**
     * 批量删除牙科
     * 
     * @param studentIds 需要删除的牙科ID
     * @return 结果
     */
    public int deleteDentalDepartmentByIds(String[] studentIds);

    /**
     * 删除牙科信息
     * 
     * @param studentId 牙科ID
     * @return 结果
     */
    public int deleteDentalDepartmentById(String studentId);
}
