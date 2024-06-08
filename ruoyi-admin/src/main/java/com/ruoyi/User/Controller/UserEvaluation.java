package com.ruoyi.User.Controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.domain.Evaluations;
import com.ruoyi.domain.EvaluationsList;
import com.ruoyi.service.IEvaluationsService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * ClassName: UserEvaluation
 * Package: com.ruoyi.User.Controller
 * Description:
 *
 * @Author lyj
 * @Create 2024/6/7 14:55
 * @Version 1.0
 */
@RestController
@RequestMapping("/User/evaluation")
@Api(tags = "评委评分")
public class UserEvaluation extends BaseController {
    @Autowired
    private IEvaluationsService evaluationsService;

    /**
     * 查询评价管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(EvaluationsList evaluations)
    {
        startPage();
        List<EvaluationsList> list = evaluationsService.selectEvaluationsList(evaluations);
        return getDataTable(list);
    }
    /**
     * 修改评价管理
     */
    @PutMapping
    public AjaxResult edit(@RequestBody Evaluations evaluations)
    {
        return toAjax(evaluationsService.updateEvaluations(evaluations));
    }
}
