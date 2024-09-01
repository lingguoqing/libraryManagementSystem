package com.ling.librarymanagementsystem.utils;


import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.ling.librarymanagementsystem.constant.UserConstant;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Token
 */
@Component
public class TokenUtil {

    @Value("${token.sign_sercret}")
    private String SIGN_SERCRET;

    @Value("${token.expire_time}")
    private Long EXPIRE_TIME;

    /**
     * 生成token
     *
     * @param currentUser 用户信息
     * @return
     */
    public String createToken(String currentUser) {
        String sign = JWT.create()
                .withClaim(UserConstant.USER_INFO, currentUser)
                .withIssuedAt(new Date())
                .withExpiresAt(new Date(System.currentTimeMillis() + EXPIRE_TIME))  // 设置过期时间
                .withSubject("token")
                .sign(Algorithm.HMAC256(SIGN_SERCRET));  // 设置签名
        return sign;
    }

    /**
     * 验证token 是否过期
     *
     * @param token
     * @return
     */
    public boolean isTokenExpired(String token) {
        try {
            DecodedJWT decodedJWT = JWT.require(Algorithm.HMAC256(SIGN_SERCRET)).build().verify(token);
            return decodedJWT.getExpiresAt().after(new Date());
        } catch (JWTVerificationException e) {
            return false;
        }
    }

    /**
     * 获取token中的用户信息
     *
     * @param token
     * @return
     */
    public String verifyToken(String token) {
        try {
            JWTVerifier verifier = JWT.require(Algorithm.HMAC256(SIGN_SERCRET)).build();
            Claim claim = verifier.verify(token).getClaim(UserConstant.USER_INFO);
            return claim.asString();
        } catch (JWTVerificationException e) {
            return null;
        }
    }
}
