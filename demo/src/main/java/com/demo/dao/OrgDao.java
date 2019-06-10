package com.demo.dao;

import com.demo.po.Organization;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrgDao {

    //获取机构表所有信息
    @Select("SELECT * from t_d0_organization;")
    List<Organization> getAll();
    //分页获取机构表信息
    @Select("SELECT * from t_d0_organization limit #{page},8;")
    List<Organization> getOrg(@Param("page") int page);
    //获取机构数量
    @Select("SELECT COUNT(*) from t_d0_organization;")
    Integer getNumOrg();
}
