package com.ruoyi.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 账号管理对象 accounts
 * 
 * @author ruoyi
 * @date 2024-06-06
 */
public class Accounts extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户ID */
    private Long id;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 学校 */
    @Excel(name = "学校")
    private String school;

    /** 身份 */
    @Excel(name = "身份")
    private String identity;

    /** 报名组别 */
    @Excel(name = "报名组别")
    private String scope;

    /** 用户名 */
    private String userName;

    /** 密码 */
    private String password;

    /** 头像 */
    private String headImage;

    /** 账户名 */
    @Excel(name = "账户名")
    private String accountName;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setSchool(String school) 
    {
        this.school = school;
    }

    public String getSchool() 
    {
        return school;
    }
    public void setIdentity(String identity) 
    {
        this.identity = identity;
    }

    public String getIdentity() 
    {
        return identity;
    }
    public void setScope(String scope) 
    {
        this.scope = scope;
    }

    public String getScope() 
    {
        return scope;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }
    public void setHeadImage(String headImage) 
    {
        this.headImage = headImage;
    }

    public String getHeadImage() 
    {
        return headImage;
    }
    public void setAccountName(String accountName) 
    {
        this.accountName = accountName;
    }

    public String getAccountName() 
    {
        return accountName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("school", getSchool())
            .append("identity", getIdentity())
            .append("scope", getScope())
            .append("userName", getUserName())
            .append("password", getPassword())
            .append("headImage", getHeadImage())
            .append("accountName", getAccountName())
            .toString();
    }
}
