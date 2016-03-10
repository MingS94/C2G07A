<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="control.OLRegisterMgmt"%>

<% 
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>
<%
    //获取身份证和报名号
    String IDCardNumber = (String)request.getAttribute("IDCardNumber");
    String registrationNumber = (String)request.getAttribute("registrationNumber");
    if (IDCardNumber == null)
    {
    	IDCardNumber = "-1";
    }
    if (registrationNumber == null)
    {
    	registrationNumber = "-1";
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>注册成功</title>
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
#text1_ap {
	position: absolute;
	left: 299px;
	top: 170px;
	width: 210px;
	height: 60px;
	z-index: 4;
}
#text2_ap {
	position: absolute;
	left: 145px;
	top: 280px;
	width: 186px;
	height: 83px;
	z-index: 5;
}
#form_ap {
	position: absolute;
	left: 1018px;
	top: 84px;
	width: 157px;
	height: 86px;
	z-index: 6;
}
#apDiv1 {
	position: absolute;
	left: 346px;
	top: 403px;
	width: 421px;
	height: 70px;
	z-index: 7;
	background-color: #CCCCCC;
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
<div id="homeTitle_ap">
  <h1>2015年</h1>
  <pre><h1>自主招生网上报名</h1>
  </pre>
  <p>&nbsp;</p>
</div>
<div id="homePicture_ap"><img src="../images/u26.jpg" alt="" width="600" height="130" /></div>
<div id="text1_ap">
  <h1><strong>注册成功</strong></h1>
</div>
<table>
<tr>
<td>
<div id="text2_ap">
  <h2><strong><pre>您的报名号是：<%= registrationNumber %></pre></strong></h2>
</div>
</td>
<td><div id="apDiv2">
 <form id="backForm" name="backForm" method="post" action="studentLogin.jsp">
  <input type="submit" style="height:40px;width:100px" name="back" id="back" value="返回登录界面" />
 </form>
</div></td>
</tr>
</table>
<div id="apDiv1">
  <h2><em><strong>初始密码为您的身份证后六位：<%= OLRegisterMgmt.cut6IdCardNumber(IDCardNumber) %></strong></em></h2>
</div>
</body>
</html>