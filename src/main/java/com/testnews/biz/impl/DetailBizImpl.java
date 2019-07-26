package com.testnews.biz.impl;

import com.testnews.biz.DetailBiz;
import com.testnews.dao.DetailDao;
import com.testnews.entity.Detail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DetailBizImpl implements DetailBiz {

    @Autowired
    private DetailDao detailDao;

    @Override
    public List<Detail> getByTitle(String title, int from, int pageSize) {
        return detailDao.getByTitle(title, from, pageSize);
    }

    @Override
    public int getCountByTitle(String title) {
        return detailDao.getCountByTitle(title);
    }

    @Override
    public void delete(int id) {
        detailDao.delete(id);
    }

//    public static void main(String[] args) {
//        ApplicationContext context=new ClassPathXmlApplicationContext("beans.xml");
//        DetailDao detailDao = context.getBean(DetailDao.class);
//        List<Detail> list = detailDao.getByTitle("奥",0,5);
//        for (Detail detail : list
//             ) {
//            System.out.println(detail.getTitle());
//        }
//    }
}
