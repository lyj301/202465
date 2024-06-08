package com.ruoyi.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * ClassName: UserLogin
 * Package: com.ruoyi.domain
 * Description:
 *
 * @Author lyj
 * @Create 2024/6/7 11:55
 * @Version 1.0
 */
@Data
public class UserLogin implements Serializable {

    private String username;

    private String password;

}
