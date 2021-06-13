package com.ruoyi.exam.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.exam.mapper.DoctorMapper;
import com.ruoyi.exam.domain.Doctor;
import com.ruoyi.exam.service.IDoctorService;

/**
 * 医生Service业务层处理
 * 
 * @author qpg
 * @date 2021-06-09
 */
@Service
public class DoctorServiceImpl implements IDoctorService 
{
    @Autowired
    private DoctorMapper doctorMapper;

    /**
     * 查询医生
     * 
     * @param id 医生ID
     * @return 医生
     */
    @Override
    public Doctor selectDoctorById(String id)
    {
        return doctorMapper.selectDoctorById(id);
    }

    /**
     * 查询医生列表
     * 
     * @param doctor 医生
     * @return 医生
     */
    @Override
    public List<Doctor> selectDoctorList(Doctor doctor)
    {
        return doctorMapper.selectDoctorList(doctor);
    }

    /**
     * 新增医生
     * 
     * @param doctor 医生
     * @return 结果
     */
    @Override
    public int insertDoctor(Doctor doctor)
    {
        return doctorMapper.insertDoctor(doctor);
    }

    /**
     * 修改医生
     * 
     * @param doctor 医生
     * @return 结果
     */
    @Override
    public int updateDoctor(Doctor doctor)
    {
        return doctorMapper.updateDoctor(doctor);
    }

    /**
     * 批量删除医生
     * 
     * @param ids 需要删除的医生ID
     * @return 结果
     */
    @Override
    public int deleteDoctorByIds(String[] ids)
    {
        return doctorMapper.deleteDoctorByIds(ids);
    }

    /**
     * 删除医生信息
     * 
     * @param id 医生ID
     * @return 结果
     */
    @Override
    public int deleteDoctorById(String id)
    {
        return doctorMapper.deleteDoctorById(id);
    }
}
