package com.testnews.biz;

import com.testnews.entity.Detail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DetailBiz {
    List<Detail> getByTitle(String title, int from, int pageSize);

    int getCountByTitle(String title);

    void delete(int id);
}
