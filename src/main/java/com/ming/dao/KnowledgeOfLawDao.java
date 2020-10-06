package com.ming.dao;
import com.ming.pojo.KnowledgeOfLaw;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *@program: train_ssm
 *@description:
 *@author: ming
 *@create: 2020-10-06 16:41
 */
@Repository
public interface KnowledgeOfLawDao {

    /**
     * 查找法律小知识并进行分页
     * @return
     */
    List<KnowledgeOfLaw> findKnowByPage();

    /**
     * 根据id查找小知识
     * @param id
     * @return
     */
    KnowledgeOfLaw findKnowledgeById(int id);

    /**
     * 增加法律小知识
     * @param knowledgeOfLaw
     */
    void add(KnowledgeOfLaw knowledgeOfLaw);

    /**
     * 阅读添加次数
     * @param id
     */
    void addFrequency(int id);
}
