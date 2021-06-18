package com.ruoyi.department.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.department.mapper.EntDepartmentMapper;
import com.ruoyi.department.domain.EntDepartment;
import com.ruoyi.department.service.IEntDepartmentService;

/**
 * 耳鼻喉科Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-06-18
 */
@Service
public class EntDepartmentServiceImpl implements IEntDepartmentService 
{
    @Autowired
    private EntDepartmentMapper entDepartmentMapper;

    /**
     * 查询耳鼻喉科
     * 
     * @param studentId 耳鼻喉科ID
     * @return 耳鼻喉科
     */
    @Override
    public EntDepartment selectEntDepartmentById(String studentId)
    {
        return entDepartmentMapper.selectEntDepartmentById(studentId);
    }

    /**
     * 查询耳鼻喉科列表
     * 
     * @param entDepartment 耳鼻喉科
     * @return 耳鼻喉科
     */
    @Override
    public List<EntDepartment> selectEntDepartmentList(EntDepartment entDepartment)
    {
        return entDepartmentMapper.selectEntDepartmentList(entDepartment);
    }

    /**
     * 新增耳鼻喉科
     * 
     * @param entDepartment 耳鼻喉科
     * @return 结果
     */
    @Override
    public int insertEntDepartment(EntDepartment entDepartment)
    {
        return entDepartmentMapper.insertEntDepartment(entDepartment);
    }

    /**
     * 修改耳鼻喉科
     * 
     * @param entDepartment 耳鼻喉科
     * @return 结果
     */
    @Override
    public int updateEntDepartment(EntDepartment entDepartment)
    {
        return entDepartmentMapper.updateEntDepartment(entDepartment);
    }

    /**
     * 批量删除耳鼻喉科
     * 
     * @param studentIds 需要删除的耳鼻喉科ID
     * @return 结果
     */
    @Override
    public int deleteEntDepartmentByIds(String[] studentIds)
    {
        return entDepartmentMapper.deleteEntDepartmentByIds(studentIds);
    }

    /**
     * 删除耳鼻喉科信息
     * 
     * @param studentId 耳鼻喉科ID
     * @return 结果
     */
    @Override
    public int deleteEntDepartmentById(String studentId)
    {
        return entDepartmentMapper.deleteEntDepartmentById(studentId);
    }
}
