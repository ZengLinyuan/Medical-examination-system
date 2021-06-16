package com.ruoyi.administrators.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.administrators.mapper.AdministratorsMapper;
import com.ruoyi.administrators.domain.Administrators;
import com.ruoyi.administrators.service.IAdministratorsService;

/**
 * 管理员Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
@Service
public class AdministratorsServiceImpl implements IAdministratorsService 
{
    @Autowired
    private AdministratorsMapper administratorsMapper;

    /**
     * 查询管理员
     * 
     * @param userName 管理员ID
     * @return 管理员
     */
    @Override
    public Administrators selectAdministratorsById(String userName)
    {
        return administratorsMapper.selectAdministratorsById(userName);
    }

    /**
     * 查询管理员列表
     * 
     * @param administrators 管理员
     * @return 管理员
     */
    @Override
    public List<Administrators> selectAdministratorsList(Administrators administrators)
    {
        return administratorsMapper.selectAdministratorsList(administrators);
    }

    /**
     * 新增管理员
     * 
     * @param administrators 管理员
     * @return 结果
     */
    @Override
    public int insertAdministrators(Administrators administrators)
    {
        return administratorsMapper.insertAdministrators(administrators);
    }

    /**
     * 修改管理员
     * 
     * @param administrators 管理员
     * @return 结果
     */
    @Override
    public int updateAdministrators(Administrators administrators)
    {
        return administratorsMapper.updateAdministrators(administrators);
    }

    /**
     * 批量删除管理员
     * 
     * @param userNames 需要删除的管理员ID
     * @return 结果
     */
    @Override
    public int deleteAdministratorsByIds(String[] userNames)
    {
        return administratorsMapper.deleteAdministratorsByIds(userNames);
    }

    /**
     * 删除管理员信息
     * 
     * @param userName 管理员ID
     * @return 结果
     */
    @Override
    public int deleteAdministratorsById(String userName)
    {
        return administratorsMapper.deleteAdministratorsById(userName);
    }
}
