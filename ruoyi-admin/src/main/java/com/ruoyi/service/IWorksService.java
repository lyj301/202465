package com.ruoyi.service;

import java.util.List;

import com.ruoyi.domain.Works;
import com.ruoyi.domain.WorksList;

/**
 * 作品管理Service接口
 * 
 * @author lyj
 * @date 2024-06-06
 */
public interface IWorksService 
{

    /**
     * 查询作品管理列表
     * 
     * @param works 作品管理
     * @return 作品管理集合
     */
    public List<WorksList> selectWorksList(WorksList works);

    /**
     * 新增作品管理
     *
     * @param works 作品管理
     * @return 结果
     */
    public int insertWorks(Works works);

    /**
     * 修改作品管理
     *
     * @param works 作品管理
     * @return 结果
     */
    public int updateWorks(Works works);

    /**
     * 删除作品管理信息
     *
     * @param id 作品管理主键
     * @return 结果
     */
    public int deleteWorksById(Long id);

    /**
     * 查询作品管理
     *
     * @param id 作品管理主键
     * @return 作品管理
     */
    public WorksList selectWorksById(Long id);
}
