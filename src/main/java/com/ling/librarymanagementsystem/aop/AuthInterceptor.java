package com.ling.librarymanagementsystem.aop;

import cn.hutool.json.JSONUtil;
import com.ling.librarymanagementsystem.annotation.AuthCheck;
import com.ling.librarymanagementsystem.common.ResultErrorCode;
import com.ling.librarymanagementsystem.constant.UserConstant;
import com.ling.librarymanagementsystem.exception.BusinessException;
import com.ling.librarymanagementsystem.model.enums.UserRoleEnum;
import com.ling.librarymanagementsystem.model.vo.LoginUserVo;
import com.ling.librarymanagementsystem.utils.TokenUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 权限校验 AOP
 */
@Slf4j
@Aspect
@Component
public class AuthInterceptor {

    @Resource
    private TokenUtil tokenUtil;

    /**
     * 执行拦截
     *
     * @param joinPoint
     * @param authCheck
     * @return
     */
    @Around("@annotation(authCheck)")
    public Object doInterceptor(ProceedingJoinPoint joinPoint, AuthCheck authCheck) throws Throwable {
        String mustRole = authCheck.mustRole();
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();
        // 当前登录用户
        String token = request.getHeader(UserConstant.AUTHORIZATION);
        String verifyToken = tokenUtil.verifyToken(token);
        LoginUserVo loginUserVo = JSONUtil.toBean(verifyToken, LoginUserVo.class);

        UserRoleEnum mustRoleEnum = UserRoleEnum.getEnumByValue(mustRole);

        // 不需要权限，放行
        if (mustRoleEnum == null) {
            return joinPoint.proceed();
        }
        // 必须有该权限才通过
        UserRoleEnum userRoleEnum = UserRoleEnum.getEnumByValue(loginUserVo.getUserRole());
        if (userRoleEnum == null) {
            throw new BusinessException(ResultErrorCode.NO_AUTH_ERROR);
        }
        // 如果被封号，直接拒绝
        if (UserRoleEnum.BAN.equals(userRoleEnum)) {
            throw new BusinessException(ResultErrorCode.NO_AUTH_ERROR);
        }
        // 必须有管理员权限
        if (UserRoleEnum.ADMIN.equals(mustRoleEnum)) {
            // 用户没有管理员权限，拒绝
            if (!UserRoleEnum.ADMIN.equals(userRoleEnum)) {
                throw new BusinessException(ResultErrorCode.NO_AUTH_ERROR);
            }
        }
        // 通过权限校验，放行
        return joinPoint.proceed();
    }
}

