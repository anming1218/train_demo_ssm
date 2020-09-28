package com.ming.dao;
import com.ming.pojo.Question;

import java.util.List;

/**
 *@program: train_ssm
 *@description:
 *@author: ming
 *@create: 2020-09-23 22:05
 */
public interface QuestionDao {

    /**
     * 添加援助
     * @param question
     */
    void add(Question question);

    /**
     * 查询自己的法律援助
     * @param id
     * @return
     */
    List<Question> findById(Integer id);

    /**
     * 管理员查询并处理所有的援助
     * @return
     */
    List<Question> findAll();

    /**
     * 律师查询自己还未处理的请求
     * @param id
     * @return
     */
    List<Question> findAnswerQuestion(Integer id);

    /**
     * 拒绝单个请求
     * @param id
     */
    void refuseApply(int id);

    /**
     * 同意单个请求
     * @param id
     */
    void passApply(int id);

    /**
     * 阅读援助信息详情
     * @param id
     * @return
     */
    Question findContent(int id);

    /**
     * 律师回答问题
     * @param question
     */
    void answerQuestion(Question question);
}
