package com.testnews.biz;

import com.testnews.entity.Comment;

import java.util.List;

public interface CommentBiz {
    List<Comment> getByNewsId(int newsId);

    void delete(int newsId);

    void add(Comment comment);
}
