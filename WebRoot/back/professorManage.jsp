<%@page import="model.Expert"%>
<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page session="true" %>

<%@ include file="checkvalid.jsp"%>

<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="expertMgmt" scope="application" class="control.ExperMgmt" />
<%	
	LinkedList<Expert> expertsList = (LinkedList<Expert>)request.getAttribute("ExpertsList");
	if (expertsList == null) 
	{
		expertsList = expertMgmt.queryExpertsInfo(null, null, null);
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>专家信息管理</title>
<style type="text/css">
#homePicture_ap {position: absolute;
	left: 15px;
	top: 20px;
	width: 319px;
	height: 111px;
	z-index: 2;
}
#homeTitle_ap {position: absolute;
	left: 620px;
	top: 20px;
	width: 230px;
	height: 121px;
	z-index: 3;
}
#form_ap {	position: absolute;
	left: 30px;
	top: 160px;
	width: 400px;
	height: 200px;
	z-index: 6;
}
#text_ap {position: absolute;
	left: 40px;
	top: 410px;
	width: 140px;
	height: 30px;
	z-index: 4;
}
#apDiv1 {
	position: absolute;
	left: 30px;
	top: 660px;
	width: 1100px;
	height: 300px;
	z-index: 5;
}
#apDiv2 {
	position: absolute;
	left: 44px;
	top: 610px;
	width: 140px;
	height: 30px;
	z-index: 6;
}
#apDiv3 {
	position: absolute;
	left: 30px;
	top: 460px;
	width: 1050px;
	height: 100px;
	z-index: 7;
}
#apDiv4 {position: absolute;
	left: 1023px;
	top: 44px;
	width: 139px;
	height: 67px;
	z-index: 5;
}
</style>
</head>

<body>
<div id="homePicture_ap"><img src="../images/u26.jpg" width="600" height="130" /></div>
<div id="homeTitle_ap">
  <h1>2015年</h1>
  <pre><h1>自主招生后台管理系统</h1></pre>
  <p>&nbsp;</p>
</div>
<div id="form_ap">
  <form id="search_ap" name="search_ap" method="post" action="professorSearch.jsp">
    <h2><strong>专家信息检索</strong> <br/>
    </h2>
    <table width="400" border="0">
      <tr>
        <td width="80">证件号</td>
        <td width="180"><div id="number" style="width:160px; height:27px">
          <input id="number_input" name="number_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80">专家姓名 </td>
        <td width="180"><div id="uName" style="width:160px; height:27px">
          <input id="expertName_input" name="expertName_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80">研究方向 </td>
        <td width="180"><div id="fangxiang" style="width:160px; height:27px">
          <input id="major_input" name="major_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80"></td>
        <td width="80"><div id="logIN_bu">
          <input style="width:90px; height:30px" type="submit" name="search_button" id="search_button" value="确认查询" />
        </div></td>
      </tr>
    </table>
  </form>
</div>
<div id="apDiv2">
  <h3><strong>专家信息表</strong></h3>
</div>
<div id="apDiv1">
  <table width="1100" border="0">
    <tr>
      <td width="58"><em><strong>序号</strong></em></td>
      <td width="75"><strong><em>用户名</em></strong></td>
      <td width="81"><em><strong>密码</strong></em></td>
      <td width="81"><em><strong>证件号</strong></em></td>
      <td width="85"><em><strong>专家姓名</strong></em></td>
      <td width="76"><em><strong>研究方向</strong></em></td>
      <td width="61"><em><strong>电话</strong></em></td>
      <td width="68"><strong><em>邮箱</em></strong></td>
      <td width="63"><strong><em>操作</em></strong></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
<%
	int i = 1;
	for (Expert expert : expertsList)
	{
%>
    <tr>
      <td><%= i %></td>
      <td><%= expert.getUsername() %></td>
      <td><%= expert.getPassword() %></td>
      <td><%= expert.getCertificateID() %></td>
      <td><%= expert.getExpertName() %></td>
      <td><%= expert.getMajorIn() %></td>
      <td><%= expert.getMobilePhone() %></td>
      <td><%= expert.getEmail() %></td>
      <td><a href="professorCtrl.jsp?deleteId=<%= expert.getExpertID() %>">删除</a></td>
    </tr>
<%
		i++;
	}
%>
  </table>
</div>
<div id="text_ap">
  <h3><strong>操作区域</strong></h3>
</div>
<div id="apDiv3">
<form id="addForm" name="addForm" method="post" action="professorCtrl.jsp">
 <table width="1000" border="0">
    <tr>
      <td width="120"><strong><em>用户名</em></strong></td>
      <td width="120"><em><strong>密码</strong></em></td>
      <td width="120"><em><strong>证件号</strong></em></td>
      <td width="120"><em><strong>专家姓名</strong></em></td>
      <td width="120"><em><strong>研究方向</strong></em></td>
      <td width="120"><em><strong>电话</strong></em></td>
      <td width="120"><strong><em>邮箱</em></strong></td>
      <td width="62"><strong><em>操作</em></strong></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><input type="text" style="width:120px;height:20px" name="uName_input" id="uName_input" value="" /></td>
      <td><input type="text" style="width:120px;height:20px" name="uPassword_input" id="uPassword_input" value="" /></td>
      <td><input type="text" style="width:120px;height:20px" name="identifyNum_input" id="identifyNum_input" value="" /></td>
      <td><input type="text" style="width:120px;height:20px" name="professorName_input" id="professorName_input" value="" /></td>
      <td><input type="text" style="width:120px;height:20px" name="fangxiang_input" id="fangxiang_input" value="" /></td>
      <td><input type="text" style="width:120px;height:20px" name="telephoneNum_input" id="telephoneNum_input" value="" /></td>
      <td><input type="text" style="width:120px;height:20px" name="email_input" id="email_input" value="" /></td>
      <td>
        <input type="submit" name="addExpert" id="addExpert" value="添加" />
      </td>
    </tr>
  </table>
</form>
</div>
<div id="apDiv4">
 <form id="backForm" name="backForm" method="post" action="backIndex.jsp">
  <input type="submit" style="height:40px;width:100px" name="back" id="back" value="返回" />
 </form>
</div>
</body>
</html>