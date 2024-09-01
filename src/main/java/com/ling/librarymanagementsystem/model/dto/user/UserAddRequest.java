package com.ling.librarymanagementsystem.model.dto.user;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.io.Serializable;

/**
 * 用户注册请求体
 */
@Data
public class UserAddRequest implements Serializable {

    /**
     * 用户名
     */
    private String username;


    /**
     * 头像
     */
    private String userAvatar;

    /**
     * 手机号
     */
    private String userPhone;

    /**
     * 地址
     */
    private String userAddress;

    /**
     * 性别（0：女；1：男）
     */
    private Integer userSex;

    /**
     * 邮箱
     */
    private String userEmail;

    /**
     * 用户简介
     */
    private String userProfile;

    /**
     * 用户权限
     */
    private String userRole;


    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

}
