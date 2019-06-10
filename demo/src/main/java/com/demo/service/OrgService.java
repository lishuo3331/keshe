package com.demo.service;

import com.demo.po.Organization;
import org.springframework.stereotype.Service;

import java.util.List;


public interface OrgService {


    List<Organization> getAll();

    List<Organization> getOrderByPage(int page);

    Integer getnumorg();
}
