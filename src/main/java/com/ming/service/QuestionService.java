package com.ming.service;
import com.ming.pojo.Question;

import java.util.List;

/**
 *@program: train_ssm
 *@description:
 *@author: ming
 *@create: 2020-09-23 22:04
 */
public interface QuestionService {

    /**
     * 援助新增
     * @param question
     */
    void add(Question question);

    /**
     * 查询自己的法律援助
     * @param id
     * @param page
     * @param size
     * @return
     */
    List<Question> findMyQuestion(String id,Integer page,Integer size);

    /**
     * 管理员查询并处理所有的援助
     * @param page
     * @param size
     * @return
     */
    List<Question> findAll(Integer page,Integer size);

    /**
     * 律师查询自己还未处理的请求
     * @param id
     * @param page
     * @param size
     * @return
     */
    List<Question> findAnswerQuestion(String id, int page, int size);

    /**
     * 拒绝单个请求
     * @param id
     */
    void refuseApply(String id);

    /**
     * 同意单个请求
     * @param id
     */
    void passApply(String id);

    /**
     * 拒绝选中的请求
     * @param ids
     */
    void refuseSelectApply(String[] ids);

    /**
     * 同意选中的请求
     * @param ids
     */
    void passSelectApply(String[] ids);

    /**
     * 阅读援助信息详情
     * @param id
     * @return
     */
    Question findContent(String id);

    /**
     * 律师回答问题
     * @param question
     */
    void answerQuestion(Question question);
}
