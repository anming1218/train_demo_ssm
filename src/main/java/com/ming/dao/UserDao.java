package com.ming.dao;
import com.ming.pojo.User;

/**
 *@program: train_ssm
 *@description:
 *@author: ming
 *@create: 2020-09-21 21:31
 */
public interface UserDao {

    /**
     * 登录
     * @param user
     * @return
     */
    User login(User user);

    /**
     * 注册
     * @param user
     */
    void registered(User user);
}
