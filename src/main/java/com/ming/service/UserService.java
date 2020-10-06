package com.ming.service;
import com.ming.pojo.User;

/**
 *@program: train_ssm
 *@description:
 *@author: ming
 *@create: 2020-09-21 21:32
 */
public interface UserService {

    /**
     * 用户登录
     * @param user
     */
    User login(User user);

    /**
     * 注册
     * @param user
     */
    void registered(User user);
}
