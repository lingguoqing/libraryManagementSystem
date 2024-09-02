package com.ling.librarymanagementsystem.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ling.librarymanagementsystem.model.dto.user.UserAddRequest;
import com.ling.librarymanagementsystem.model.dto.user.UserQueryRequest;
import com.ling.librarymanagementsystem.model.dto.user.UserUpdateRequest;
import com.ling.librarymanagementsystem.model.entity.User;
import com.ling.librarymanagementsystem.model.vo.UserVO;

import java.util.List;

/**
* @author 17102
* @description 针对表【user】的数据库操作Service
* @createDate 2024-08-31 17:36:53
*/
public interface UserService extends IService<User> {

    long register(String username, String password, String checkPassword);

    String userLogin(String username, String password);

    Long add(UserAddRequest userAddRequest);

    Long updateByUserAndId(UserUpdateRequest userUpdateRequest);

    Long editByUserAndId(UserUpdateRequest userUpdateRequest);

    Wrapper<User> getQueryWrapper(UserQueryRequest userQueryRequest);

    List<UserVO> getUserVO(List<User> records);

    /**
     * 获取脱敏的用户信息
     *
     * @param user
     * @return
     */
    UserVO getUserVO(User user);
}
