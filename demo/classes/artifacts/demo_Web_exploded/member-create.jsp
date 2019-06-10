<%--
  Created by IntelliJ IDEA.
  User: 41688
  Date: 2019/6/5
  Time: 16:37
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
</head>
<script type="text/javascript">
    function tijiao(){
        //提交表单
        $("#memberCreat").submit();

    }
    function jdy_hide(){
        document.getElementById('jdy1').style.display='none';
        document.getElementById('jdy2').style.display='none';
    }
    function jdy_show(){
        document.getElementById('jdy1').style.display='block';
        document.getElementById('jdy2').style.display='block';
    }
</script>
<body class="content-pages-body">
<div class="content-pages-wrap">
    <div class="commonTitle">
        <h2>&gt;&gt; <a href="member-list.html">人员管理</a> - 人员创建</h2>
    </div>
    <div class="btnBar">
        <ul class="clearfix">
            <li><a href="#" title="通讯录" class="btnNormal">通讯录</a></li>
        </ul>
    </div>
    <table border="0" cellspacing="1" cellpadding="0" class="commonTable">
        <form id="memberCreat" name="memberCreat" action="/addStuff" method="post">
            <tr>
                <td width="12%" align="right"><span class="required">*</span>人员编码：</td>
                <td width="21%" align="left"><input name="id" type="text" class="inputTextNormal" id="textfield" /></td>
                <td width="12%" align="right"><span class="required">*</span>姓名：</td>
                <td width="21%" align="left"><input name="repmanname" type="text" class="inputTextNormal" id="textfield2" /></td>
                <td width="12%" align="right"><span class="required">*</span>性别：</td>
                <td align="left">
                    <input type="radio" name="gender" id="radio1" value="radio1" />
                    男
                    <input type="radio" name="gender" id="radio2" value="radio2" />
                    女</td>
            </tr>
            <tr>
                <td align="right"><span class="required">*</span>出生年月：</td>
                <td align="left"><input name="textfield3" type="text" class="inputTextNormal" id="textfield3" /></td>
                <td align="right">民族：</td>
                <td align="left"> <select  name="folk" id="select">
                    <%--不设置value 则是汉字--%>
                    <option>请选择</option>
                    <option>汉</option>
                    <option>其他</option>
                </select></td>
                <td align="right"><span class="required">*</span>政治面貌：</td>
                <td align="left"><select name="select" id="select">
                    <option>请选择</option>
                    <option>中共党员</option>
                    <option>团员</option>
                    <option>民族党派</option>
                    <option>群众</option>
                </select></td>
            </tr>
            <tr>
                <td width="12%" align="right">手机：</td>
                <td width="21%" align="left"><input name="mobile" type="text" class="inputTextNormal" id="textfield" /></td>
                <td width="12%" align="right">电话：</td>
                <td width="21%" align="left"><input name="textfield2" type="text" class="inputTextNormal" id="textfield2" /></td>
                <td width="12%" align="right">电子邮件：</td>
                <td align="left"><input name="textfield232" type="text" class="inputTextNormal" id="textfield232" /></td>
            </tr>
            <tr>
                <td align="right"><span class="required">*</span>学历：</td>
                <td align="left"><select name="select" id="select">
                    <option>请选择</option>
                    <option>博士</option>
                    <option>硕士</option>
                    <option>本科</option>
                    <option>大专</option>
                    <option>中专</option>
                    <option>高中</option>
                    <option>初中</option>
                    <option>无学历</option>
                </select></td>
                <td align="right">毕业学校：</td>
                <td align="left"><input name="textfield28" type="text" class="inputTextNormal" id="textfield28" /></td>
                <td align="right"> 所选专业：</td>
                <td align="left"><input name="textfield24" type="text" class="inputTextNormal" id="textfield24" /></td>
            </tr>
            <tr>
                <td align="right">所学专业类型：</td>
                <td align="left"> <select name="select" id="select">
                    <option>请选择</option>
                    <option>工程</option>
                    <option>法律</option>
                    <option>医药</option>
                    <option>公共卫生</option>
                    <option>无专业</option>
                    <option>其他专业</option>
                    <option>不详</option>
                </select></td>
                <td align="right">建所前从事专业：</td>
                <td align="left"><input name="textfield29" type="text" class="inputTextNormal" id="textfield29" /></td>
                <td align="right"><span class="required">*</span>何时参加工作：</td>
                <td align="left"><input name="textfield29" type="text" class="inputTextNormal" id="textfield29" /></td>
            </tr>
            <tr>
                <td align="right"><span class="required">*</span>职务：</td>
                <td align="left"><select name="select2" id="select2">
                    <option>请选择</option>
                    <option>所长</option>
                    <option>书记</option>
                    <option>副所长</option>
                    <option>副书记</option>
                    <option>主任(科长)</option>
                    <option>副主任(副科长)</option>
                    <option>科员</option>
                    <option>无</option>
                </select></td>
                <td align="right"><span class="required">*</span>职级：</td>
                <td align="left"><select name="select3" id="select3">
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
                <td align="right"><span class="required">*</span>职称：</td>
                <td align="left"> <select name="select5" id="select4">
                    <option>请选择</option>
                    <option>初级（医（技）师）</option>
                    <option>初级（助理政工师）</option>
                    <option>初级（助理工程师）</option>
                    <option>初级（助理会计师）</option>
                    <option>初级（研究实习员）</option>
                    <option>中级（主管（治）医（技）师）</option>
                    <option>中级（政工师）</option>
                    <option>中级（馆员）</option>
                    <option>中级（工程师）</option>
                    <option>中级（会计师）</option>
                    <option>副高（副主任医（技）师）</option>
                    <option>副高（高级政工师）</option>
                    <option>副高（高级会计师）</option>
                    <option>正高（主任医（技）师））</option>
                    <option>未聘任专业技术职务</option>
                    <option>无职称</option>
                </select></td>
            </tr>
            <tr>
                <td align="right">何时进卫生监督所：</td>
                <td align="left"><input name="textfield3" type="text" class="inputTextNormal" id="textfield3" /></td>
                <td align="right"><span class="required">*</span>人员性质：</td>
                <td align="left"><select name="select4">
                    <option>请选择</option>
                    <option>聘用制干部</option>
                    <option>聘用制工人</option>
                    <option>固定干部</option>
                    <option>固定工人</option>
                    <option>其他</option>
                </select></td>
                <td align="right">类别：</td>
                <td align="left"><input type="radio" name="radio" id="radio1" value="radio1" checked  onclick="jdy_show()"/>
                    监督人员
                    <input type="radio" name="radio" id="radio2" value="radio2"  onclick="jdy_hide()"/>
                    协查人员
                    <input type="radio" name="radio" id="radio2" value="radio2" onclick="jdy_hide()"/>
                    不详</td>
            </tr>
            <tr id="jdy1" style="display:block">
                <td align="right"><span class="required">*</span>行政执法证号：</td>
                <td align="left"><input name="textfield32" type="text" class="inputTextNormal" id="textfield32" /></td>
                <td align="right"><span class="required">*</span>何时取得行政执法证：</td>
                <td align="left"><input name="textfield27" type="text" class="inputTextNormal" id="textfield27" /></td>
                <td align="right"><span class="required">*</span>卫生监督胸牌号：</td>
                <td align="left"><input name="textfield26" type="text" class="inputTextNormal" id="textfield26" /></td>
                </td>
            </tr>
            <tr id="jdy2" style="display:block">
                <td align="right"><span class="required">*</span>何时取得卫生监督员资格：</td>
                <td align="left"><input name="textfield27" type="text" class="inputTextNormal" id="textfield27" /></td>
                <td align="right"><span class="required">*</span>目前持有有效的监督员证号：</td>
                <td align="left"><input name="textfield3" type="text" class="inputTextNormal" id="textfield3" /></td>
                <td align="right"><span class="required">*</span>目前所持有效监督员证的有效时间：</td>
                <td align="left"><input name="textfield26" type="text" class="inputTextNormal" id="textfield26" /></td>
            </tr>
            <tr>
                <td align="right"><span class="required">*</span>是否为在编人员：</td>
                <td align="left"><input type="radio" name="radio" id="radio1" value="radio1" />
                    是
                    <input type="radio" name="radio" id="radio2" value="radio2" />
                    否</td>
                <td align="right"></td>
                <td align="left"></td>
                <td align="right">&nbsp;</td>
                <td align="left">&nbsp;</td>
            </tr>

    </table>
    <!--//commonTable-->
    <div id="formPageButton">
        <ul>
            <li><a href="javascript:;" onclick="tijiao()" title="保存" class="btnShort">保存</a></li>
            <li><a href="javascript:window.history.go(-1)" title="返回" class="btnShort">返回</a></li>
        </ul>
    </div>
    </form>
    <!--//commonToolBar-->
</div>
<!--//content pages wrap-->
</body>
</html>


