package com.ling.librarymanagementsystem.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ling.librarymanagementsystem.annotation.AuthCheck;
import com.ling.librarymanagementsystem.common.*;
import com.ling.librarymanagementsystem.constant.UserConstant;
import com.ling.librarymanagementsystem.exception.BusinessException;
import com.ling.librarymanagementsystem.exception.ThrowUtils;
import com.ling.librarymanagementsystem.model.dto.user.*;
import com.ling.librarymanagementsystem.model.entity.User;
import com.ling.librarymanagementsystem.model.vo.LoginUserVo;
import com.ling.librarymanagementsystem.model.vo.UserVO;
import com.ling.librarymanagementsystem.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @PostMapping("/register")
    public BaseResponse<Long> register(@RequestBody UserRegisterRequest userRegisterRequest) {
        if (userRegisterRequest == null) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR);
        }
        String username = userRegisterRequest.getUsername();
        String password = userRegisterRequest.getPassword();
        String checkPassword = userRegisterRequest.getCheckPassword();
        if (StringUtils.isAnyBlank(username, password, checkPassword)) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "参数为空");
        }
        long result = userService.register(username, password, checkPassword);
        return ResultResponse.success(result);
    }

    @PostMapping("/login")
    public BaseResponse login(@RequestBody UserLoginRequest userLoginRequest) {
        if (userLoginRequest == null) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR);
        }
        String username = userLoginRequest.getUsername();
        String password = userLoginRequest.getPassword();
        if (StringUtils.isAnyBlank(username, password)) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "参数为空");
        }
        String token = userService.userLogin(username, password);
        HashMap<String, String> result = new HashMap<>();
        result.put("token", token);
        return ResultResponse.success(result);
    }

    /**
     * 添加用户
     *
     * @param userAddRequest
     * @return
     */
    @PostMapping("/add")
    @AuthCheck(mustRole = UserConstant.ADMIN_ROLE)
    public BaseResponse<Long> add(@RequestBody UserAddRequest userAddRequest) {
        if (userAddRequest == null) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR);
        }
        Long count = userService.add(userAddRequest);
        return ResultResponse.success(count);
    }

    /**
     * 编辑用户
     *
     * @param userUpdateRequest
     * @return
     */
    @PostMapping("/edit")
    @AuthCheck(mustRole = UserConstant.ADMIN_ROLE)
    public BaseResponse edit(@RequestBody UserUpdateRequest userUpdateRequest) {
        if (userUpdateRequest == null) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR);
        }
        Long count = userService.editByUserAndId(userUpdateRequest);
        return ResultResponse.success(count);
    }

    /**
     * 删除用户
     *
     * @param deleteRequest
     * @return
     */
    @PostMapping("/delete")
    @AuthCheck(mustRole = UserConstant.ADMIN_ROLE)
    public BaseResponse<Boolean> delete(@RequestBody DeleteRequest deleteRequest) {
        if (deleteRequest == null) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR);
        }
        boolean remove = userService.removeById(deleteRequest.getId());
        if (!remove) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "删除失败");
        }
        return ResultResponse.success(remove);
    }

    /**
     * 更新用户
     *
     * @param userUpdateRequest
     * @return
     */
    @PostMapping("/update/my")
    @AuthCheck(mustRole = UserConstant.ADMIN_ROLE)
    public BaseResponse<Long> update(@RequestBody UserUpdateRequest userUpdateRequest) {
        if (userUpdateRequest == null) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR);
        }
        Long count = userService.updateByUserAndId(userUpdateRequest);
        return ResultResponse.success(count);
    }

    @PostMapping("/list/page")
    public BaseResponse<Page<User>> list(@RequestBody UserQueryRequest userQueryRequest) {
        long current = userQueryRequest.getCurrent();
        long size = userQueryRequest.getPageSize();
        Page<User> userPage = userService.page(new Page<>(current, size),
                userService.getQueryWrapper(userQueryRequest));
        return ResultResponse.success(userPage);
    }


    /**
     * 分页获取用户封装列表
     *
     * @param userQueryRequest
     * @param request
     * @return
     */
    @PostMapping("/list/page/vo")
    public BaseResponse<Page<UserVO>> listUserVOByPage(@RequestBody UserQueryRequest userQueryRequest,
                                                       HttpServletRequest request) {
        if (userQueryRequest == null) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR);
        }
        long current = userQueryRequest.getCurrent();
        long size = userQueryRequest.getPageSize();
        // 限制爬虫
        ThrowUtils.throwIf(size > 20, ResultErrorCode.PARAMS_ERROR);
        Page<User> userPage = userService.page(new Page<>(current, size),
                userService.getQueryWrapper(userQueryRequest));
        Page<UserVO> userVOPage = new Page<>(current, size, userPage.getTotal());
        List<UserVO> userVO = userService.getUserVO(userPage.getRecords());
        userVOPage.setRecords(userVO);
        return ResultResponse.success(userVOPage);
    }

    /**
     * 获取当前登录用户信息
     *
     * @return
     */
    @GetMapping("/get")
    public BaseResponse<LoginUserVo> getUser() {
        LoginUserVo threadLocal = BaseContext.getThreadLocal();
        return ResultResponse.success(threadLocal);
    }

}
