package com.ming.service.impl;
import com.github.pagehelper.PageHelper;
import com.ming.dao.QuestionDao;
import com.ming.pojo.Question;
import com.ming.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
     * 同意单个请求并将其分配给某个律师
     * @param id
     */
    @Override
    public void passApply(String id) {
        questionDao.passApply(Integer.parseInt(id));
        List<Integer> lawyerIds = questionDao.selectLawyer();

        Random random = new Random();
        int index = random.nextInt(lawyerIds.size());

        Map<String, Integer> map = new HashMap<>();
        map.put("questionId", Integer.parseInt(id));
        map.put("lawyerId", lawyerIds.get(index));

        questionDao.distributionToLaw(map);
    }

    /**
     * 拒绝选中的请求
     * @param ids
     */
    @Override
    public void refuseSelectApply(String[] ids) {
        if (ids != null && ids.length != 0) {
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
        if (ids != null && ids.length != 0) {
            for (String id : ids) {
                questionDao.passApply(Integer.parseInt(id));
                List<Integer> lawyerIds = questionDao.selectLawyer();

                Random random = new Random();
                int index = random.nextInt(lawyerIds.size());

                Map<String, Integer> map = new HashMap<>();
                map.put("questionId", Integer.parseInt(id));
                map.put("lawyerId", lawyerIds.get(index));

                questionDao.distributionToLaw(map);
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

    /**
     * 查询所有法律援助信息
     * @param page
     * @param size
     * @return
     */
    @Override
    public List<Question> findAllQuestion(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return questionDao.findAllQuestion();
    }

    /**
     * 查询审核中的法律援助
     * @param page
     * @param size
     * @param statu
     * @return
     */
    @Override
    public List<Question> findKindsQuestion(int page, int size, String statu) {
        PageHelper.startPage(page, size);
        return questionDao.findKindsQuestion(Integer.parseInt(statu));
    }

    /**
     * 模糊查询需要的法律援助
     * @param page
     * @param size
     * @param type
     * @param statu
     * @param pname
     * @return
     */
    @Override
    public List<Question> selectLikeQuestion(int page, int size, String type, String statu, String pname) {
        Question likeQuestion = new Question();
        if (!"-1".equals(type)) {
            likeQuestion.setType(type);
        }

        if (!"-1".equals(statu)) {
            likeQuestion.setStatu(Integer.parseInt(statu));
        }
        likeQuestion.setPname(pname);

        PageHelper.startPage(page, size);

        return questionDao.selectLikeQuestion(likeQuestion);
    }

    /**
     * 查找处于不同状态的记录条数
     * @return
     */
    @Override
    public Map<String, Integer> findAmount() {
        Map<String, Integer> map = new HashMap<>(16);
        map.put("allAmount", questionDao.findAmountAll());
        map.put("processed", questionDao.findAmountProcessed());
        return map;
    }

    /**
     * 增加新闻阅读次数
     * @param id
     */
    @Override
    public void addFrequency(String id) {
        questionDao.addFrequency(Integer.parseInt(id));
    }
}
