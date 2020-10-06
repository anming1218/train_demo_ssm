package com.ming.pojo;
/**
 *@program: train_ssm
 *@description: 援助事件
 *@author: ming
 *@create: 2020-09-23 21:35
 */
public class Question {

    /**
     * 主键id
     */
    private Integer id;

    /**
     * 问题类型
     */
    private String type;

    /**
     * 问题标题
     */
    private String pname;

    /**
     * 问题详情
     */
    private String details;

    /**
     * 姓名
     */
    private String uname;

    /**
     * 手机号码
     */
    private String telnumber;

    /**
     * 回答
     */
    private String answer;

    /**
     * -1: 已拒绝 0：审核中 1：已审核 2：已解答
     */
    private Integer statu;

    /**
     * 创建人id
     */
    private Integer creatby;

    /**
     * 查看次数
     */
    private Integer frequency;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getTelnumber() {
        return telnumber;
    }

    public void setTelnumber(String telnumber) {
        this.telnumber = telnumber;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }


    public Integer getStatu() {
        return statu;
    }

    public void setStatu(Integer statu) {
        this.statu = statu;
    }

    public Integer getCreatby() {
        return creatby;
    }

    public void setCreatby(Integer creatby) {
        this.creatby = creatby;
    }

    public Integer getFrequency() {
        return frequency;
    }

    public void setFrequency(Integer frequency) {
        this.frequency = frequency;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", pname='" + pname + '\'' +
                ", details='" + details + '\'' +
                ", uname='" + uname + '\'' +
                ", telnumber='" + telnumber + '\'' +
                ", answer='" + answer + '\'' +
                ", statu=" + statu +
                ", creatby=" + creatby +
                ", frequency=" + frequency +
                '}';
    }
}
