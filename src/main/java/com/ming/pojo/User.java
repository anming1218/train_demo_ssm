package com.ming.pojo;
import com.ming.util.DateUtils;

import java.util.Date;

/**
 *@program: train_ssm
 *@description:
 *@author: ming
 *@create: 2020-09-21 21:20
 */
public class User {
    /**
     * 主键id
     */
    private String id;
    /**
     * 用户名
     */
    private String username;
    /**
     * 密码
     */
    private String password;
    /**
     * 性别
     */
    private char sex;
    /**
     * 生日
     */
    private Date birthday;
    private String birthdayStr;
    /**
     * 身份 0：用户 1：律师 2：管理员
     */
    private int grade;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public char getSex() {
        return sex;
    }

    public void setSex(char sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getBirthdayStr() {
        if (birthday != null) {
            birthdayStr = DateUtils.dateToString(birthday, "yyyy-MM-dd");
        }
        return birthdayStr;
    }

    public void setBirthdayStr(String birthdayStr) {
        this.birthdayStr = birthdayStr;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", sex=" + sex +
                ", birthday=" + birthday +
                ", birthdayStr='" + birthdayStr + '\'' +
                ", grade=" + grade +
                '}';
    }
}
