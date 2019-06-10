package com.demo.service;

import com.demo.dao.StuffDao;
import com.demo.po.Organization;
import com.demo.po.Stuff;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface StuffService {

    //获取人员列表
    List<Stuff> getAll();
    //增加人员
    void addStuff(Stuff stuff);
    //按照页码获取人员
    List<Stuff> getStuffByPage(int page);
    //获取人员数量
    Integer getnumstuff();
}
