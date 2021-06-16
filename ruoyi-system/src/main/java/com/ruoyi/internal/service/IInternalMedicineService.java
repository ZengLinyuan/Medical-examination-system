package com.ruoyi.internal.service;

import java.util.List;
import com.ruoyi.internal.domain.InternalMedicine;

/**
 * 内科Service接口
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
public interface IInternalMedicineService 
{
    /**
     * 查询内科
     * 
     * @param studentId 内科ID
     * @return 内科
     */
    public InternalMedicine selectInternalMedicineById(String studentId);

    /**
     * 查询内科列表
     * 
     * @param internalMedicine 内科
     * @return 内科集合
     */
    public List<InternalMedicine> selectInternalMedicineList(InternalMedicine internalMedicine);

    /**
     * 新增内科
     * 
     * @param internalMedicine 内科
     * @return 结果
     */
    public int insertInternalMedicine(InternalMedicine internalMedicine);

    /**
     * 修改内科
     * 
     * @param internalMedicine 内科
     * @return 结果
     */
    public int updateInternalMedicine(InternalMedicine internalMedicine);

    /**
     * 批量删除内科
     * 
     * @param studentIds 需要删除的内科ID
     * @return 结果
     */
    public int deleteInternalMedicineByIds(String[] studentIds);

    /**
     * 删除内科信息
     * 
     * @param studentId 内科ID
     * @return 结果
     */
    public int deleteInternalMedicineById(String studentId);
}
