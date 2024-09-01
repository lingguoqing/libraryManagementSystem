package com.ling.librarymanagementsystem.utils;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
class TokenUtilTest {

    @Resource
    private TokenUtil tokenUtil;

    @Test
    void generateToken() {
        String token = tokenUtil.createToken("username:ling");
        System.out.println(token);
        System.out.println(tokenUtil.verifyToken(token));
    }

}