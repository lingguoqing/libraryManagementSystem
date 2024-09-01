package com.ling.librarymanagementsystem.service.impl;

import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ling.librarymanagementsystem.common.ResultErrorCode;
import com.ling.librarymanagementsystem.exception.BusinessException;
import com.ling.librarymanagementsystem.mapper.UserMapper;
import com.ling.librarymanagementsystem.model.entity.User;
import com.ling.librarymanagementsystem.model.vo.LoginUserVo;
import com.ling.librarymanagementsystem.service.UserService;
import com.ling.librarymanagementsystem.utils.PasswordEncryption;
import com.ling.librarymanagementsystem.utils.TokenUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

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
}




