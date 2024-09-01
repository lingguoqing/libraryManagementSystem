package com.ling.librarymanagementsystem.utils;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Base64;

import javax.annotation.Resource;

@SpringBootTest
class TokenUtilTest {

    @Resource
    private TokenUtil tokenUtil;

    @Test
    void generateToken() {
        String encodedString = "Dp2EiPugQpXJ+3TYxHQqWw==";
        byte[] decodedBytes = Base64.getDecoder().decode(encodedString);
        String decodedString = new String(decodedBytes);
        System.out.println(decodedString);
    }

}