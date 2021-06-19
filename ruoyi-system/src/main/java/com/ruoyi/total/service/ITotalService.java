package com.ruoyi.total.service;

import com.ruoyi.total.domain.Total;

import java.util.List;

public interface ITotalService {
    /**
     * 查询眼科列表
     *
     * @param total 眼科
     * @return 眼科集合
     */
    public List<Total> selectTotalList(Total total);
}
