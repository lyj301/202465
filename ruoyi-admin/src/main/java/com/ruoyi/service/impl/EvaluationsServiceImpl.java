package com.ruoyi.service.impl;

import java.util.List;

import com.ruoyi.domain.EvaluationsList;
import com.ruoyi.domain.Works;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mapper.EvaluationsMapper;
import com.ruoyi.domain.Evaluations;
import com.ruoyi.service.IEvaluationsService;

/**
 * 评价管理Service业务层处理
 * 
 * @author lyj
 * @date 2024-06-06
 */
@Service
public class EvaluationsServiceImpl implements IEvaluationsService 
{
    @Autowired
    private EvaluationsMapper evaluationsMapper;

    /**
     * 查询评价管理列表
     * 
     * @param evaluations 评价管理
     * @return 评价管理
     */
    @Override
    public List<EvaluationsList> selectEvaluationsList(EvaluationsList evaluations)
    {
        return evaluationsMapper.selectEvaluationsList(evaluations);
    }

    /**
     * 修改评价管理
     *
     * @param evaluations 评价管理
     * @return 结果
     */
    @Override
    public int updateEvaluations(Evaluations evaluations)
    {
        return evaluationsMapper.updateEvaluations(evaluations);
    }

}
