<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.StudentInfo"%>
<%@ include file="checkvalid.jsp"%>
<% 
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="olReMgmt" scope="application" class="control.OLRegisterMgmt" />
<%
	StudentInfo info = (StudentInfo)session.getAttribute("studentInfo");
	if (info != null && request.getParameter("confirm_button") != null)
	{
		//获取旧密码
    	String oldPassword = request.getParameter("oldPassword_input");
		//获取新密码
    	String newPassword = request.getParameter("newPassword_input");
		//获取二次新密码
    	String reNewPassword = request.getParameter("reNewPassword_input");	
    	if (oldPassword != null && oldPassword.equals(info.getPassword()))
    	{
    		boolean res = olReMgmt.changePassword(info.getRegistrationNumber(), newPassword, reNewPassword);
    		if (res)
    		{
    			info.setPassword(newPassword);
%>
<script>alert("密码修改成功！");window.location.href="studentIndex.jsp";</script>
<%     			
    		}
    		else
    		{
%>
<script>alert("修改失败！");history.back();</script>
<%
    		}
    	}
    	else
    	{
%>
<script>alert("原密码不正确！");history.back();</script>
<%
    	}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>密码管理</title>
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
	left: 133px;
	top: 205px;
	width: 327px;
	height: 310px;
	z-index: 4;
}
#apDiv2 {position: absolute;
	left: 1023px;
	top: 44px;
	width: 139px;
	height: 67px;
	z-index: 5;
}
</style>
</head>

<body>
<div id="apDiv2">
 <form id="backForm" name="backForm" method="post" action="studentIndex.jsp">
  <input type="submit" style="height:40px;width:100px" name="back" id="back" value="返回" />
 </form>
</div>
<div id="homePicture_ap"><img src="../images/u26.jpg" alt="" width="600" height="130" /></div>
<div id="homeTitle_ap">
  <h1>2015年</h1>
  <pre><h1>自主招生网上报名</h1>
  </pre>
  <p>&nbsp;</p>
</div>
<div id="apDiv1">
<form id="studentPassword" name="studentPassword" method="post" action="studentPassword.jsp">
    <div id="oldPassword" name="oldPassword">旧密码&nbsp;&nbsp;&nbsp;&nbsp;
      <input id="oldPassword_input" name="oldPassword_input" type="password" value=""/>
    </div>
    <div id="newPassword" name="newPassword">新密码&nbsp;&nbsp;&nbsp;&nbsp;
      <input id="newPassword_input" name="newPassword_input" type="password" value=""/>
    </div>
     <div id="reNewPassword" name="reNewPassword">确认新密码
      <input id="reNewPassword_input" name="reNewPassword_input" type="password" value=""/>
    </div>
    <br/>
    <div id="confirm_bu">
      <input style="width:90px; height:30px" type="submit" name="confirm_button" id="confirm_button" value="确认修改" />
    </div>
</form>
</div>
</body>
</html>