package com.ruoyi.User.Controller;

import com.ruoyi.common.JwtClaimsConstant;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.properties.JwtProperties;
import com.ruoyi.common.utils.JwtUtil;
import com.ruoyi.domain.Accounts;
import com.ruoyi.domain.UpdateAccounts;
import com.ruoyi.domain.UserLogin;
import com.ruoyi.domain.UserLoginResult;
import com.ruoyi.service.IAccountsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * ClassName: UserAccount
 * Package: com.ruoyi.User.Controller
 * Description:
 *
 * @Author lyj
 * @Create 2024/6/7 11:40
 * @Version 1.0
 */
@RestController
@RequestMapping("/User/account")
@Api(tags = "用户账号")
public class UserAccount extends BaseController {
    @Autowired
    private IAccountsService accountsService;
    @Autowired
    private JwtProperties jwtProperties;
    /**
     * 用户登录
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody UserLogin userLogin) {

        Accounts user = accountsService.login(userLogin);

        //登录成功后，生成jwt令牌
        Map<String, Object> claims = new HashMap<>();
        claims.put(JwtClaimsConstant.USER_ID, user.getId());
        String token = JwtUtil.createJWT(
                jwtProperties.getAdminSecretKey(),
                jwtProperties.getAdminTtl(),
                claims);

        UserLoginResult userLoginResult = UserLoginResult.builder()
                .id(user.getId())
                .token(token)
                .build();

        return success(userLoginResult);
    }
    /**
     * 修改账号管理
     */
    @PutMapping
    public AjaxResult edit(@RequestBody UpdateAccounts updateAccounts)
    {
        return accountsService.UserUpdateAccounts(updateAccounts);
    }

    /**
     * 退出
     */
    @PostMapping("/logout")
    public AjaxResult logout() {
        //页面跳转
        return AjaxResult.success(redirect("/#"));
    }
}
