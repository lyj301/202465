package com.ruoyi.Admit.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.domain.EvaluationsList;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.domain.Evaluations;
import com.ruoyi.service.IEvaluationsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 评价管理Controller
 * 
 * @author lyj
 * @date 2024-06-06
 */
@RestController
@RequestMapping("/Evaluations/evaluations")
public class EvaluationsController extends BaseController
{
    @Autowired
    private IEvaluationsService evaluationsService;

    /**
     * 查询评价管理列表
     */
    @PreAuthorize("@ss.hasPermi('Evaluations:evaluations:list')")
    @GetMapping("/list")
    public TableDataInfo list(EvaluationsList evaluations)
    {
        startPage();
        List<EvaluationsList> list = evaluationsService.selectEvaluationsList(evaluations);
        return getDataTable(list);
    }

    /**
     * 导出评价管理列表
     */
    @PreAuthorize("@ss.hasPermi('Evaluations:evaluations:export')")
    @Log(title = "评价管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EvaluationsList evaluations)
    {
        List<EvaluationsList> list = evaluationsService.selectEvaluationsList(evaluations);
        ExcelUtil<EvaluationsList> util = new ExcelUtil<EvaluationsList>(EvaluationsList.class);
        util.exportExcel(response, list, "评价管理数据");
    }
}
