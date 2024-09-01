package com.ling.librarymanagementsystem.model.dto.user;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * 编辑用户
 */
@Data
public class UserEditRequest implements Serializable {

    /**
     *
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

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


    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
