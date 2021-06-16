package com.ruoyi.other.mapper;

import java.util.List;
import com.ruoyi.other.domain.Other;

/**
 * 其他科Mapper接口
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
public interface OtherMapper 
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
     * 删除其他科
     * 
     * @param studentId 其他科ID
     * @return 结果
     */
    public int deleteOtherById(String studentId);

    /**
     * 批量删除其他科
     * 
     * @param studentIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteOtherByIds(String[] studentIds);
}
