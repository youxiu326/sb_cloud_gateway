package com.youxiu326;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.youxiu326.dao")
public class SbCloudGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(SbCloudGatewayApplication.class, args);
    }

}
