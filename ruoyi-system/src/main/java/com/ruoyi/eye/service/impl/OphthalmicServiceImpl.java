package com.ruoyi.eye.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.eye.mapper.OphthalmicMapper;
import com.ruoyi.eye.domain.Ophthalmic;
import com.ruoyi.eye.service.IOphthalmicService;

/**
 * 眼科Service业务层处理
 * 
 * @author qpg
 * @date 2021-06-10
 */
@Service
public class OphthalmicServiceImpl implements IOphthalmicService 
{
    @Autowired
    private OphthalmicMapper ophthalmicMapper;

    /**
     * 查询眼科
     * 
     * @param studentId 眼科ID
     * @return 眼科
     */
    @Override
    public Ophthalmic selectOphthalmicById(String studentId)
    {
        return ophthalmicMapper.selectOphthalmicById(studentId);
    }

    /**
     * 查询眼科列表
     * 
     * @param ophthalmic 眼科
     * @return 眼科
     */
    @Override
    public List<Ophthalmic> selectOphthalmicList(Ophthalmic ophthalmic)
    {
        return ophthalmicMapper.selectOphthalmicList(ophthalmic);
    }

    /**
     * 新增眼科
     * 
     * @param ophthalmic 眼科
     * @return 结果
     */
    @Override
    public int insertOphthalmic(Ophthalmic ophthalmic)
    {
        return ophthalmicMapper.insertOphthalmic(ophthalmic);
    }

    /**
     * 修改眼科
     * 
     * @param ophthalmic 眼科
     * @return 结果
     */
    @Override
    public int updateOphthalmic(Ophthalmic ophthalmic)
    {
        return ophthalmicMapper.updateOphthalmic(ophthalmic);
    }

    /**
     * 批量删除眼科
     * 
     * @param studentIds 需要删除的眼科ID
     * @return 结果
     */
    @Override
    public int deleteOphthalmicByIds(String[] studentIds)
    {
        return ophthalmicMapper.deleteOphthalmicByIds(studentIds);
    }

    /**
     * 删除眼科信息
     * 
     * @param studentId 眼科ID
     * @return 结果
     */
    @Override
    public int deleteOphthalmicById(String studentId)
    {
        return ophthalmicMapper.deleteOphthalmicById(studentId);
    }
}
