package com.ling.librarymanagementsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ling.librarymanagementsystem.model.entity.User;

/**
* @author 17102
* @description 针对表【user】的数据库操作Service
* @createDate 2024-08-31 17:36:53
*/
public interface UserService extends IService<User> {

    long register(String username, String password, String checkPassword);

    String userLogin(String username, String password);
}
