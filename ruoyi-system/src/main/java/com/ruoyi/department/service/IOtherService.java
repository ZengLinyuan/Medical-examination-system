package com.ruoyi.department.service;

import java.util.List;
import com.ruoyi.department.domain.Other;

/**
 * 其他科Service接口
 * 
 * @author ruoyi
 * @date 2021-06-16
 */
public interface IOtherService 
{
    /**
     * 查询其他科
     * 
     * @param studentId 其他科ID
     * @return 其他科
     */
    public Other selectOtherById(String studentId);

    /**
     * 查询其他科列表
     * 
     * @param other 其他科
     * @return 其他科集合
     */
    public List<Other> selectOtherList(Other other);

    /**
     * 新增其他科
     * 
     * @param other 其他科
     * @return 结果
     */
    public int insertOther(Other other);

    /**
     * 修改其他科
     * 
     * @param other 其他科
     * @return 结果
     */
    public int updateOther(Other other);

    /**
     * 批量删除其他科
     * 
     * @param studentIds 需要删除的其他科ID
     * @return 结果
     */
    public int deleteOtherByIds(String[] studentIds);

    /**
     * 删除其他科信息
     * 
     * @param studentId 其他科ID
     * @return 结果
     */
    public int deleteOtherById(String studentId);

    public int updateOtherLeaderAudit(Other other);

    public int updateOtherDoctorAudit(Other other);
}
