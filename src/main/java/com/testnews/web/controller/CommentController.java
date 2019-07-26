package com.testnews.web.controller;

import com.testnews.biz.CommentBiz;
import com.testnews.entity.Comment;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class CommentController {
    @Autowired
    private CommentBiz commentBiz;

    @RequestMapping(value = "/comment",method = RequestMethod.GET)
    public String comment(Model model,int newsId){
        System.out.println(newsId);
        List<Comment> list = commentBiz.getByNewsId(newsId);
        model.addAttribute("comments",list);
        return "comment";
    }


}
