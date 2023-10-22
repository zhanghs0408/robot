package com.example;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan("com.example.dao")
public class SpringbootApplication {

    private static final Logger log = LoggerFactory.getLogger(SpringbootApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(SpringbootApplication.class, args);

        log.info("|******************************************|");
        log.info("|*         原创UP主 * 武哥聊编程             *|");
        log.info("|*         软件定制 * 原创手撸               *|");
        log.info("|*         质量保证 * 值得信赖               *|");
        log.info("|*         联系微信 * nsw694076359          *|");
        log.info("|******************************************|");
    }

}
