package com.testnews.dao;

import com.testnews.entity.Detail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DetailDao {
    List<Detail> getByTitle(@Param("title") String title,
                            @Param("from") int from,
                            @Param("pageSize") int pageSize);

    int getCountByTitle(@Param("title") String title);

    void delete(@Param("id") int id);
}
