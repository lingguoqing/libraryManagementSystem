package com.ling.librarymanagementsystem.filter;

import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.ling.librarymanagementsystem.common.BaseContext;
import com.ling.librarymanagementsystem.common.BaseResponse;
import com.ling.librarymanagementsystem.common.ResultErrorCode;
import com.ling.librarymanagementsystem.constant.UserConstant;
import com.ling.librarymanagementsystem.model.entity.User;
import com.ling.librarymanagementsystem.model.vo.LoginUserVo;
import com.ling.librarymanagementsystem.service.UserService;
import com.ling.librarymanagementsystem.utils.TokenUtil;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
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


        if (isSwaggerRequest(httpServletRequest)) {
            // 如果是，则跳过身份验证
//            doFilter(httpServletRequest, httpServletResponse, filterChain);
            filterChain.doFilter(httpServletRequest, httpServletResponse);
            return;
        }
        // 如果是登录/注册接口，则直接放行
        if (url.contains("login") || url.contains("register")) {
            filterChain.doFilter(httpServletRequest, httpServletResponse);
            return;
        }
        log.info(url);

        String token = httpServletRequest.getHeader(UserConstant.AUTHORIZATION);
        BaseResponse baseResponse = null;
        // 验证token是否存在
        if (StrUtil.isBlank(token)) {
            baseResponse = new BaseResponse(ResultErrorCode.OPERATION_ERROR, "不存在token，请登录");
            sendErrorResponse(httpServletResponse, baseResponse);
            return;
        }

        // 验证token是否过期
        boolean tokenExpired = tokenUtil.isTokenExpired(token);
        if (!tokenExpired) {
            baseResponse = new BaseResponse(ResultErrorCode.OPERATION_ERROR, "token已过期");
            sendErrorResponse(httpServletResponse, baseResponse);
            return;
        }

        // 验证token是否合法
        String verifyToken = tokenUtil.verifyToken(token);
        if (StrUtil.isBlank(verifyToken)) {
            baseResponse = new BaseResponse(ResultErrorCode.OPERATION_ERROR, "token验证失败,请重新登录");
            sendErrorResponse(httpServletResponse, baseResponse);
            return;
        }

        // 从token得到用户信息，并判断用户是否存在，避免后台修改用户信息后，不一致
        LoginUserVo loginUserVo = JSONUtil.toBean(verifyToken, LoginUserVo.class);
        User user = userService.getById(loginUserVo.getId());
        if (user == null) {
            baseResponse = new BaseResponse(ResultErrorCode.OPERATION_ERROR, "用户不存在,请重新登录");
            sendErrorResponse(httpServletResponse, baseResponse);
            return;
        }
        BaseContext.setThreadLocal(loginUserVo);
        filterChain.doFilter(httpServletRequest, httpServletResponse);
    }

    @Override
    public void destroy() {
        BaseContext.clearThreadLocal();
    }

    /**
     * 判断是否是swagger请求
     *
     * @param request
     * @return
     */
    private boolean isSwaggerRequest(HttpServletRequest request) {
        String path = request.getRequestURI();
        return path.startsWith("/swagger")
                || path.startsWith("/v2/api-docs")
                || path.startsWith("/webjars")
                || path.equals("/doc.html")
                || path.startsWith("/swagger-resources");
    }

    /**
     * 发送错误响应
     *
     * @param response
     * @param baseResponse
     * @throws IOException
     */
    private void sendErrorResponse(HttpServletResponse response, BaseResponse baseResponse) throws IOException {
        // 将错误信息转换为JSON格式
        String json = JSONUtil.toJsonStr(baseResponse);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }

}
