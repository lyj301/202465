package com.ruoyi.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * ClassName: WorksList
 * Package: com.ruoyi.Admit.domain
 * Description:
 *
 * @Author lyj
 * @Create 2024/6/6 16:56
 * @Version 1.0
 */
public class WorksList {
    private static final long serialVersionUID = 1L;

    /** 作品ID */
    private Long id;

    /** 作品名称 */
    @Excel(name = "作品名称")
    private String title;

    /** 参赛姓名 */
    @Excel(name = "参赛姓名")
    private String author;

    /** 账户ID */
    @Excel(name = "账户ID")
    private Long accountId;

    /** 参赛老师 */
    @Excel(name = "参赛老师")
    private String teachers;

    /** 所属课程 */
    @Excel(name = "所属课程")
    private String course;

    /** 链接 */
    @Excel(name = "链接")
    private String link;

    /** 联系方式 */
    @Excel(name = "联系方式")
    private String contact;

    /** 学校 */
    @Excel(name = "学校")
    private String school;

    /** 报名组别 */
    @Excel(name = "报名组别")
    private String scope;

    /** 课堂实录 */
    private String classRecord;

    /** 教案 */
    private String lessonPlanning;

    /** 教学报告 */
    private String lessonReport;

    /** 专业人才培养方案 */
    private String trainingReport;

    /** 课程标准 */
    private String standards;

    /** 其他附件 */
    private String other;

    /** 提交时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "提交时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date submissionTime;

    /** 视频资料 */
    private String views;

    /** 得分 */
    private Long score;

    /** 参赛报名表 */
    private String entryForm;

    /** 信息公示件 */
    private String messageBook;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
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
    public void setAccountId(Long accountId)
    {
        this.accountId = accountId;
    }

    public Long getAccountId()
    {
        return accountId;
    }
    public void setTeachers(String teachers)
    {
        this.teachers = teachers;
    }

    public String getTeachers()
    {
        return teachers;
    }
    public void setCourse(String course)
    {
        this.course = course;
    }

    public String getCourse()
    {
        return course;
    }
    public void setLink(String link)
    {
        this.link = link;
    }

    public String getLink()
    {
        return link;
    }
    public void setContact(String contact)
    {
        this.contact = contact;
    }

    public String getContact()
    {
        return contact;
    }
    public void setClassRecord(String classRecord)
    {
        this.classRecord = classRecord;
    }

    public String getClassRecord()
    {
        return classRecord;
    }
    public void setLessonPlanning(String lessonPlanning)
    {
        this.lessonPlanning = lessonPlanning;
    }

    public String getLessonPlanning()
    {
        return lessonPlanning;
    }
    public void setLessonReport(String lessonReport)
    {
        this.lessonReport = lessonReport;
    }

    public String getLessonReport()
    {
        return lessonReport;
    }
    public void setTrainingReport(String trainingReport)
    {
        this.trainingReport = trainingReport;
    }

    public String getTrainingReport()
    {
        return trainingReport;
    }
    public void setStandards(String standards)
    {
        this.standards = standards;
    }

    public String getStandards()
    {
        return standards;
    }
    public void setOther(String other)
    {
        this.other = other;
    }

    public String getOther()
    {
        return other;
    }
    public void setSubmissionTime(Date submissionTime)
    {
        this.submissionTime = submissionTime;
    }

    public Date getSubmissionTime()
    {
        return submissionTime;
    }
    public void setViews(String views)
    {
        this.views = views;
    }

    public String getViews()
    {
        return views;
    }
    public void setScore(Long score)
    {
        this.score = score;
    }

    public Long getScore()
    {
        return score;
    }
    public void setEntryForm(String entryForm)
    {
        this.entryForm = entryForm;
    }

    public String getEntryForm()
    {
        return entryForm;
    }
    public void setMessageBook(String messageBook)
    {
        this.messageBook = messageBook;
    }

    public String getMessageBook()
    {
        return messageBook;
    }

    public void setSchool(String school)
    {
        this.school = school;
    }

    public String getSchool()
    {
        return school;
    }

    public void setScope(String scope)
    {
        this.scope = scope;
    }

    public String getScope()
    {
        return scope;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("title", getTitle())
                .append("author", getAuthor())
                .append("accountId", getAccountId())
                .append("teachers", getTeachers())
                .append("course", getCourse())
                .append("link", getLink())
                .append("contact", getContact())
                .append("classRecord", getClassRecord())
                .append("lessonPlanning", getLessonPlanning())
                .append("lessonReport", getLessonReport())
                .append("trainingReport", getTrainingReport())
                .append("standards", getStandards())
                .append("other", getOther())
                .append("submissionTime", getSubmissionTime())
                .append("views", getViews())
                .append("score", getScore())
                .append("entryForm", getEntryForm())
                .append("messageBook", getMessageBook())
                .append("school", getSchool())
                .append("scope", getScope())
                .toString();
    }
}
