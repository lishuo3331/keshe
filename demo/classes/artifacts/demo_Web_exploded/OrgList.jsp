<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 41688
  Date: 2019/6/4
  Time: 11:00
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
    //2019年6月4日16点03分
    <script type="text/javascript">
        //页面加载完成的回调函数 getnumorg
        $(function () {
            $.post("getnumorg",{},function (data) {
                var s='<li><a href="javascript:;" onclick="getfirstpage()">首页</a></li>'+
                    '<li><a href="javascript:;" onclick="getprepage()">上页</a></li>';
                for(var i=0;i < data.num;i++){
                    s+='<li><a href="javascript:;" onclick="getdatabypage(this,'+(i+1)+')">'+(i+1)+'</a></li>';
                }
                s+='<li><a href="javascript:;" onclick="getnextpage()">下页</a></li>'+
                    '<li><a href="javascript:;">尾页</a></li>'+
                    '<li class="pageinfo">第<span id="curpage">1</span>页</li>'+
                    '<li class="pageinfo">共<span id="numpage">'+data.num+'页</li>';
                $("#mul").html(s);
            })
        });
        //获取所有表格信息
            function getdatabypage(obj,page){
                var arr = $("mul").children("li");
                for(var i = 0 ; i < arr.length; i++){
                    $(arr[i]).removeAttr("class");
                }
                //??
                $(obj).parent().attr("class","current");
                $.post("getorgbyajax",{page:page},function (data) {
               var v = "<tr>"+
                    "<th width='7%'>申请单位（个人）</th>"+
                    "<th>经营地址</th>"+
                    "<th width='8%'>专业类别</th>"+
                        "<th>负责人</th>"+
                        "<th width='5%'>报告日期</th>"+
                        "<th width='7%'>审核状态</th>"+
                        "<th class='editColM'>操作</th>"+
                        "</tr>"
                    $(data.data).each(function (i,value) {
                        v = v + "<tr>"+
                            "<td align='center'>"+value.orgname+"</td>"+
                            "<td align='left'><a href='institution-view.html'>"+value.linkadd+"</a></td>"+
                        "<td align='center'>"+value.exetype+"</td>"+
                            "<td align='left'>负责人</td>"+
                            "<td align='center'>"+value.listingdate+"</td>"+
                            "<td align='center'>审核状态</td>"+
                            "<td align='center'>"+
                            "<a href='institution-view.html' class='btnIconView' title='查看详情'></a>"+
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
            //获取首页
            function getfirstpage(){
                if ("1" != $("#curpage").html()) {
                    var arr = $("mul").children("li");
                    for (var i = 0; i < arr.length; i++) {
                        $(arr[i]).removeAttr("class");
                    }
                    $("mul li:nth-child(3)").attr("class", "current");
                    $.post("getorgbyajax", {page: 1}, function (data) {
                        var v = "<tr>" +
                            "<th width='7%'>申请单位（个人）</th>" +
                            "<th>经营地址</th>" +
                            "<th width='8%'>专业类别</th>" +
                            "<th>负责人</th>" +
                            "<th width='5%'>报告日期</th>" +
                            "<th width='7%'>审核状态</th>" +
                            "<th class='editColM'>操作</th>" +
                            "</tr>"
                        $(data.data).each(function (i, value) {
                            v = v + "<tr>" +
                                "<td align='center'>" + value.orgname + "</td>" +
                                "<td align='left'><a href='institution-view.html'>" + value.linkadd + "</a></td>" +
                                "<td align='center'>" + value.exetype + "</td>" +
                                "<td align='left'>负责人</td>" +
                                "<td align='center'>" + value.listingdate + "</td>" +
                                "<td align='center'>审核状态</td>" +
                                "<td align='center'>" +
                                "<a href='institution-view.html' class='btnIconView' title='查看详情'></a>" +
                                "</a>" +
                                "</td>" +
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
                $.post("getorgbyajax", {page: curpage-1}, function (data) {
                    var v = "<tr>" +
                        "<th width='7%'>申请单位（个人）</th>" +
                        "<th>经营地址</th>" +
                        "<th width='8%'>专业类别</th>" +
                        "<th>负责人</th>" +
                        "<th width='5%'>报告日期</th>" + "<th width='7%'>审核状态</th>" +
                        "<th class='editColM'>操作</th>" +
                        "</tr>"
                    $(data.data).each(function (i, value) {
                        v = v + "<tr>" +
                            "<td align='center'>" + value.orgname + "</td>" +
                            "<td align='left'><a href='institution-view.html'>" + value.linkadd + "</a></td>" +
                            "<td align='center'>" + value.exetype + "</td>" +
                            "<td align='left'>负责人</td>" +
                            "<td align='center'>" + value.listingdate + "</td>" +
                            "<td align='center'>审核状态</td>" +
                            "<td align='center'>" +
                            "<a href='institution-view.html' class='btnIconView' title='查看详情'></a>" +
                            "</a>" +
                            "</td>" +
                            "</tr>";
                    });
                    //设置当前表格信息
                    $("#mytable").html(v);
                    //设置页码
                    $("#curpage").html(--curpage);
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
                    $.post("getorgbyajax", {page: ++curpage}, function (data) {
                        var v = "<tr>" +
                            "<th width='7%'>申请单位（个人）</th>" +
                            "<th>经营地址</th>" +
                            "<th width='8%'>专业类别</th>" +
                            "<th>负责人</th>" +
                            "<th width='5%'>报告日期</th>" + "<th width='7%'>审核状态</th>" +
                            "<th class='editColM'>操作</th>" +
                            "</tr>"
                        $(data.data).each(function (i, value) {
                            v = v + "<tr>" +
                                "<td align='center'>" + value.orgname + "</td>" +
                                "<td align='left'><a href='institution-view.html'>" + value.linkadd + "</a></td>" +
                                "<td align='center'>" + value.exetype + "</td>" +
                                "<td align='left'>负责人</td>" +
                                "<td align='center'>" + value.listingdate + "</td>" +
                                "<td align='center'>审核状态</td>" +
                                "<td align='center'>" +
                                "<a href='institution-view.html' class='btnIconView' title='查看详情'></a>" +
                                "</a>" +
                                "</td>" +
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
        <h2>&gt;&gt;建设项目审查</h2>
    </div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="commonTableSearch">
        <form id="form-search" name="form-search" action="" method="post">
            <tr>
                <th align="right">专业类别：</th>
                <td><select name="select" id="select">
                    <option value="">公共场所</option>
                    <option value="">生活饮用水</option>
                    <option value="">职业卫生</option>
                    <option value="">放射卫生</option>
                    <option value="">其他</option>
                </select></td>
                <td><div align="right">单位名称（个人）：</div></td>
                <td><input name="textfield6" type="text" class="inputTextNormal" id="textfield6" /></td>
                <td align="right">组织机构代码：</td>
                <td align="right"><input name="textfield62" type="text" class="inputTextNormal" id="textfield62" /></td>
                <td align="right">身份证号码：</td>
                <td align="right"><input name="textfield622" type="text" class="inputTextNormal" id="textfield622" /></td>
            </tr>
            <tr>
                <th align="right">行政区划：</th>
                <td><input name="textfield63" type="text" class="inputTextNormal" id="textfield63" value="用地址进行后台匹配" /></td>
                <td><div align="right">报告单位：</div></td>
                <td><input name="textfield64" type="text" class="inputTextNormal" id="textfield64" /></td>
                <td align="right">报告人：</td>
                <td align="right"><input name="textfield642" type="text" class="inputTextNormal" id="textfield642" /></td>
                <td align="right">&nbsp;</td>
                <td align="right"><button>检索</button></td>
            </tr>
        </form>
    </table>
    <!--//commonTableSearch-->
    <div class="btnBar">
        <ul class="clearfix">
            <li><a href="institution-creat.html" title="创建机构" class="btnNormal">新增</a></li>
        </ul>
    </div>
    <table id="mytable" border="0" cellspacing="1" cellpadding="0" class="commonTable">
        <tr>
            <th width="7%">申请单位（个人）</th>
            <th>经营地址</th>
            <th width="8%">专业类别</th>
            <th>负责人</th>
            <th width="5%">报告日期</th>
            <th width="7%">审核状态</th>
            <th class="editColM">操作</th>
        </tr>
        <%--<tr>--%>
            <%--<td align="center">0123456-01</td>--%>
            <%--<td align="left"><a href="institution-view.html">江苏省卫生监督所</a></td>--%>
            <%--<td align="center">行政部门</td>--%>
            <%--<td align="left">南京市中央路42号</td>--%>
            <%--<td align="center">210008</td>--%>
            <%--<td align="center">2010-2-2</td>--%>
            <%--<td align="center">--%>
                <%--<a href="institution-view.html" class="btnIconView" title="查看详情"></a>--%>
                <%--</a>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <c:forEach var="o" items="${data}">
            <tr>
                <td align="center">${o.orgname}</td>
                <td align="left"><a href="institution-view.html">${o.linkadd}</a></td>
                <td align="center">${o.exetype}</td>
                <td align="left">负责人</td>
                <td align="center">${o.listingdate}</td>
                <td align="center">审核状态</td>
                <td align="center">
                    <a href="institution-view.html" class="btnIconView" title="查看详情"></a>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <!--//commonTable-->
    <!--拼接代码 -->
    <div id="pagelist">
        <ul class="clearfix" id ="mul">
            <li><a href="javascript:;" onclick="getfirstpage()">首页</a></li>
            <li><a href="javascript:;" onclick="getprepage()">上页</a></li>
            <li><a class="current" href="javascript:;" onclick="getdatabypage(this,1)">1</a></li>
            <li><a href="javascript:;" onclick="getdatabypage(this,2)">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="javascript:;" onclick="getnextpage()">下页</a></li>
            <li><a href="#">尾页</a></li>
            <li class="pageinfo">第<span id="curpage">1</span>页</li>
            <li class="pageinfo">共<span id="numpage">1</span>页</li>
        </ul>
    </div>
</div>
<!--//content pages wrap-->
</body>
</html>

