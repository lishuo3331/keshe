package com.demo.service;

import com.demo.dao.OrgDao;
import com.demo.dao.StuffDao;
import com.demo.dao.StuffMapper;
import com.demo.po.Stuff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StuffServiceImpl implements StuffService{

    @Autowired
    StuffDao stuffDao;
    @Autowired
    StuffMapper stuffMapper;


    @Override
    public List<Stuff> getAll() {
        List<Stuff> stuffList = stuffDao.getAll();
        return stuffList;
    }

    @Override
    public void addStuff(Stuff stuff) {
        System.out.println(stuffMapper.insert(stuff));
    }

    @Override
    public List<Stuff> getStuffByPage(int page) {
        return stuffDao.getStuff((page-1)*8);
    }

    @Override
    public Integer getnumstuff() {
        Integer num = stuffDao.getNumStuff();
        if (num%8==0)
            return num/8;
        else
            return num/8+1;
    }
}
