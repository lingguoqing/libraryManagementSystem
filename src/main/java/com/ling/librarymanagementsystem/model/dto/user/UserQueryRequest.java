package com.ling.librarymanagementsystem.model.dto.user;

import com.baomidou.mybatisplus.annotation.TableField;
import com.ling.librarymanagementsystem.common.PageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * 用户查询请求
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class UserQueryRequest extends PageRequest implements Serializable {

    private Long id;

    /**
     * 用户名
     */
    private String username;


    /**
     * 手机号
     */
    private String userPhone;

    /**
     * 地址
     */
    private String userAddress;

    /**
     * 用户权限
     */
    private String userRole;


    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}