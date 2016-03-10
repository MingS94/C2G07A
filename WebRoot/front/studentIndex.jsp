<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.StudentInfo"%>
<%@page session="true" %>
<%@ include file="checkvalid.jsp"%>

<% 
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<%
	StudentInfo info = (StudentInfo)session.getAttribute("studentInfo");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>自主招生网上报名系统</title>
<style type="text/css">
#homePicture_ap {position: absolute;
	left: 15px;
	top: 20px;
	width: 320px;
	height: 100px;
	z-index: 2;
}
#homeTitle_ap {position: absolute;
	left: 620px;
	top: 20px;
	width: 230px;
	height: 100px;
	z-index: 3;
}
#apDiv1 {
	position: absolute;
	left: 150px;
	top: 200px;
	width: 1000px;
	height: 50px;
	z-index: 4;
}
#apDiv2 {
	position: absolute;
	left: 150px;
	top: 250px;
	width: 200px;
	height: 50px;
	z-index: 4;
}

#apDiv3 {
	position: absolute;
	left: 150px;
	top: 300px;
	width: 200px;
	height: 50px;
	z-index: 4;
}
#apDiv4 {
	position: absolute;
	left: 150px;
	top: 350px;
	width: 200px;
	height: 50px;
	z-index: 4;
}
#apDiv5 {
	position: absolute;
	left: 150px;
	top: 400px;
	width: 200px;
	height: 50px;
	z-index: 4;
}
#touxiang_ap {
	position: absolute;
	left: 550px;
	top: 230px;
	width: 230px;
	height: 200px;
	z-index: 5;
}
#apDiv6 {position: absolute;
	left: 1023px;
	top: 44px;
	width: 139px;
	height: 67px;
	z-index: 5;
}
</style>
</head>

<body>
<div id="homePicture_ap"><img src="../images/u26.jpg" alt="" width="600" height="130" /></div>
<div id="homeTitle_ap">
  <h1>2015年</h1>
  <pre><h1>自主招生网上报名</h1></pre>
  <p>&nbsp;</p>
</div>
<%
	if (info.isState())
	{
	
%>
<div id="apDiv1">
  <h2>您已经报名成功，请查看相关信息</h2>
</div>
<div id="apDiv2">
  <h2><a href="myInformation.jsp"><strong>我的报名信息</strong></a></h2>
</div>
<%
	}
	else
	{
%>
<div id="apDiv1">
  <h2>您还未报名，请点击申请报名</h2>
</div>
<div id="apDiv2">
  <h2><a href="signUpInformation.jsp"><strong>申请报名</strong></a></h2>
</div>
<%
	}
%>
<div id="apDiv3">
  <h2><a href="myTestPort.jsp"><strong>我的考场</strong></a></h2>
</div>
<div id="apDiv4">
  <h2><a href="myGrade.jsp"><strong>我的成绩</strong></a></h2>
</div>
<div id="apDiv5">
  <h2><a href="studentPassword.jsp"><strong>密码管理</strong></a></h2>
</div>
<div id="touxiang_ap"><img src="../images/touxiang2.jpg" width="200" height="180" /></div>
<div id="apDiv6">
 <form id="logoutForm" name="logouyForm" method="post" action="logout.jsp">
  <input type="submit" style="height:40px;width:100px" name="logout" id="logout" value="注销退出" />
 </form>
</div>
<h2>&nbsp;</h2>
</body>
</html>