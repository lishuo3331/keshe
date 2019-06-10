<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 41688
  Date: 2019/6/8
  Time: 8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
    <title>江苏省卫生监督业务系统</title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" media="all" />
    <script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        //页面加载完成的回调函数 getnumorg
        $(function () {
            $.post("getnumstuff",{},function (data) {
                var s='<li><a href="javascript:;" onclick="getfirstpage()">首页</a></li>'+
                    '<li><a href="javascript:;" onclick="getprepage()">上页</a></li>';
                for(var i=0;i < data.num;i++){
                    s+='<li><a href="javascript:;" onclick="getdatabypage(this,'+(i+1)+')">'+(i+1)+'</a></li>';
                }
                s+='<li><a href="javascript:;" onclick="getnextpage()">下页</a></li>'+
                    '<li><a href="javascript:;">尾页</a></li>'+
                    '<li class="pageinfo">第<span id="curpage">1</span>页</li>'+
                    '<li class="pageinfo">共<span id="numpage">'+data.num+'页</li>';
                // alert(data.num);
                $("#mul").html(s);
            })
        });
        //获取所有表格信息  ok
        function getdatabypage(obj,page){
            var arr = $("mul").children("li");
            for(var i = 0 ; i < arr.length; i++){
                $(arr[i]).removeAttr("class");
            }
            //??
            $(obj).parent().attr("class","current");
            $.post("getstuffbyajax",{page:page},function (data) {
                var v = "<tr>"+
                    "<th>人员编码</th>"+
                    "<th>机构</th>"+
                    "<th>科室</th>"+
                    "<th>姓名</th>"+
                    "<th>性别</th>"+
                    "<th>学历</th>"+
                    "<th>职务</th>"+
                    "<th>职务</th>"+
                    "<th>职级</th>"+
                    "<th>所学专业</th>"+
                    "<th class='editColL'>编辑</th>"+
                    "</tr>";
                $(data.data).each(function (i,value) {
                    v = v + "<tr>"+
                        "<td align='center'>"+value.id+"</td>"+
                        "<td align='center'><a href='institution-view.html'>"+value.orgid+"</a></td>"+
                        "<td align='center'>"+value.sectionid+"</td>"+
                        "<td align='left'>"+value.repmanname+"</td>"+
                        "<td align='center'>"+value.gender+"</td>"+
                        "<td align='left'>"+value.edu+"</td>"+
                        "<td align='center'>"+value.title+"</td>"+
                        "<td align='center'>"+value.joblevel+"</td>"+
                        "<td align='center'>"+value.managejob+"</td>"+
                        "<td align='center'>"+
                        "<a href='member-view.html' class='btnIconView' title='查看详情'></a>"+
                        "<a href='member-edit.html' class='btnIconEdit' title='查看详情'></a>"+
                        "<a href='member-relation.html' class='btnIconRel' title='关联科室'></a>"+
                        "<a href='userid-relation.html' class='btnIconKey' title='创建登录号'></a>"+
                        "<a href='#' class='btnIconDel' title='注销'></a>"+
                        "</a>"+
                        "</td>"+
                        "</tr>";
                });
                //设置当前表格信息
                $("#mytable").html(v);
                //设置页码
                $("#curpage").html(page);
                //设置页数 -- 修改到回调函数处
                // var numorg = data.num;
                // $("#numpage").html(numorg);
                // var
                // for (var i = 0 ; i < numorg;i++){
                //
                // }
            });
        }
        //获取首页ok
        function getfirstpage(){
            if ("1" != $("#curpage").html()) {
                var arr = $("mul").children("li");
                for (var i = 0; i < arr.length; i++) {
                    $(arr[i]).removeAttr("class");
                }
                $("mul li:nth-child(3)").attr("class", "current");
                $.post("getstuffbyajax", {page: 1}, function (data) {
                    var v = "<tr>"+
                        "<th>人员编码</th>"+
                        "<th>机构</th>"+
                        "<th>科室</th>"+
                        "<th>姓名</th>"+
                        "<th>性别</th>"+
                        "<th>学历</th>"+
                        "<th>职务</th>"+
                        "<th>职务</th>"+
                        "<th>职级</th>"+
                        "<th>所学专业</th>"+
                        "<th class='editColL'>编辑</th>"+
                        "</tr>";
                    $(data.data).each(function (i,value) {
                        v = v + "<tr>"+
                            "<td align='center'>"+value.id+"</td>"+
                            "<td align='center'><a href='institution-view.html'>"+value.orgid+"</a></td>"+
                            "<td align='center'>"+value.sectionid+"</td>"+
                            "<td align='left'>"+value.repmanname+"</td>"+
                            "<td align='center'>"+value.gender+"</td>"+
                            "<td align='left'>"+value.edu+"</td>"+
                            "<td align='center'>"+value.title+"</td>"+
                            "<td align='center'>"+value.joblevel+"</td>"+
                            "<td align='center'>"+value.managejob+"</td>"+
                            "<td align='center'>"+
                            "<a href='member-view.html' class='btnIconView' title='查看详情'></a>"+
                            "<a href='member-edit.html' class='btnIconEdit' title='查看详情'></a>"+
                            "<a href='member-relation.html' class='btnIconRel' title='关联科室'></a>"+
                            "<a href='userid-relation.html' class='btnIconKey' title='创建登录号'></a>"+
                            "<a href='#' class='btnIconDel' title='注销'></a>"+
                            "</a>"+
                            "</td>"+
                            "</tr>";
                    });
                    //设置当前表格信息
                    $("#mytable").html(v);
                    //设置页码
                    $("#curpage").html(1);
                });
            }
            else {
                return;
            }
        }
        //获取前一页
        function getprepage(){
            var curpage = $("#curpage").html();
            if("1" != $("#curpage").html()){
                var arr = $("mul").children("li");
                for (var i = 0; i < arr.length; i++) {
                    $(arr[i]).removeAttr("class");
                }
                $("mul li:nth-child(3+curpage)").attr("class", "current");
                // $post("genumorg")
                $.post("getstuffbyajax", {page: --curpage}, function (data) {
                    var v = "<tr>"+
                        "<th>人员编码</th>"+
                        "<th>机构</th>"+
                        "<th>科室</th>"+
                        "<th>姓名</th>"+
                        "<th>性别</th>"+
                        "<th>学历</th>"+
                        "<th>职务</th>"+
                        "<th>职务</th>"+
                        "<th>职级</th>"+
                        "<th>所学专业</th>"+
                        "<th class='editColL'>编辑</th>"+
                        "</tr>";
                    $(data.data).each(function (i,value) {
                        v = v + "<tr>"+
                            "<td align='center'>"+value.id+"</td>"+
                            "<td align='center'><a href='institution-view.html'>"+value.orgid+"</a></td>"+
                            "<td align='center'>"+value.sectionid+"</td>"+
                            "<td align='left'>"+value.repmanname+"</td>"+
                            "<td align='center'>"+value.gender+"</td>"+
                            "<td align='left'>"+value.edu+"</td>"+
                            "<td align='center'>"+value.title+"</td>"+
                            "<td align='center'>"+value.joblevel+"</td>"+
                            "<td align='center'>"+value.managejob+"</td>"+
                            "<td align='center'>"+
                            "<a href='member-view.html' class='btnIconView' title='查看详情'></a>"+
                            "<a href='member-edit.html' class='btnIconEdit' title='查看详情'></a>"+
                            "<a href='member-relation.html' class='btnIconRel' title='关联科室'></a>"+
                            "<a href='userid-relation.html' class='btnIconKey' title='创建登录号'></a>"+
                            "<a href='#' class='btnIconDel' title='注销'></a>"+
                            "</a>"+
                            "</td>"+
                            "</tr>";
                    });
                    //设置当前表格信息
                    $("#mytable").html(v);
                    //设置页码
                    $("#curpage").html(curpage);
                });
            }
            else{
                return;
            }
        }
        //获取下一页，判断条件待更新
        function getnextpage() {
            var page_num = "";
            $.post("getnumorg",{},function (data) {
                page_num = data.num;
            });
            var curpage = $("#curpage").html();
            // alert(Number(page_num));
            // alert(Number(curpage));
            if(1){
                var arr = $("mul").children("li");
                for (var i = 0; i < arr.length; i++) {
                    $(arr[i]).removeAttr("class");
                }
                $("mul li:nth-child(3+curpage)").attr("class", "current");
                $.post("getstuffbyajax", {page: ++curpage}, function (data) {
                    var v = "<tr>"+
                        "<th>人员编码</th>"+
                        "<th>机构</th>"+
                        "<th>科室</th>"+
                        "<th>姓名</th>"+
                        "<th>性别</th>"+
                        "<th>学历</th>"+
                        "<th>职务</th>"+
                        "<th>职务</th>"+
                        "<th>职级</th>"+
                        "<th>所学专业</th>"+
                        "<th class='editColL'>编辑</th>"+
                        "</tr>";
                    $(data.data).each(function (i,value) {
                        v = v + "<tr>"+
                            "<td align='center'>"+value.id+"</td>"+
                            "<td align='center'><a href='institution-view.html'>"+value.orgid+"</a></td>"+
                            "<td align='center'>"+value.sectionid+"</td>"+
                            "<td align='left'>"+value.repmanname+"</td>"+
                            "<td align='center'>"+value.gender+"</td>"+
                            "<td align='left'>"+value.edu+"</td>"+
                            "<td align='center'>"+value.title+"</td>"+
                            "<td align='center'>"+value.joblevel+"</td>"+
                            "<td align='center'>"+value.managejob+"</td>"+
                            "<td align='center'>"+
                            "<a href='member-view.html' class='btnIconView' title='查看详情'></a>"+
                            "<a href='member-edit.html' class='btnIconEdit' title='查看详情'></a>"+
                            "<a href='member-relation.html' class='btnIconRel' title='关联科室'></a>"+
                            "<a href='userid-relation.html' class='btnIconKey' title='创建登录号'></a>"+
                            "<a href='#' class='btnIconDel' title='注销'></a>"+
                            "</a>"+
                            "</td>"+
                            "</tr>";
                    });
                    //设置当前表格信息
                    $("#mytable").html(v);
                    //设置页码
                    $("#curpage").html(curpage);
                });
            }
            else{
                return;
            }
        }
    </script>
