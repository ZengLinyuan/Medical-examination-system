package com.ruoyi.department.service;

import java.util.List;
import com.ruoyi.department.domain.EntDepartment;

/**
 * 耳鼻喉科Service接口
 * 
 * @author ruoyi
 * @date 2021-06-18
 */
public interface IEntDepartmentService 
{
    /**
     * 查询耳鼻喉科
     * 
     * @param studentId 耳鼻喉科ID
     * @return 耳鼻喉科
     */
    public EntDepartment selectEntDepartmentById(String studentId);

    /**
     * 查询耳鼻喉科列表
     * 
     * @param entDepartment 耳鼻喉科
     * @return 耳鼻喉科集合
     */
    public List<EntDepartment> selectEntDepartmentList(EntDepartment entDepartment);

    /**
     * 新增耳鼻喉科
     * 
     * @param entDepartment 耳鼻喉科
     * @return 结果
     */
    public int insertEntDepartment(EntDepartment entDepartment);

    /**
     * 修改耳鼻喉科
     * 
     * @param entDepartment 耳鼻喉科
     * @return 结果
     */
    public int updateEntDepartment(EntDepartment entDepartment);

    /**
     * 批量删除耳鼻喉科
     * 
     * @param studentIds 需要删除的耳鼻喉科ID
     * @return 结果
     */
    public int deleteEntDepartmentByIds(String[] studentIds);

    /**
     * 删除耳鼻喉科信息
     * 
     * @param studentId 耳鼻喉科ID
     * @return 结果
     */
    public int deleteEntDepartmentById(String studentId);

    public int updateEntDepartmentLeaderAudit(EntDepartment entDepartment);

    public int updateEntDepartmentDoctorAudit(EntDepartment entDepartment);
}
