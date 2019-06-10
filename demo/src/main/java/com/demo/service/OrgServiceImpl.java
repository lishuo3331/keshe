package com.demo.service;

import com.demo.dao.OrgDao;
import com.demo.po.Organization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrgServiceImpl implements OrgService {

    @Autowired
    OrgDao orgDao;
    @Override
    public List<Organization> getAll() {
        return orgDao.getAll();
    }

    @Override
    public List<Organization> getOrderByPage(int page) {
        return orgDao.getOrg((page-1)*8);
    }

    @Override
    public Integer getnumorg() {
        Integer num = orgDao.getNumOrg();
        if (num%8==0)
            return num/8;
        else
            return num/8+1;
    }
}
