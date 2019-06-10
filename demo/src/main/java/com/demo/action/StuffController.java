package com.demo.action;


import com.demo.po.Stuff;
import com.demo.service.StuffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class StuffController {

    @Autowired
    StuffService stuffService;



    //获取人员列表
    @RequestMapping("/getallstuff")
    public String getAll(HttpServletRequest servletRequest){
//        Map <String ,Object> map = new HashMap<String,Object>;
        List<Stuff> stuffList = stuffService.getAll();
//        map.put("data",stuffList);
        servletRequest.setAttribute("data",stuffList);
        return "member_list";
    }

    //根据页码获取人员列表
    @RequestMapping("/getstuffbyajax")
    @ResponseBody
    public Map<String,Object> getStuffbyPage(@RequestParam("page") int page){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Stuff> stuffList = stuffService.getStuffByPage(page);
        map.put("data",stuffList);
        System.out.println("getstuffbyajax");
        return map;
    }
    //增加人员
    @RequestMapping("/addStuff")
    public String addStuff(Stuff stuff){

        System.out.println(stuff.getRepmanname());
        System.out.println(stuff.getGender());
        System.out.println(stuff.getFolk());
        System.out.println(stuff);
        stuffService.addStuff(stuff);
        return "";
    }
    //获取人员数量
    @RequestMapping("/getnumstuff")
    @ResponseBody
    public Map<String,Object> getnumstuff(){
        Map<String,Object> map = new HashMap<String, Object>();
        Integer num = stuffService.getnumstuff();
        System.out.println("getnumstuff");
        map.put("num",num);
        return map;
    }
    @RequestMapping("/getstuffbypage")
    public String getOrderByPage(@RequestParam("page") int p,HttpServletRequest request){
        List<Stuff> Stuffs = stuffService.getStuffByPage(p);
//        for (Stuff o : Stuffs)
//            System.out.println(o+"08点15分");
        System.out.println("getstuffbypage");
        request.setAttribute("data",Stuffs);
        return "member_list";
    }
}
