package com.ling.librarymanagementsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ling.librarymanagementsystem.mapper.UserMapper;
import com.ling.librarymanagementsystem.model.entity.User;
import com.ling.librarymanagementsystem.service.UserService;
import org.springframework.stereotype.Service;

/**
* @author 17102
* @description 针对表【user】的数据库操作Service实现
* @createDate 2024-08-31 17:36:53
*/
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User>
    implements UserService {

}




