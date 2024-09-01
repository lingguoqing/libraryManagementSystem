package com.ling.librarymanagementsystem.controller;


import com.ling.librarymanagementsystem.annotation.AuthCheck;
import com.ling.librarymanagementsystem.common.BaseResponse;
import com.ling.librarymanagementsystem.common.DeleteRequest;
import com.ling.librarymanagementsystem.common.ResultErrorCode;
import com.ling.librarymanagementsystem.common.ResultResponse;
import com.ling.librarymanagementsystem.constant.UserConstant;
import com.ling.librarymanagementsystem.exception.BusinessException;
import com.ling.librarymanagementsystem.model.dto.user.UserAddRequest;
import com.ling.librarymanagementsystem.model.dto.user.UserLoginRequest;
import com.ling.librarymanagementsystem.model.dto.user.UserRegisterRequest;
import com.ling.librarymanagementsystem.model.dto.user.UserUpdateRequest;
import com.ling.librarymanagementsystem.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;

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
    public BaseResponse add(@RequestBody UserAddRequest userAddRequest) {
        if (userAddRequest == null) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR);
        }
        return null;
    }

    /**
     * 更新用户
     *
     * @param userUpdateRequest
     * @return
     */
    @PostMapping("/update")
    public BaseResponse update(@RequestBody UserUpdateRequest userUpdateRequest) {
        if (userUpdateRequest == null) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR);
        }
        return null;
    }

    /**
     * 编辑用户
     *
     * @param userUpdateRequest
     * @return
     */
    @PostMapping("/edit")
    public BaseResponse edit(@RequestBody UserUpdateRequest userUpdateRequest) {
        if (userUpdateRequest == null) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR);
        }
        return null;
    }

    /**
     * 删除用户
     *
     * @param deleteRequest
     * @return
     */
    @PostMapping("/delete")
    public BaseResponse delete(@RequestBody DeleteRequest deleteRequest) {
        if (deleteRequest == null) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR);
        }
        return null;
    }

}
