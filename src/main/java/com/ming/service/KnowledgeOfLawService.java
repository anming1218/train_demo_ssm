package com.ming.service;
import com.ming.pojo.KnowledgeOfLaw;

import java.util.List;

/**
 *@program: train_ssm
 *@description:
 *@author: ming
 *@create: 2020-10-06 16:40
 */
public interface KnowledgeOfLawService {

    /**
     * 查找法律小知识并进行分页
     * @param page
     * @param size
     * @return
     */
    List<KnowledgeOfLaw> findKnowByPage(int page, int size);

    /**
     * 根据id查找小知识
     * @param id
     * @return
     */
    KnowledgeOfLaw findKnowledgeById(String id);

    /**
     * 增加法律小知识
     * @param knowledgeOfLaw
     */
    void add(KnowledgeOfLaw knowledgeOfLaw);

    /**
     * 阅读添加次数
     * @param id
     */
    void addFrequency(String id);
}
