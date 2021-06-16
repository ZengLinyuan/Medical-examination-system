package com.ruoyi.bloodpressure.service.impl;

import java.util.List;

import com.ruoyi.bloodpressure.service.IDepartmentOfBloodPressureAndPulseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.bloodpressure.mapper.DepartmentOfBloodPressureAndPulseMapper;
import com.ruoyi.bloodpressure.domain.DepartmentOfBloodPressureAndPulse;
import com.ruoyi.bloodpressure.service.IDepartmentOfBloodPressureAndPulseService;

/**
 * 血压脉搏科Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
@Service
public class DepartmentOfBloodPressureAndPulseServiceImpl implements IDepartmentOfBloodPressureAndPulseService
{
    @Autowired
    private DepartmentOfBloodPressureAndPulseMapper departmentOfBloodPressureAndPulseMapper;

    /**
     * 查询血压脉搏科
     * 
     * @param studentId 血压脉搏科ID
     * @return 血压脉搏科
     */
    @Override
    public DepartmentOfBloodPressureAndPulse selectDepartmentOfBloodPressureAndPulseById(String studentId)
    {
        return departmentOfBloodPressureAndPulseMapper.selectDepartmentOfBloodPressureAndPulseById(studentId);
    }

    /**
     * 查询血压脉搏科列表
     * 
     * @param departmentOfBloodPressureAndPulse 血压脉搏科
     * @return 血压脉搏科
     */
    @Override
    public List<DepartmentOfBloodPressureAndPulse> selectDepartmentOfBloodPressureAndPulseList(DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse)
    {
        return departmentOfBloodPressureAndPulseMapper.selectDepartmentOfBloodPressureAndPulseList(departmentOfBloodPressureAndPulse);
    }

    /**
     * 新增血压脉搏科
     * 
     * @param departmentOfBloodPressureAndPulse 血压脉搏科
     * @return 结果
     */
    @Override
    public int insertDepartmentOfBloodPressureAndPulse(DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse)
    {
        return departmentOfBloodPressureAndPulseMapper.insertDepartmentOfBloodPressureAndPulse(departmentOfBloodPressureAndPulse);
    }

    /**
     * 修改血压脉搏科
     * 
     * @param departmentOfBloodPressureAndPulse 血压脉搏科
     * @return 结果
     */
    @Override
    public int updateDepartmentOfBloodPressureAndPulse(DepartmentOfBloodPressureAndPulse departmentOfBloodPressureAndPulse)
    {
        return departmentOfBloodPressureAndPulseMapper.updateDepartmentOfBloodPressureAndPulse(departmentOfBloodPressureAndPulse);
    }

    /**
     * 批量删除血压脉搏科
     * 
     * @param studentIds 需要删除的血压脉搏科ID
     * @return 结果
     */
    @Override
    public int deleteDepartmentOfBloodPressureAndPulseByIds(String[] studentIds)
    {
        return departmentOfBloodPressureAndPulseMapper.deleteDepartmentOfBloodPressureAndPulseByIds(studentIds);
    }

    /**
     * 删除血压脉搏科信息
     * 
     * @param studentId 血压脉搏科ID
     * @return 结果
     */
    @Override
    public int deleteDepartmentOfBloodPressureAndPulseById(String studentId)
    {
        return departmentOfBloodPressureAndPulseMapper.deleteDepartmentOfBloodPressureAndPulseById(studentId);
    }
}
