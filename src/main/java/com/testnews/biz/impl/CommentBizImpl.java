package com.testnews.biz.impl;

import com.testnews.biz.CommentBiz;
import com.testnews.dao.CommentDao;
import com.testnews.dao.DetailDao;
import com.testnews.entity.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommentBizImpl implements CommentBiz {
    @Autowired
    private CommentDao commentDao;

    @Override
    public List<Comment> getByNewsId(int newsId) {
        return commentDao.getByNewsId(newsId);
    }

    @Override
    public void delete(int newsId) {
        commentDao.delete(newsId);
    }

    @Override
    public void add(Comment comment) {
        commentDao.add(comment);
    }

//    public static void main(String[] args) {
//        ApplicationContext context=new ClassPathXmlApplicationContext("beans.xml");
//        CommentDao commentDao = context.getBean(CommentDao.class);
//        List<Comment> list = commentDao.getByNewsId(1);
//        for (Comment comment : list
//             ) {
//            System.out.println(comment.getAuthor());
//        }
//    }
}
