package com.ruoyi.service;

import java.util.List;
import com.ruoyi.domain.Evaluations;
import com.ruoyi.domain.EvaluationsList;

/**
 * 评价管理Service接口
 * 
 * @author lyj
 * @date 2024-06-06
 */
public interface IEvaluationsService 
{
    /**
     * 查询评价管理列表
     * 
     * @param evaluations 评价管理
     * @return 评价管理集合
     */
    public List<EvaluationsList> selectEvaluationsList(EvaluationsList evaluations);

    int updateEvaluations(Evaluations evaluations);

}
