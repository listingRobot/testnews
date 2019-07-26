package com.testnews.dao;

import com.testnews.entity.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentDao {
    List<Comment> getByNewsId(@Param("newsId") int newsId);

    void delete(@Param("newsId") int newsId);

    void add(@Param("comment")Comment comment);
}
