package com.ming.controller;
import com.github.pagehelper.PageInfo;
import com.ming.pojo.Question;
import com.ming.pojo.User;
import com.ming.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 *@program: train_ssm
 *@description: 问题控制类
 *@author: ming
 *@create: 2020-09-23 21:47
 */
@Controller
@RequestMapping("/question")
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @RequestMapping("/add")
    public String add(HttpServletRequest request) {

        //#{type},#{pname},#{details},#{unmae},#{telnumber},#{statu},#{creatby}
        String type = request.getParameter("type");
        String pname = request.getParameter("pname");
        String details = request.getParameter("details");
        String uname = request.getParameter("uname");
        String telnumber = request.getParameter("telnumber");
        String creatby = request.getParameter("creatby");
        Question question = new Question();

        question.setType(type);
        question.setPname(pname);
        question.setDetails(details);
        question.setUname(uname);
        question.setTelnumber(telnumber);
        question.setStatu(0);
        question.setCreatby(Integer.parseInt(creatby));

        questionService.add(question);

        return "forward:/question/myQuestion";
    }

    /**
     * 查询自己的法律援助
     * @param request
     * @return
     */
    @RequestMapping(value = "/myQuestion", method = RequestMethod.GET)
    public ModelAndView findMyQuestion(@RequestParam(name = "pages", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "8") int size, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        List<Question> questions = questionService.findMyQuestion(loginUser.getId(), page, size);
        //PageInfo就是一个分页bean
        PageInfo pageInfo = new PageInfo(questions);


        mv.addObject("pb", pageInfo);

        mv.setViewName("/userapply_list");

        return mv;
    }

    /**
     * 管理员查询并处理所有的援助
     * @return
     */
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAll(@RequestParam(name = "pages", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "8") int size) {
        ModelAndView mv = new ModelAndView();

        List<Question> questions = questionService.findAll(page, size);

        //PageInfo就是一个分页bean
        PageInfo pageInfo = new PageInfo(questions);


        mv.addObject("pb", pageInfo);

        // mv.addAllObjects("questions", questions);
        mv.setViewName("/manager_list");

        return mv;
    }

    /**
     * 律师查询自己还未处理的请求
     * @param page
     * @param size
     * @param request
     * @return
     */
    @RequestMapping(value = "/findAnswerQuestion", method = RequestMethod.GET)
    public ModelAndView findAnswerQuestion(@RequestParam(name = "pages", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "8") int size, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        List<Question> questions = questionService.findAnswerQuestion(loginUser.getId(), page, size);

        //PageInfo就是一个分页bean
        PageInfo pageInfo = new PageInfo(questions);


        mv.addObject("pb", pageInfo);

        mv.setViewName("/lawyer_list");

        return mv;
    }

    /**
     * 拒绝单个请求
     * @param id
     * @return
     */
    @RequestMapping("/refuseApply/{id}")
    public String refuseApply(@PathVariable("id") String id) {
        questionService.refuseApply(id);

        return "forward:/question/findAll";
    }

    /**
     * 同意单个请求
     * @param id
     * @return
     */
    @RequestMapping("/passApply/{id}")
    public String passApply(@PathVariable("id") String id) {
        questionService.passApply(id);

        return "forward:/question/findAll";
    }

    /**
     * 拒绝选中的请求
     * @param ids
     * @return
     */
    @RequestMapping("/refuseSelectApply")
    public String refuseSelectApply(@RequestParam("questionid") String[] ids) {
        questionService.refuseSelectApply(ids);

        return "forward:/question/findAll";
    }

    /**
     * 同意选中的请求
     * @param ids
     * @return
     */
    @RequestMapping("/passSelectApply")
    public String passSelectApply(@RequestParam("questionid") String[] ids) {
        questionService.passSelectApply(ids);

        return "forward:/question/findAll";
    }

    /**
     * 阅读援助信息详情
     * @param id
     * @return
     */
    @RequestMapping("/readQuestion/{id}")
    public ModelAndView readQuestion(@PathVariable("id") String id) {

        ModelAndView mv = new ModelAndView();

        Question question = questionService.findContent(id);
        questionService.addFrequency(id);

        mv.addObject("question", question);
        mv.setViewName("/question_answer");

        return mv;
    }

    /**
     * 律师回答问题
     * @param id
     * @param answer
     * @return
     */
    @RequestMapping(value = "/answerQuestion", method = RequestMethod.POST)
    public String answerQuestion(@RequestParam("id") String id, @RequestParam("answer") String answer) {

        Question question = new Question();
        question.setId(Integer.parseInt(id));
        question.setAnswer(answer);

        questionService.answerQuestion(question);

        return "redirect:/question/findAnswerQuestion";
    }

    /**
     * 查询所有法律援助信息
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("findAllQuestion")
    @ResponseBody
    public PageInfo<Question> findAllQuestion(@RequestParam(name = "pages", required = true, defaultValue = "1") String page, @RequestParam(name = "size", required = true, defaultValue = "8") String size) {
        List<Question> questionList = questionService.findAllQuestion(Integer.parseInt(page), Integer.parseInt(size));
        PageInfo<Question> pb = new PageInfo<>(questionList);

        return pb;
    }

    /**
     * 查询审核中的法律援助
     * @param page
     * @param size
     * @param statu
     * @return
     */
    @RequestMapping("findKindsQuestion")
    @ResponseBody
    public PageInfo<Question> findKindsQuestion(@RequestParam(name = "pages", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "8") int size, @RequestParam("statu") String statu) {
        List<Question> questionList = questionService.findKindsQuestion(page, size, statu);
        PageInfo<Question> pb = new PageInfo<>(questionList);

        return pb;
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
    @RequestMapping("selectLikeQuestion")
    @ResponseBody
    public PageInfo<Question> selectLikeQuestion(@RequestParam(name = "pages", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "8") int size,
                                   @RequestParam(name = "type",required = false) String type,
                                   @RequestParam(name = "statu",required = false) String statu,
                                   @RequestParam(name = "pname",required = false) String pname) {

        List<Question> questionList = questionService.selectLikeQuestion(page, size, type,statu,pname);
        PageInfo<Question> pb = new PageInfo<>(questionList);

        return pb;
    }

    /**
     * 查找处于不同状态的记录条数
     * @return
     */
    @RequestMapping("findAmount")
    @ResponseBody
    public Map<String,Integer> findAmount(){
        Map<String, Integer> map = questionService.findAmount();

        return map;
    }
}