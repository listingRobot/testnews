package com.testnews.web.controller;

import com.alibaba.fastjson.JSONArray;
import com.testnews.biz.CommentBiz;
import com.testnews.biz.DetailBiz;
import com.testnews.entity.Detail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DetailController {
    @Autowired
    private DetailBiz detailBiz;

    @Autowired
    private CommentBiz commentBiz;

    @RequestMapping("/index.html")
    public String index(Model model){
        Integer page = 1;
        String title = "";
        int pageSize = 2;
        int currentPageNo = (page-1)*pageSize;
        List<Detail> list = detailBiz.getByTitle(title,page,pageSize);
        int rows = detailBiz.getCountByTitle(title);
        int pageCount = (int)Math.ceil((double)rows/pageSize);
        model.addAttribute("Details",list);
        model.addAttribute("pageCount",pageCount);
        model.addAttribute("page",page);
        return "index";
    }


    @RequestMapping("/search")
    @ResponseBody
    public String search(String title,Integer page){
        page = page == null?1:page;
        int pageSize = 2;
        int currentPageNo = (page-1)*pageSize;
        List<Detail> list = detailBiz.getByTitle(title,currentPageNo,pageSize);
        System.out.println(title);
        System.out.println(list.size());
        int rows = detailBiz.getCountByTitle(title);
        int pageCount = (int)Math.ceil((double)rows/pageSize);
        JSONArray array = new JSONArray();
        array.add(0,list);
        array.add(1,pageCount);
        array.add(2,page);
        System.out.println(array);
        return array.toJSONString();
    }
}
