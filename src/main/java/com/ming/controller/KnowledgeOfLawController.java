package com.ming.controller;
import com.github.pagehelper.PageInfo;
import com.ming.pojo.KnowledgeOfLaw;
import com.ming.service.KnowledgeOfLawService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 *@program: train_ssm
 *@description:
 *@author: ming
 *@create: 2020-10-06 16:39
 */
@Controller
@RequestMapping("/knowledge")
public class KnowledgeOfLawController {

    @Autowired
    private KnowledgeOfLawService knowledgeOfLawService;

    /**
     * 查找法律小知识并进行分页
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("findKnow")
    public ModelAndView findKnowByPage(@RequestParam(name = "pages", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "8") int size) {
        ModelAndView mv = new ModelAndView();
        List<KnowledgeOfLaw> list = knowledgeOfLawService.findKnowByPage(page, size);

        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("pb", pageInfo);
        mv.setViewName("/knowledgeOfLaw");

        return mv;
    }

    /**
     * 根据id查找小知识
     * @param id
     * @return
     */
    @RequestMapping("findKnowledgeById/{id}")
    public ModelAndView findKnowledgeById(@PathVariable("id") String id) {
        ModelAndView mv = new ModelAndView();
        KnowledgeOfLaw knowledgeOfLaw = knowledgeOfLawService.findKnowledgeById(id);
        knowledgeOfLawService.addFrequency(id);

        mv.addObject("knowledgeOfLaw", knowledgeOfLaw);
        mv.setViewName("/knowledge_read");

        return mv;
    }

    /**
     * 增加法律小知识
     * @param topic
     * @param title
     * @param summary
     * @param comment
     * @return
     */
    @RequestMapping("add")
    public String add(@RequestParam("topic") String topic, @RequestParam("title") String title, @RequestParam("summary") String summary, @RequestParam("comment") String comment) {
        KnowledgeOfLaw knowledgeOfLaw = new KnowledgeOfLaw();
        knowledgeOfLaw.setTopic(topic);
        knowledgeOfLaw.setTitle(title);
        knowledgeOfLaw.setSummary(summary);
        knowledgeOfLaw.setComment(comment);

        knowledgeOfLawService.add(knowledgeOfLaw);

        return "/manager_knowledge_add";
    }

}