</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
    <div class="commonTitle">
        <h2>&gt;&gt; 人员管理</h2></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="commonTableSearch">
        <form id="form-search" name="form-search" action="" method="post">
            <tr>
                <th align="right">机构名称：</th>
                <td><select name="select" id="select">
                    <option value="">某某监督机构1</option>
                    <option value="">某某监督机构2</option>
                    <option value="">某某监督机构3</option>
                    <option value="">...</option>
                </select></td>
                <th align="right">姓名：</th>
                <td><input name="textfield" type="text" class="inputTextNormal" id="textfield" /></td>
                <th >性别：</th>
                <td><select name="select" id="select">
                    <option>请选择</option>
                    <option>男</option>
                    <option>女</option>
                </select></td>
                <th >学历：</th>
                <td><select name="select2" id="select2">
                    <option>请选择</option>
                    <option>博士</option>
                    <option>硕士</option>
                    <option>本科</option>
                    <option>大专</option>
                    <option>中专</option>
                    <option>高中</option>
                    <option>初中</option>
                    <option>无学历</option>
                    <option>不详</option>
                </select></td>
            </tr>
            <tr>
                <th align="right">科室：</th>
                <td><select name="select2" id="select2">
                    <option>请选择</option>
                    <option>科室1</option>
                    <option>科室2</option>
                    <option>科室3</option>
                    <option>科室4</option>
                </select></td>
                <th align="right">职务：</th>
                <td><select name="select2" id="select2">
                    <option>请选择</option>
                    <option>所长</option>
                    <option>书记</option>
                    <option>副所长</option>
                    <option>副书记</option>
                    <option>主任(科长)</option>
                    <option>副主任(副科长)</option>
                    <option>无</option>
                </select></td>
                <th align="right">职级：</th>
                <td><select name="select3" id="select3">
                    <option>请选择</option>
                    <option>省部级正职</option>
                    <option>省部级副职</option>
                    <option>厅局级正职</option>
                    <option>厅局级副职</option>
                    <option>乡科级正职</option>
                    <option>乡科级副职</option>
                    <option>县处级正职</option>
                    <option>县处级副职</option>
                    <option>科办员</option>
                </select></td>
                <th >所学专业：</th>
                <td><select name="select" id="select">
                    <option>请选择</option>
                    <option>工程</option>
                    <option>法律</option>
                    <option>医药</option>
                    <option>公共卫生</option>
                    <option>无专业</option>
                    <option>其他专业</option>
                    <option>不详</option>
                </select>&nbsp;&nbsp;<button>检索</button></td>

            </tr>
        </form>
    </table>
    <!--//commonTableSearch-->
    <div class="btnBar">
        <ul class="clearfix">
            <li><a href="member-create.jsp" title="创建人员" class="btnNormal">创建人员</a></li>
        </ul>
    </div>
    <table id="mytable" border="0" cellspacing="1" cellpadding="0" class="commonTable">
        <tr>
            <th>人员编码</th>
            <th>机构</th>
            <th>科室</th>
            <th>姓名</th>
            <th>性别</th>
            <th>学历</th>
            <th>职务</th>
            <th>职级</th>
            <th>所学专业</th>
            <th class="editColL">编辑</th>
        </tr>
        <%--<tr>--%>
            <%--<td align="center">0123456-01</td>--%>
            <%--<td align="center">江苏省卫生监督所</td>--%>
            <%--<td align="center">办公室</td>--%>
            <%--<td align="left">张三</td>--%>
            <%--<td align="center">男</td>--%>
            <%--<td align="left">本科</td>--%>
            <%--<td align="center">主任(科长)</td>--%>
            <%--<td align="center">乡科级正职</td>--%>
            <%--<td align="center">公共卫生</td>--%>
            <%--<td align="center">--%>
                <%--<a href="member-view.html" class="btnIconView" title="查看详情"></a>--%>
                <%--<a href="member-edit.html" class="btnIconEdit" title="更新"></a>--%>
                <%--<a href="member-relation.html" class="btnIconRel" title="关联科室"></a>--%>
                <%--<a href="userid-relation.html" class="btnIconKey" title="创建登录号"></a>--%>
                <%--<a href="#" class="btnIconDel" title="注销"></a>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <c:forEach var="s" items="${data }">
            <tr>
                <td align="center">${s.id }</td>
                <td align="center">${s.orgid }</td>
                <td align="center">${s.sectionid }</td>
                <td align="left">${s.repmanname }</td>
                <td align="center">${s.gender }</td>
                <td align="left">${s.edu }</td>
                <td align="center">${s.title }</td>
                <td align="center">${s.joblevel }</td>
                <td align="center">${s.managejob }</td>
                <td align="center">
                    <a href="member-view.html" class="btnIconView" title="查看详情"></a>
                    <a href="member-edit.html" class="btnIconEdit" title="更新"></a>
                    <a href="member-relation.html" class="btnIconRel" title="关联科室"></a>
                    <a href="userid-relation.html" class="btnIconKey" title="创建登录号"></a>
                    <a href="#" class="btnIconDel" title="注销"></a>
                </td>
            </tr>
        </c:forEach>
        <%--<tr>--%>
            <%--<td align="center">0123456-01</td>--%>
            <%--<td align="center">南京市卫生监督所</td>--%>
            <%--<td align="center">办公室</td>--%>
            <%--<td align="left">张三</td>--%>
            <%--<td align="center">男</td>--%>
            <%--<td align="left">本科</td>--%>
            <%--<td align="center">主任(科长)</td>--%>
            <%--<td align="center">乡科级正职</td>--%>
            <%--<td align="center">公共卫生</td>--%>
            <%--<td align="center">--%>
                <%--<a href="member-view.html" class="btnIconView" title="查看详情"></a>--%>
                <%--<a href="member-edit.html" class="btnIconEdit" title="更新"></a>--%>
                <%--<a href="member-relation.html" class="btnIconRel" title="关联科室"></a>--%>
                <%--<a href="userid-relation.html" class="btnIconKey" title="创建登录号"></a>--%>
                <%--<a href="#" class="btnIconDel" title="注销"></a>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td align="center">0123456-01</td>--%>
            <%--<td align="center">江苏省卫生监督所</td>--%>
            <%--<td align="center">办公室</td>--%>
            <%--<td align="left">张三</td>--%>
            <%--<td align="center">男</td>--%>
            <%--<td align="left">本科</td>--%>
            <%--<td align="center">主任(科长)</td>--%>
            <%--<td align="center">乡科级正职</td>--%>
            <%--<td align="center">公共卫生</td>--%>
            <%--<td align="center">--%>
                <%--<a href="member-view.html" class="btnIconView" title="查看详情"></a>--%>
                <%--<a href="member-edit.html" class="btnIconEdit" title="更新"></a>--%>
                <%--<a href="member-relation.html" class="btnIconRel" title="关联科室"></a>--%>
                <%--<a href="userid-relation.html" class="btnIconKey" title="创建登录号"></a>--%>
                <%--<a href="#" class="btnIconDel" title="注销"></a>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td align="center">0123456-01</td>--%>
            <%--<td align="center">江苏省卫生监督所</td>--%>
            <%--<td align="center">办公室</td>--%>
            <%--<td align="left">张三</td>--%>
            <%--<td align="center">男</td>--%>
            <%--<td align="left">本科</td>--%>
            <%--<td align="center">主任(科长)</td>--%>
            <%--<td align="center">乡科级正职</td>--%>
            <%--<td align="center">公共卫生</td>--%>
            <%--<td align="center">--%>
                <%--<a href="member-view.html" class="btnIconView" title="查看详情"></a>--%>
                <%--<a href="member-edit.html" class="btnIconEdit" title="更新"></a>--%>
                <%--<a href="member-relation.html" class="btnIconRel" title="关联科室"></a>--%>
                <%--<a href="userid-relation.html" class="btnIconKey" title="创建登录号"></a>--%>
                <%--<a href="#" class="btnIconDel" title="注销"></a>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td align="center">0123456-01</td>--%>
            <%--<td align="center">江苏省卫生监督所</td>--%>
            <%--<td align="center">办公室</td>--%>
            <%--<td align="left">张三</td>--%>
            <%--<td align="center">男</td>--%>
            <%--<td align="left">本科</td>--%>
            <%--<td align="center">主任(科长)</td>--%>
            <%--<td align="center">乡科级正职</td>--%>
            <%--<td align="center">公共卫生</td>--%>
            <%--<td align="center">--%>
                <%--<a href="member-view.html" class="btnIconView" title="查看详情"></a>--%>
                <%--<a href="member-edit.html" class="btnIconEdit" title="更新"></a>--%>
                <%--<a href="member-relation.html" class="btnIconRel" title="关联科室"></a>--%>
                <%--<a href="userid-relation.html" class="btnIconKey" title="创建登录号"></a>--%>
                <%--<a href="#" class="btnIconDel" title="注销"></a>--%>
            <%--</td>--%>
        <%--</tr>--%>
    </table>
    <!--//commonTable-->
    <div id="pagelist">
        <ul class="clearfix" id="mul">
            <li><a href="javascript:;" onclick="getfirstpage()">首页</a></li>
            <li><a  href="javascript:;" onclick="getprepage()">上页</a></li>
            <li><a class="current" href="javascript:;" onclick="getdatabypage(this,1)">1</a></li>
            <li><a href="javascript:;" onclick="getdatabypage(this,2)">2</a></li>
            <li><a href="javascript:;" onclick="getnextpage()">下页</a></li>
            <li><a href="javascript:;">尾页</a></li>
            <li class="pageinfo">第<span id="curpage">1</span>页</li>
            <li class="pageinfo">共<span id="numpage">1</span>页</li>
        </ul>
    </div>
</div>
<!--//content pages wrap-->
</body>
</html>
