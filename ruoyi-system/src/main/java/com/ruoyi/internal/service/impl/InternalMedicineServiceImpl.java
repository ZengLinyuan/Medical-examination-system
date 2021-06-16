package com.ruoyi.internal.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.internal.mapper.InternalMedicineMapper;
import com.ruoyi.internal.domain.InternalMedicine;
import com.ruoyi.internal.service.IInternalMedicineService;

/**
 * 内科Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
@Service
public class InternalMedicineServiceImpl implements IInternalMedicineService 
{
    @Autowired
    private InternalMedicineMapper internalMedicineMapper;

    /**
     * 查询内科
     * 
     * @param studentId 内科ID
     * @return 内科
     */
    @Override
    public InternalMedicine selectInternalMedicineById(String studentId)
    {
        return internalMedicineMapper.selectInternalMedicineById(studentId);
    }

    /**
     * 查询内科列表
     * 
     * @param internalMedicine 内科
     * @return 内科
     */
    @Override
    public List<InternalMedicine> selectInternalMedicineList(InternalMedicine internalMedicine)
    {
        return internalMedicineMapper.selectInternalMedicineList(internalMedicine);
    }

    /**
     * 新增内科
     * 
     * @param internalMedicine 内科
     * @return 结果
     */
    @Override
    public int insertInternalMedicine(InternalMedicine internalMedicine)
    {
        return internalMedicineMapper.insertInternalMedicine(internalMedicine);
    }

    /**
     * 修改内科
     * 
     * @param internalMedicine 内科
     * @return 结果
     */
    @Override
    public int updateInternalMedicine(InternalMedicine internalMedicine)
    {
        return internalMedicineMapper.updateInternalMedicine(internalMedicine);
    }

    /**
     * 批量删除内科
     * 
     * @param studentIds 需要删除的内科ID
     * @return 结果
     */
    @Override
    public int deleteInternalMedicineByIds(String[] studentIds)
    {
        return internalMedicineMapper.deleteInternalMedicineByIds(studentIds);
    }

    /**
     * 删除内科信息
     * 
     * @param studentId 内科ID
     * @return 结果
     */
    @Override
    public int deleteInternalMedicineById(String studentId)
    {
        return internalMedicineMapper.deleteInternalMedicineById(studentId);
    }
}
