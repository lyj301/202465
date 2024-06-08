package com.ruoyi.Admit.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.domain.Accounts;
import com.ruoyi.service.IAccountsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 账号管理Controller
 * 
 * @author ruoyi
 * @date 2024-06-06
 */
@RestController
@RequestMapping("/Account/account")
@Api(tags = "账号管理")
public class AccountsController extends BaseController
{
    @Autowired
    private IAccountsService accountsService;

    /**
     * 查询账号管理列表
     */
    @PreAuthorize("@ss.hasPermi('Account:account:list')")
    @GetMapping("/list")
    @ApiOperation("查询账号管理列表")
    public TableDataInfo list(Accounts accounts)
    {
        startPage();
        List<Accounts> list = accountsService.selectAccountsList(accounts);
        return getDataTable(list);
    }

    /**
     * 导出账号管理列表
     */
    @PreAuthorize("@ss.hasPermi('Account:account:export')")
    @Log(title = "账号管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ApiOperation("导出账号管理列表")
    public void export(HttpServletResponse response, Accounts accounts)
    {
        List<Accounts> list = accountsService.selectAccountsList(accounts);
        ExcelUtil<Accounts> util = new ExcelUtil<Accounts>(Accounts.class);
        util.exportExcel(response, list, "账号管理数据");
    }

    /**
     * 获取账号管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('Account:account:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation("获取账号管理详细信息")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(accountsService.selectAccountsById(id));
    }

    /**
     * 新增账号管理
     */
    @PreAuthorize("@ss.hasPermi('Account:account:add')")
    @Log(title = "账号管理", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增账号管理")
    public AjaxResult add(@RequestBody Accounts accounts)
    {
        return toAjax(accountsService.insertAccounts(accounts));
    }

    /**
     * 修改账号管理
     */
    @PreAuthorize("@ss.hasPermi('Account:account:edit')")
    @Log(title = "账号管理", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改账号管理")
    public AjaxResult edit(@RequestBody Accounts accounts)
    {
        return toAjax(accountsService.updateAccounts(accounts));
    }

    /**
     * 删除账号管理
     */
    @PreAuthorize("@ss.hasPermi('Account:account:remove')")
    @Log(title = "账号管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    @ApiOperation("删除账号管理")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(accountsService.deleteAccountsByIds(ids));
    }
}
