package com.ruoyi.Admit.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.domain.WorksList;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.service.IWorksService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 作品管理Controller
 * 
 * @author lyj
 * @date 2024-06-06
 */
@RestController
@RequestMapping("/Works/works")
@Api(tags = "作品管理")
public class WorksController extends BaseController
{
    @Autowired
    private IWorksService worksService;

    /**
     * 查询作品管理列表
     */
    @PreAuthorize("@ss.hasPermi('WorksList:works:list')")
    @GetMapping("/list")
    @ApiOperation("WorksList")
    public TableDataInfo list(WorksList works)
    {
        startPage();
        List<WorksList> list = worksService.selectWorksList(works);
        return getDataTable(list);
    }

    /**
     * 导出作品管理列表
     */
    @PreAuthorize("@ss.hasPermi('WorksList:works:export')")
    @Log(title = "作品管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WorksList works)
    {
        List<WorksList> list = worksService.selectWorksList(works);
        ExcelUtil<WorksList> util = new ExcelUtil<WorksList>(WorksList.class);
        util.exportExcel(response, list, "作品管理数据");
    }
}
