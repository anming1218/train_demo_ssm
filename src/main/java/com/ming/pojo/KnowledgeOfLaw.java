package com.ming.pojo;
/**
 *@program: train_ssm
 *@description:
 *@author: ming
 *@create: 2020-10-06 16:35
 */
public class KnowledgeOfLaw {
    /**
     * 主键id
     */
    private Integer id;

    /**
     * 主题
     */
    private String topic;

    /**
     * 标题
     */
    private String title;

    /**
     * 摘要
     */
    private String summary;

    /**
     * 主要内容
     */
    private String comment;

    /**
     * 阅读次数
     */
    private Integer frequency;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getFrequency() {
        return frequency;
    }

    public void setFrequency(Integer frequency) {
        this.frequency = frequency;
    }

    @Override
    public String toString() {
        return "KnowledgeOfLaw{" +
                "id=" + id +
                ", topic='" + topic + '\'' +
                ", title='" + title + '\'' +
                ", summary='" + summary + '\'' +
                ", comment='" + comment + '\'' +
                ", frequency=" + frequency +
                '}';
    }
}
