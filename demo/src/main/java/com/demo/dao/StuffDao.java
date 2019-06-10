package com.demo.dao;

import com.demo.po.Stuff;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface StuffDao {

    //查询人员
    @Select("SELECT * from t_d0_stuff;")
    List<Stuff> getAll();
    //增加人员
    @Insert("INSERT into t_d0_stuff VALUES #{stuff};")
    void addStuff(@Param("stuff") Stuff stuff);
    //分页获取人员表信息
    @Select("SELECT * from t_d0_stuff limit #{page},8;")
    List<Stuff> getStuff(@Param("page") int page);
    //获取人员数量
    @Select("SELECT COUNT(*) from t_d0_stuff;")
    Integer getNumStuff();


}
