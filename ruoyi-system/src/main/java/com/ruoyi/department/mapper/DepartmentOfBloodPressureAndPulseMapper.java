package com.ruoyi.department.mapper;

import java.util.List;
import com.ruoyi.department.domain.DepartmentOfBloodPressureAndPulse;

/**
 * 血压脉搏科Mapper接口
 * 
 * @author ruoyi
 * @date 2021-06-17
 */
public interface DepartmentOfBloodPressureAndPulseMapper 
{
    /**
     * 查询血压脉搏科
     * 
     * @param studentId 血压脉搏科ID
     * @return 血压脉搏科
     */
    public DepartmentOfBloodPressureAndPulse selectDepartmentOfBloodPressureAndPulseById(String studentId);

    /**
     * 查询血压脉搏科列表
     * 
     * @param departmentOfBloodPressureAndPulse 血压脉搏科
     * @return 血压脉搏科集合
     */
    public List<DepartmentOfBloodPressureAndPulse> selectDepartmentOfBloodPressureAndPulseList(DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse);

    /**
     * 新增血压脉搏科
     * 
     * @param departmentOfBloodPressureAndPulse 血压脉搏科
     * @return 结果
     */
    public int insertDepartmentOfBloodPressureAndPulse(DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse);

    /**
     * 修改血压脉搏科
     * 
     * @param departmentOfBloodPressureAndPulse 血压脉搏科
     * @return 结果
     */
    public int updateDepartmentOfBloodPressureAndPulse(DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse);

    /**
     * 删除血压脉搏科
     * 
     * @param studentId 血压脉搏科ID
     * @return 结果
     */
    public int deleteDepartmentOfBloodPressureAndPulseById(String studentId);

    /**
     * 批量删除血压脉搏科
     * 
     * @param studentIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteDepartmentOfBloodPressureAndPulseByIds(String[] studentIds);
}
