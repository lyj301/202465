package com.ruoyi.User.Controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.domain.Works;
import com.ruoyi.service.IWorksService;
import com.ruoyi.service.impl.WorksServiceImpl;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * ClassName: UserWord
 * Package: com.ruoyi.User.Controller
 * Description:
 *
 * @Author lyj
 * @Create 2024/6/7 13:25
 * @Version 1.0
 */
@RestController
@RequestMapping("/User/word")
@Api(tags = "用户作品报名")
public class UserWord extends BaseController {
    @Autowired
    private IWorksService worksService;
    /**
     * 获取作品管理详细信息
     */
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(worksService.selectWorksById(id));
    }

    /**
     * 新增作品管理
     */
    @PostMapping
    public AjaxResult add(@RequestBody Works works)
    {
        return toAjax(worksService.insertWorks(works));
    }

    /**
     * 修改作品管理
     */
    @PutMapping
    public AjaxResult edit(@RequestBody Works works)
    {
        return toAjax(worksService.updateWorks(works));
    }

    /**
     * 删除作品管理
     */
    @DeleteMapping("/{id}")
    public AjaxResult remove(@PathVariable Long id)
    {
        return toAjax(worksService.deleteWorksById(id));
    }
}
