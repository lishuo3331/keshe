package com.demo.action;

import com.demo.dao.FundDao;
import com.demo.po.Fund;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class DemoController {


    @Autowired
    private FundDao fundDao;

//    @RequestMapping("/hello")
//    public List<Fund> hello(){
//        List<Fund> list = fundDao.getFund();
//        return list;
//    }

    @RequestMapping("/hello")
    public String hello(){
        List<Fund> list = fundDao.getFund();
        for(Fund fund : list){
            System.out.println(fund);
        }
        return "index";
    }


}
