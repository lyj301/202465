package com.ruoyi.domain;

import lombok.Data;

/**
 * ClassName: UpdateAccounts
 * Package: com.ruoyi.domain
 * Description:
 *
 * @Author lyj
 * @Create 2024/6/7 12:36
 * @Version 1.0
 */
@Data
public class UpdateAccounts {
    private Long id;

    private String oldUsername;

    private String newPassword1;

    private String newPassword2;
}
