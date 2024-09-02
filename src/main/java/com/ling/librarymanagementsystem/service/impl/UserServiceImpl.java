package com.ling.librarymanagementsystem.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ling.librarymanagementsystem.annotation.AuthCheck;
import com.ling.librarymanagementsystem.common.ResultErrorCode;
import com.ling.librarymanagementsystem.constant.CommonConstant;
import com.ling.librarymanagementsystem.constant.UserConstant;
import com.ling.librarymanagementsystem.exception.BusinessException;
import com.ling.librarymanagementsystem.mapper.UserMapper;
import com.ling.librarymanagementsystem.model.dto.user.UserAddRequest;
import com.ling.librarymanagementsystem.model.dto.user.UserQueryRequest;
import com.ling.librarymanagementsystem.model.dto.user.UserUpdateRequest;
import com.ling.librarymanagementsystem.model.entity.User;
import com.ling.librarymanagementsystem.model.vo.LoginUserVo;
import com.ling.librarymanagementsystem.model.vo.UserVO;
import com.ling.librarymanagementsystem.service.UserService;
import com.ling.librarymanagementsystem.utils.PasswordEncryption;
import com.ling.librarymanagementsystem.utils.SqlUtils;
import com.ling.librarymanagementsystem.utils.TokenUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author 17102
 * @description 针对表【user】的数据库操作Service实现
 * @createDate 2024-08-31 17:36:53
 */
@Slf4j
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Resource
    private TokenUtil tokenUtil;

    @Override
    public long register(String username, String password, String checkPassword) {
        // 1. 校验
        if (StringUtils.isAnyBlank(username, password, checkPassword)) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "参数为空");
        }
        if (username.length() < 4) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "用户账号过短");
        }
        if (password.length() < 8 || checkPassword.length() < 8) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "用户密码过短");
        }
        // 密码和校验密码相同
        if (!password.equals(checkPassword)) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "两次输入的密码不一致");
        }
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username);
        Long count = this.baseMapper.selectCount(wrapper);
        if (count > 0) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "账号重复");
        }
        String encryptPassword;
        try {
            encryptPassword = PasswordEncryption.encrypt(username + password, PasswordEncryption.generateKey());
        } catch (Exception e) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "密码加密失败");
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(encryptPassword);
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        user.setEditTime(new Date());
        user.setUserRole("user");
        boolean save = this.save(user);
        if (!save) {
            throw new BusinessException(ResultErrorCode.SYSTEM_ERROR, "注册失败，数据库错误");
        }
        return user.getId();
    }

    @Override
    public String userLogin(String username, String password) {
        // 1. 校验
        if (StringUtils.isAnyBlank(username, password)) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "参数为空");
        }
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username);
        User user = this.baseMapper.selectOne(wrapper);
        if (user == null) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "用户名不存在");
        }
        // 2. 加密
        String encryptPassword = null;
        try {
            encryptPassword = PasswordEncryption.encrypt(password, PasswordEncryption.generateKey());
        } catch (Exception e) {
            throw new BusinessException(ResultErrorCode.SYSTEM_ERROR, "密码加密失败");
        }
        // 3. 查询
        if (user.getPassword().equals(encryptPassword)) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "密码错误");
        }
        // 4. 返回
        LoginUserVo loginUserVo = new LoginUserVo();
        BeanUtils.copyProperties(user, loginUserVo);
        String jsonLoginUser = JSONUtil.toJsonStr(loginUserVo);
        return tokenUtil.generateToken(jsonLoginUser);
    }

    /**
     * 添加用户
     *
     * @param userAddRequest
     * @return
     */
    @Override
    public Long add(UserAddRequest userAddRequest) {
        log.info("添加用户操作");
        String username = userAddRequest.getUsername();
        if (StringUtils.isEmpty(username)) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "用户名不能为空");
        }
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username);
        Long count = this.baseMapper.selectCount(wrapper);
        if (count > 0) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "用户名已存在");
        }
        User user = new User();
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        user.setEditTime(new Date());
        BeanUtils.copyProperties(userAddRequest, user);
        if (StrUtil.isBlank(userAddRequest.getUserRole())) {
            user.setUserRole("user");
        }
        try {
            user.setPassword(PasswordEncryption.encrypt("12345678", PasswordEncryption.generateKey()));
        } catch (Exception e) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "密码加密失败");
        }
        log.info(user.toString());
        this.baseMapper.insert(user);
        return user.getId();
    }

    /**
     * 更新用户信息
     *
     * @param userUpdateRequest
     * @return
     */
    @Override
    @AuthCheck(mustRole = UserConstant.ADMIN_ROLE)
    public Long updateByUserAndId(UserUpdateRequest userUpdateRequest) {
        if (userUpdateRequest == null || StringUtils.isEmpty(userUpdateRequest.getUsername())) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "用户名不能为空");
        }
        User user = new User();
        BeanUtils.copyProperties(userUpdateRequest, user);
        int i = this.baseMapper.updateById(user);
        if (i == 0) {
            throw new BusinessException(ResultErrorCode.OPERATION_ERROR, "更新失败");
        }
        return user.getId();
    }

    /**
     * 管理员可以更新所有用户信息
     *
     * @param userUpdateRequest
     * @return
     */
    @Override
    public Long editByUserAndId(UserUpdateRequest userUpdateRequest) {
        if (userUpdateRequest == null || StringUtils.isEmpty(userUpdateRequest.getUsername())) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "用户名不能为空");
        }
        User user = new User();
        user.setUpdateTime(new Date());
        user.setEditTime(new Date());
        BeanUtils.copyProperties(userUpdateRequest, user);
        this.baseMapper.updateById(user);
        return user.getId();
    }

    @Override
    public Wrapper<User> getQueryWrapper(UserQueryRequest userQueryRequest) {
        if (userQueryRequest == null) {
            throw new BusinessException(ResultErrorCode.PARAMS_ERROR, "请求参数为空");
        }
        Long id = userQueryRequest.getId();
        String username = userQueryRequest.getUsername();
        String userPhone = userQueryRequest.getUserPhone();
        String userAddress = userQueryRequest.getUserAddress();
        String userRole = userQueryRequest.getUserRole();
        String sortField = userQueryRequest.getSortField();
        String sortOrder = userQueryRequest.getSortOrder();

        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(id != null, "id", id);
        queryWrapper.like(StringUtils.isNotBlank(username), "username", username);
        queryWrapper.like(StringUtils.isNotBlank(userPhone), "user_phone", userPhone);
        queryWrapper.like(StringUtils.isNotBlank(userAddress), "user_address", userAddress);
        queryWrapper.like(StringUtils.isNotBlank(userRole), "user_role", userRole);

        queryWrapper.orderBy(SqlUtils.validSortField(sortField), sortOrder.equals(CommonConstant.SORT_ORDER_ASC),
                sortField);
        return queryWrapper;
    }

    @Override
    public List<UserVO> getUserVO(List<User> userList) {
        if (CollUtil.isEmpty(userList)) {
            return new ArrayList<>();
        }
        return userList.stream().map(this::getUserVO).collect(Collectors.toList());
    }

    @Override
    public UserVO getUserVO(User user) {
        if (user == null) {
            return null;
        }
        UserVO userVO = new UserVO();
        BeanUtils.copyProperties(user, userVO);
        return userVO;
    }
}




