package com.ruoyi.common.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "my.jwt")
@Data
public class JwtProperties {
    
    private String adminSecretKey;
    private long adminTtl;
    private String adminTokenName;

}
