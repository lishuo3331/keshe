package com.demo.action;

import com.demo.dao.OrgDao;
import com.demo.po.Organization;
import com.demo.service.OrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrgController {

    @Autowired
    OrgService orgService;

    @RequestMapping("/getOrgs")
    public String getOrgs(HttpServletRequest request){
        List<Organization> organizations = orgService.getAll();
        for (Organization o : organizations)
            System.out.println(o);
        request.setAttribute("data",organizations);
        return "OrgList";  //请求转发  在当前路径下转发
    }

    @RequestMapping("/getorderbypage")
    public String getOrderByPage(@RequestParam("page") int p,HttpServletRequest request){

        List<Organization> organizations = orgService.getOrderByPage(p);
        for (Organization o : organizations)
            System.out.println(o+"08点15分");
        request.setAttribute("data",organizations);
        return "OrgList";
    }

    @RequestMapping("/getorgbyajax")
    @ResponseBody
    public Map<String,Object> getOrgByAjax(@RequestParam("page") int p){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Organization> organizations = orgService.getOrderByPage(p);
        Integer num = orgService.getnumorg();
        map.put("data",organizations);
        map.put("num",num);
        return map;
    }
    //进入页面时
    @RequestMapping("/getnumorg")
    @ResponseBody
    public Map<String,Object> getnumorg(){
        Map<String,Object> map = new HashMap<String,Object>();
        Integer num = orgService.getnumorg();
        map.put("num",num);
        return map;
    }
}
