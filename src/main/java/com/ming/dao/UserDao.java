package com.ming.dao;
import com.ming.pojo.User;

/**
 *@program: train_ssm
 *@description:
 *@author: ming
 *@create: 2020-09-21 21:31
 */
public interface UserDao {

    User login(User user);
}
