package com.ruoyi.administrators.mapper;

import java.util.List;
import com.ruoyi.administrators.domain.Administrators;

/**
 * 管理员Mapper接口
 * 
 * @author ruoyi
 * @date 2021-06-15
 */
public interface AdministratorsMapper 
{
    /**
     * 查询管理员
     * 
     * @param userName 管理员ID
     * @return 管理员
     */
    public Administrators selectAdministratorsById(String userName);

    /**
     * 查询管理员列表
     * 
     * @param administrators 管理员
     * @return 管理员集合
     */
    public List<Administrators> selectAdministratorsList(Administrators administrators);

    /**
     * 新增管理员
     * 
     * @param administrators 管理员
     * @return 结果
     */
    public int insertAdministrators(Administrators administrators);

    /**
     * 修改管理员
     * 
     * @param administrators 管理员
     * @return 结果
     */
    public int updateAdministrators(Administrators administrators);

    /**
     * 删除管理员
     * 
     * @param userName 管理员ID
     * @return 结果
     */
    public int deleteAdministratorsById(String userName);

    /**
     * 批量删除管理员
     * 
     * @param userNames 需要删除的数据ID
     * @return 结果
     */
    public int deleteAdministratorsByIds(String[] userNames);
}
