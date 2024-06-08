package com.ruoyi.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.exception.user.UserNotExistsException;
import com.ruoyi.common.exception.user.UserPasswordNotMatchException;
import com.ruoyi.common.utils.sign.Md5Utils;
import com.ruoyi.domain.Accounts;
import com.ruoyi.domain.UpdateAccounts;
import com.ruoyi.domain.UserLogin;
import com.ruoyi.mapper.AccountsMapper;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.service.IAccountsService;
import org.springframework.util.DigestUtils;

import javax.security.auth.login.AccountLockedException;
import javax.security.auth.login.AccountNotFoundException;

/**
 * 账号管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-06-06
 */
@Service
public class AccountsServiceImpl implements IAccountsService 
{
    @Autowired
    private AccountsMapper accountsMapper;

    /**
     * 查询账号管理
     * 
     * @param id 账号管理主键
     * @return 账号管理
     */
    @Override
    public Accounts selectAccountsById(Long id)
    {
        return accountsMapper.selectAccountsById(id);
    }

    /**
     * 查询账号管理列表
     * 
     * @param accounts 账号管理
     * @return 账号管理
     */
    @Override
    public List<Accounts> selectAccountsList(Accounts accounts)
    {
        return accountsMapper.selectAccountsList(accounts);
    }

    /**
     * 新增账号管理
     * 
     * @param accounts 账号管理
     * @return 结果
     */
    @Override
    public int insertAccounts(Accounts accounts)
    {
        String password = accounts.getPassword();
        accounts.setPassword(Md5Utils.hash(password));
        return accountsMapper.insertAccounts(accounts);
    }

    /**
     * 修改账号管理
     * 
     * @param accounts 账号管理
     * @return 结果
     */
    @Override
    public int updateAccounts(Accounts accounts)
    {
        if(accounts.getPassword()!=null){
            accounts.setPassword(Md5Utils.hash(accounts.getPassword()));
        }
        return accountsMapper.updateAccounts(accounts);
    }

    /**
     * 批量删除账号管理
     * 
     * @param ids 需要删除的账号管理主键
     * @return 结果
     */
    @Override
    public int deleteAccountsByIds(Long[] ids)
    {
        return accountsMapper.deleteAccountsByIds(ids);
    }

    /**
     * 删除账号管理信息
     * 
     * @param id 账号管理主键
     * @return 结果
     */
    @Override
    public int deleteAccountsById(Long id)
    {
        return accountsMapper.deleteAccountsById(id);
    }

    /**
     * 登录业务
     *
     */
    @Override
    public Accounts login(UserLogin userLogin) {
        String username = userLogin.getUsername();
        String password = userLogin.getPassword();

        //1、根据用户名查询数据库中的数据
        Accounts user = accountsMapper.selectAccountsByUsername(username);

        //2、处理各种异常情况（用户名不存在、密码不对、账号被锁定）
        if (user == null) {
            //账号不存在
            throw new UserNotExistsException();
        }

        //密码比对
        password= Md5Utils.hash(password);
        if (!password.equals(user.getPassword())) {
            //密码错误
            throw new UserPasswordNotMatchException();
        }
        user.setPassword(null);
        //3、返回实体对象
        return user;
    }

    @Override
    public AjaxResult UserUpdateAccounts(UpdateAccounts updateAccounts) {
        if(!updateAccounts.getNewPassword1().equals(updateAccounts.getNewPassword2())){
            return AjaxResult.error("请输入新密码");
        }
        if(!Md5Utils.hash(updateAccounts.getOldUsername()).equals(accountsMapper.selectAccountsById(updateAccounts.getId()).getPassword())){
            return AjaxResult.success("请输入旧密码");
        }
        Accounts accounts = new Accounts();
        accounts.setId(updateAccounts.getId());
        accounts.setPassword(updateAccounts.getNewPassword2());
        accountsMapper.updateAccounts(accounts);
        return AjaxResult.success();
    }
}
