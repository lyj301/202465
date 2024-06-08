package com.ruoyi.mapper;

import java.util.List;
import com.ruoyi.domain.Accounts;

/**
 * 账号管理Mapper接口
 * 
 * @author ruoyi
 * @date 2024-06-06
 */
public interface AccountsMapper 
{
    /**
     * 查询账号管理
     * 
     * @param id 账号管理主键
     * @return 账号管理
     */
    public Accounts selectAccountsById(Long id);

    /**
     * 查询账号管理列表
     * 
     * @param accounts 账号管理
     * @return 账号管理集合
     */
    public List<Accounts> selectAccountsList(Accounts accounts);

    /**
     * 新增账号管理
     * 
     * @param accounts 账号管理
     * @return 结果
     */
    public int insertAccounts(Accounts accounts);

    /**
     * 修改账号管理
     * 
     * @param accounts 账号管理
     * @return 结果
     */
    public int updateAccounts(Accounts accounts);

    /**
     * 删除账号管理
     * 
     * @param id 账号管理主键
     * @return 结果
     */
    public int deleteAccountsById(Long id);

    /**
     * 批量删除账号管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAccountsByIds(Long[] ids);

    Accounts selectAccountsByUsername(String username);
}
