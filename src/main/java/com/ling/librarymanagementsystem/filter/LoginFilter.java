package com.ling.librarymanagementsystem.filter;

import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.ling.librarymanagementsystem.common.ResultErrorCode;
import com.ling.librarymanagementsystem.constant.UserConstant;
import com.ling.librarymanagementsystem.exception.BusinessException;
import com.ling.librarymanagementsystem.model.entity.User;
import com.ling.librarymanagementsystem.model.vo.LoginUserVo;
import com.ling.librarymanagementsystem.service.UserService;
import com.ling.librarymanagementsystem.utils.TokenUtil;
import org.springframework.boot.autoconfigure.jersey.JerseyProperties;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter
public class LoginFilter implements Filter {

    @Resource
    private UserService userService;

    @Resource
    private TokenUtil tokenUtil;

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // 从请求头中获取token信息

        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;

        String url = httpServletRequest.getRequestURI();
        // 如果是登录接口，则直接放行
        if (url.contains("login")) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        String token = httpServletRequest.getHeader(UserConstant.AUTHORIZATION);

        // 验证token是否存在
        if (StrUtil.isBlank(token)) {
            throw new BusinessException(ResultErrorCode.OPERATION_ERROR, "不存在token");
        }

        // 验证token是否过期
        boolean tokenExpired = tokenUtil.isTokenExpired(token);
        if (!tokenExpired) {
            throw new BusinessException(ResultErrorCode.OPERATION_ERROR, "token已过期");
        }

        // 验证token是否合法
        String verifyToken = tokenUtil.verifyToken(token);
        if (StrUtil.isBlank(verifyToken)) {
            throw new BusinessException(ResultErrorCode.OPERATION_ERROR, "token验证失败,请重新登录");
        }

        // 从token得到用户信息，并判断用户是否存在，避免后台修改用户信息后，不一致
        LoginUserVo loginUserVo = JSONUtil.toBean(verifyToken, LoginUserVo.class);
        User user = userService.getById(loginUserVo.getId());
        if (user == null) {
            throw new BusinessException(ResultErrorCode.OPERATION_ERROR, "用户不存在,请重新登录");
        }

        doFilter(httpServletRequest, servletResponse, filterChain);

    }
}
