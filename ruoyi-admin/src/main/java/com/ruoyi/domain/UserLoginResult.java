package com.ruoyi.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * ClassName: UserLoginResult
 * Package: com.ruoyi.domain
 * Description:
 *
 * @Author lyj
 * @Create 2024/6/7 11:58
 * @Version 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserLoginResult implements Serializable {

    @ApiModelProperty("主键值")
    private Long id;

    @ApiModelProperty("jwt令牌")
    private String token;

}
