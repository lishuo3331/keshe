package com.demo.dao;

import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface FundDao {

    @Select("SELECT * from t_d0_fund;")
    List<com.demo.po.Fund> getFund();
}
