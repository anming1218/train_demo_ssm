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
     * @param username 用户名
     * @param password 密码
     * @param garde 用户级别
     * @return 用户
     */
    User login(User user);

}
