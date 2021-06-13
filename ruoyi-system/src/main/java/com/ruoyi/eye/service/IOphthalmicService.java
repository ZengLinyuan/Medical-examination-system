package com.ruoyi.eye.service;

import java.util.List;
import com.ruoyi.eye.domain.Ophthalmic;

/**
 * 眼科Service接口
 * 
 * @author qpg
 * @date 2021-06-10
 */
public interface IOphthalmicService 
{
    /**
     * 查询眼科
     * 
     * @param studentId 眼科ID
     * @return 眼科
     */
    public Ophthalmic selectOphthalmicById(String studentId);

    /**
     * 查询眼科列表
     * 
     * @param ophthalmic 眼科
     * @return 眼科集合
     */
    public List<Ophthalmic> selectOphthalmicList(Ophthalmic ophthalmic);

    /**
     * 新增眼科
     * 
     * @param ophthalmic 眼科
     * @return 结果
     */
    public int insertOphthalmic(Ophthalmic ophthalmic);

    /**
     * 修改眼科
     * 
     * @param ophthalmic 眼科
     * @return 结果
     */
    public int updateOphthalmic(Ophthalmic ophthalmic);

    /**
     * 批量删除眼科
     * 
     * @param studentIds 需要删除的眼科ID
     * @return 结果
     */
    public int deleteOphthalmicByIds(String[] studentIds);

    /**
     * 删除眼科信息
     * 
     * @param studentId 眼科ID
     * @return 结果
     */
    public int deleteOphthalmicById(String studentId);
}
