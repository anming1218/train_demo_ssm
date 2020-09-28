package com.ming.service.impl;
import com.github.pagehelper.PageHelper;
import com.ming.dao.QuestionDao;
import com.ming.pojo.Question;
import com.ming.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *@program: train_ssm
 *@description:
 *@author: ming
 *@create: 2020-09-23 22:05
 */
@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionDao questionDao;

    /**
     * 援助新增
     * @param question
     */
    @Override
    public void add(Question question) {
        questionDao.add(question);
    }

    /**
     * 查询自己的法律援助
     * @param id
     * @return
     */
    @Override
    public List<Question> findMyQuestion(String id, Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return questionDao.findById(Integer.parseInt(id));
    }

    /**
     * 管理员查询并处理所有的援助
     * @param page
     * @param size
     * @return
     */
    @Override
    public List<Question> findAll(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return questionDao.findAll();
    }

    /**
     * 律师查询自己还未处理的请求
     * @param id
     * @param page
     * @param size
     * @return
     */
    @Override
    public List<Question> findAnswerQuestion(String id, int page, int size) {
        PageHelper.startPage(page, size);
        return questionDao.findAnswerQuestion(Integer.parseInt(id));
    }

    /**
     * 拒绝单个请求
     * @param id
     */
    @Override
    public void refuseApply(String id) {
        questionDao.refuseApply(Integer.parseInt(id));
    }

    /**
     * 同意单个请求
     * @param id
     */
    @Override
    public void passApply(String id) {
        questionDao.passApply(Integer.parseInt(id));
    }

    /**
     * 拒绝选中的请求
     * @param ids
     */
    @Override
    public void refuseSelectApply(String[] ids) {
        if (ids!=null&&ids.length!=0){
            for (String id : ids) {
                questionDao.refuseApply(Integer.parseInt(id));
            }
        }

    }

    /**
     * 同意选中的请求
     * @param ids
     */
    @Override
    public void passSelectApply(String[] ids) {
        if (ids!=null&&ids.length!=0){
            for (String id : ids) {
                questionDao.passApply(Integer.parseInt(id));
            }
        }
    }

    /**
     * 阅读援助信息详情
     * @param id
     * @return
     */
    @Override
    public Question findContent(String id) {
        return questionDao.findContent(Integer.parseInt(id));
    }

    /**
     * 律师回答问题
     * @param question
     */
    @Override
    public void answerQuestion(Question question) {
        questionDao.answerQuestion(question);

    }
}
