package com.ruoyi.service.impl;

import java.util.List;

import com.ruoyi.domain.Works;
import com.ruoyi.domain.WorksList;
import com.ruoyi.service.IWorksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mapper.WorksMapper;

/**
 * 作品管理Service业务层处理
 * 
 * @author lyj
 * @date 2024-06-06
 */
@Service
public class WorksServiceImpl implements IWorksService
{
    @Autowired
    private WorksMapper worksMapper;

    /**
     * 查询作品管理列表
     * 
     * @param works 作品管理
     * @return 作品管理
     */
    @Override
    public List<WorksList> selectWorksList(WorksList works)
    {
        return worksMapper.selectWorksList(works);
    }

    /**
     * 查询作品管理
     *
     * @param id 作品管理主键
     * @return 作品管理
     */
    @Override
    public WorksList selectWorksById(Long id)
    {
        return worksMapper.selectWorksById(id);
    }

    /**
     * 新增作品管理
     *
     * @param works 作品管理
     * @return 结果
     */
    @Override
    public int insertWorks(Works works)
    {
        return worksMapper.insertWorks(works);
    }

    /**
     * 修改作品管理
     *
     * @param works 作品管理
     * @return 结果
     */
    @Override
    public int updateWorks(Works works)
    {
        return worksMapper.updateWorks(works);
    }

    /**
     * 删除作品管理信息
     *
     * @param id 作品管理主键
     * @return 结果
     */
    @Override
    public int deleteWorksById(Long id)
    {
        return worksMapper.deleteWorksById(id);
    }
}
