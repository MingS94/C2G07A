<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page session="true" %>
<%@ include file="checkvalid.jsp"%>

<% 
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>华东师范大学自主招生后台管理</title>
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
#apDiv1 {
	position: absolute;
	left: 100px;
	top: 200px;
	width: 300px;
	height: 100px;
	z-index: 4;
}
#apDiv2 {
	position: absolute;
	left: 100px;
	top: 300px;
	width: 300px;
	height: 100px;
	z-index: 5;
}
#apDiv3 {
	position: absolute;
	left: 100px;
	top: 400px;
	width: 300px;
	height: 100px;
	z-index: 6;
}
#apDiv4 {
	position: absolute;
	left: 100px;
	top: 500px;
	width: 300px;
	height: 100px;
	z-index: 7;
}
#apDiv5 {
	position: absolute;
	left: 100px;
	top: 600px;
	width: 300px;
	height: 100px;
	z-index: 8;
}
#apDiv6 {
	position: absolute;
	left: 100px;
	top: 700px;
	width: 300px;
	height: 100px;
	z-index: 9;
}
#apLogout {position: absolute;
	left: 1023px;
	top: 44px;
	width: 139px;
	height: 67px;
	z-index: 5;
}
</style>
</head>

<body>

<div id="apLogout">
 <form id="logoutForm" name="logoutForm" method="post" action="logout.jsp">
  <input type="submit" style="height:40px;width:100px" name="logout" id="logout" value="注销退出" />
 </form>
</div>

<div id="homePicture_ap"><img src="../images/u26.jpg" width="600" height="130" /></div>
<div id="homeTitle_ap">
  <h1>2015年</h1>
  <pre><h1>自主招生后台管理系统</h1></pre>
  <p>&nbsp;</p>
</div>
<div id="apDiv1">
  <h2><a href="systemSet.jsp"><strong>系统设置</strong></a></h2>
</div>
<div id="apDiv2">
<h2><a href="testPort.jsp"><strong>考试信息管理</strong></a></h2></div>
<div id="apDiv3">
<h2><a href="studentManage.jsp"><strong>考生信息管理</strong></a></h2></div>
<div id="apDiv4">
<h2><a href="professorManage.jsp"><strong>专家信息管理</strong></a></h2></div>
<div id="apDiv5">
<h2><a href="gradeManage.jsp"><strong>成绩信息管理</strong></a></h2></div>
<div id="apDiv6">
  <h2><a href="assembleStudent.jsp"><strong>分配学生专家</strong></a></h2>
</div>
</body>
</html>