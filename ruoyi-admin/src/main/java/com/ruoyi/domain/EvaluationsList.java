package com.ruoyi.domain;

import com.ruoyi.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * ClassName: EvaluationsList
 * Package: com.ruoyi.domain
 * Description:
 *
 * @Author lyj
 * @Create 2024/6/6 18:05
 * @Version 1.0
 */
public class EvaluationsList {
    private static final long serialVersionUID = 1L;

    /** 评价ID */
    private Long id;

    /** 作品ID */
    @Excel(name = "作品ID")
    private Long workId;

    /** 账户ID */
    @Excel(name = "账户ID")
    private Long accountId;

    /** 评委姓名 */
    @Excel(name = "评委姓名")
    private String reviewerName;

    /** 教学实施 */
    @Excel(name = "教学实施")
    private Long implementScore;

    /** 教案 */
    @Excel(name = "教案")
    private Long planningScore;

    /** 视频资料 */
    @Excel(name = "视频资料")
    private Long videoScore;

    /** 专业人才培养方案 */
    @Excel(name = "专业人才培养方案")
    private Long trainingScore;

    /** 课程标准 */
    @Excel(name = "课程标准")
    private Long standardsScore;

    /** 得分 */
    @Excel(name = "得分")
    private Long score;

    /** 链接 */
    @Excel(name = "链接")
    private String link;

    /** 教材选用 */
    @Excel(name = "教材选用")
    private Long textbookScore;

    /** 评价建议 */
    @Excel(name = "评价建议")
    private String suggest;

    /** 学校 */
    @Excel(name = "学校")
    private String school;

    /** 作品名称 */
    @Excel(name = "作品名称")
    private String title;

    /** 参赛姓名 */
    @Excel(name = "参赛姓名")
    private String author;

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
    }
    public void setAuthor(String author)
    {
        this.author = author;
    }

    public String getAuthor()
    {
        return author;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setWorkId(Long workId)
    {
        this.workId = workId;
    }

    public Long getWorkId()
    {
        return workId;
    }
    public void setAccountId(Long accountId)
    {
        this.accountId = accountId;
    }

    public Long getAccountId()
    {
        return accountId;
    }
    public void setReviewerName(String reviewerName)
    {
        this.reviewerName = reviewerName;
    }

    public String getReviewerName()
    {
        return reviewerName;
    }
    public void setImplementScore(Long implementScore)
    {
        this.implementScore = implementScore;
    }

    public Long getImplementScore()
    {
        return implementScore;
    }
    public void setPlanningScore(Long planningScore)
    {
        this.planningScore = planningScore;
    }

    public Long getPlanningScore()
    {
        return planningScore;
    }
    public void setVideoScore(Long videoScore)
    {
        this.videoScore = videoScore;
    }

    public Long getVideoScore()
    {
        return videoScore;
    }
    public void setTrainingScore(Long trainingScore)
    {
        this.trainingScore = trainingScore;
    }

    public Long getTrainingScore()
    {
        return trainingScore;
    }
    public void setStandardsScore(Long standardsScore)
    {
        this.standardsScore = standardsScore;
    }

    public Long getStandardsScore()
    {
        return standardsScore;
    }
    public void setScore(Long score)
    {
        this.score = score;
    }

    public Long getScore()
    {
        return score;
    }
    public void setLink(String link)
    {
        this.link = link;
    }

    public String getLink()
    {
        return link;
    }
    public void setTextbookScore(Long textbookScore)
    {
        this.textbookScore = textbookScore;
    }

    public Long getTextbookScore()
    {
        return textbookScore;
    }
    public void setSuggest(String suggest)
    {
        this.suggest = suggest;
    }

    public String getSuggest()
    {
        return suggest;
    }

    public void setSchool(String school)
    {
        this.school = school;
    }

    public String getSchool()
    {
        return school;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("workId", getWorkId())
                .append("accountId", getAccountId())
                .append("reviewerName", getReviewerName())
                .append("implementScore", getImplementScore())
                .append("planningScore", getPlanningScore())
                .append("videoScore", getVideoScore())
                .append("trainingScore", getTrainingScore())
                .append("standardsScore", getStandardsScore())
                .append("score", getScore())
                .append("link", getLink())
                .append("textbookScore", getTextbookScore())
                .append("suggest", getSuggest())
                .append("school", getSchool())
                .append("title", getTitle())
                .append("author", getAuthor())
                .toString();
    }
}
