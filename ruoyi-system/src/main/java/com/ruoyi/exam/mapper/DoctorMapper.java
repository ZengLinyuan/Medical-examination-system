package com.ruoyi.exam.mapper;

import java.util.List;
import com.ruoyi.exam.domain.Doctor;

/**
 * 医生Mapper接口
 * 
 * @author qpg
 * @date 2021-06-09
 */
public interface DoctorMapper 
{
    /**
     * 查询医生
     * 
     * @param id 医生ID
     * @return 医生
     */
    public Doctor selectDoctorById(String id);

    /**
     * 查询医生列表
     * 
     * @param doctor 医生
     * @return 医生集合
     */
    public List<Doctor> selectDoctorList(Doctor doctor);

    /**
     * 新增医生
     * 
     * @param doctor 医生
     * @return 结果
     */
    public int insertDoctor(Doctor doctor);

    /**
     * 修改医生
     * 
     * @param doctor 医生
     * @return 结果
     */
    public int updateDoctor(Doctor doctor);

    /**
     * 删除医生
     * 
     * @param id 医生ID
     * @return 结果
     */
    public int deleteDoctorById(String id);

    /**
     * 批量删除医生
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteDoctorByIds(String[] ids);
}
