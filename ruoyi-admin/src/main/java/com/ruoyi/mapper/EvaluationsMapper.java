package com.ruoyi.mapper;

import java.util.List;
import com.ruoyi.domain.Evaluations;
import com.ruoyi.domain.EvaluationsList;

/**
 * 评价管理Mapper接口
 * 
 * @author lyj
 * @date 2024-06-06
 */
public interface EvaluationsMapper 
{
    /**
     * 查询评价管理
     * 
     * @param id 评价管理主键
     * @return 评价管理
     */
    public Evaluations selectEvaluationsById(Long id);

    /**
     * 查询评价管理列表
     * 
     * @param evaluations 评价管理
     * @return 评价管理集合
     */
    public List<EvaluationsList> selectEvaluationsList(EvaluationsList evaluations);

    /**
     * 新增评价管理
     * 
     * @param evaluations 评价管理
     * @return 结果
     */
    public int insertEvaluations(Evaluations evaluations);

    /**
     * 修改评价管理
     * 
     * @param evaluations 评价管理
     * @return 结果
     */
    public int updateEvaluations(Evaluations evaluations);

    /**
     * 删除评价管理
     * 
     * @param id 评价管理主键
     * @return 结果
     */
    public int deleteEvaluationsById(Long id);

    /**
     * 批量删除评价管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteEvaluationsByIds(Long[] ids);
}
