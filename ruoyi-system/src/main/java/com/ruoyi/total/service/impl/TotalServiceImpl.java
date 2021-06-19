package com.ruoyi.total.service.impl;

import com.ruoyi.eye.domain.Ophthalmic;
import com.ruoyi.eye.mapper.OphthalmicMapper;
import com.ruoyi.total.domain.Total;
import com.ruoyi.total.mapper.TotalMapper;
import com.ruoyi.total.service.ITotalService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TotalServiceImpl implements ITotalService {
    @Autowired
    private TotalMapper totalMapper;
    /**
     * 查询眼科列表
     *
     * @param total 眼科
     * @return 眼科
     */
    @Override
    public List<Total> selectTotalList(Total total)
    {
        return totalMapper.selectTotalList(total);
    }
}
