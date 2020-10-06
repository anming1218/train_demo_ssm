package com.ming.service.impl;
import com.github.pagehelper.PageHelper;
import com.ming.dao.KnowledgeOfLawDao;
import com.ming.pojo.KnowledgeOfLaw;
import com.ming.service.KnowledgeOfLawService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *@program: train_ssm
 *@description:
 *@author: ming
 *@create: 2020-10-06 16:40
 */
@Service
public class KnowledgeOfLawServiceImpl implements KnowledgeOfLawService {

    @Autowired
    private KnowledgeOfLawDao knowledgeOfLawDao;

    /**
     * 查找法律小知识并进行分页
     * @param page
     * @param size
     * @return
     */
    @Override
    public List<KnowledgeOfLaw> findKnowByPage(int page, int size) {
        PageHelper.startPage(page, size);
        return knowledgeOfLawDao.findKnowByPage();
    }

    /**
     * 根据id查找小知识
     * @param id
     * @return
     */
    @Override
    public KnowledgeOfLaw findKnowledgeById(String id) {
        return knowledgeOfLawDao.findKnowledgeById(Integer.parseInt(id));
    }

    /**
     * 增加法律小知识
     * @param knowledgeOfLaw
     */
    @Override
    public void add(KnowledgeOfLaw knowledgeOfLaw) {
        knowledgeOfLawDao.add(knowledgeOfLaw);
    }

    /**
     * 阅读添加次数
     * @param id
     */
    @Override
    public void addFrequency(String id) {
        knowledgeOfLawDao.addFrequency(Integer.parseInt(id));
    }
}
