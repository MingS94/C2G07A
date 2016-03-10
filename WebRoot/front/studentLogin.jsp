<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<jsp:useBean id="adminMgmt" scope="application" class="control.AdminControl" />
<% 
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	
	if (!adminMgmt.getLoginState())
	{
		response.sendRedirect("loginClosed.jsp");
        return;
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	
	<title>华东师范大学自主招生网上报名系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#registerButton_ap {
	position: absolute;
	left: 415px;
	top: 213px;
	width: 76px;
	height: 39px;
	z-index: 1;
}
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
#registerWord_ap {
	position: absolute;
	left: 55px;
	top: 171px;
	width: 227px;
	height: 51px;
	z-index: 4;
}
#middleLine_ap {
	position: absolute;
	left: 7px;
	top: 305px;
	width: 1108px;
	height: 17px;
	z-index: 5;
}
#apDiv1 {
	position: absolute;
	left: 58px;
	top: 347px;
	width: 135px;
	height: 31px;
	z-index: 6;
}
#logInWord_ap {
	position: absolute;
	left: 55px;
	top: 357px;
	width: 210px;
	height: 101px;
	z-index: 6;
}
#apDiv6 {
	position: absolute;
	left: 338px;
	top: 358px;
	width: 193px;
	height: 178px;
	z-index: 7;
}
#logInForm_ap {
	position: absolute;
	left: 415px;
	top: 353px;
	width: 201px;
	height: 145px;
	z-index: 7;
}
#apDiv2 {
	position: absolute;
	left: 599px;
	top: 465px;
	width: 92px;
	height: 20px;
	z-index: 8;
}
#apDiv3 {
	position: absolute;
	left: 361px;
	top: 599px;
	width: 567px;
	height: 328px;
	z-index: 9;
}
#apDiv4 {
	position: absolute;
	left: 251px;
	top: 602px;
	width: 108px;
	height: 95px;
	z-index: 10;
}
</style>
</head>

<body>
<div id="registerButton_ap">
  <input style="width:90px; height:30px" type="button" name="registerButton" id="registerButton" value="注册" onClick=locate('register.jsp') />
</div>

<div id="homePicture_ap"><img src="../images/u26.jpg" width="600" height="130" /></div>
<div id="homeTitle_ap">
  <h1>2015年</h1>
  <pre><h1>自主招生网上报名</h1>
  </pre>
  <p>&nbsp;</p>
</div>
<div id="registerWord_ap">
  <p><strong>还没有报名号？</strong></p>
  <p><strong>请注册</strong></p>
</div>
<div id="middleLine_ap">
  <hr />
</div>
<div id="logInWord_ap">
  <p><strong>若已注册，请登录</strong></p>
  <p><strong></strong></p>
</div>
<div id="logInForm_ap">
  <form id="logIn_form" name="logIn_form" method="post" action="checkLogin.jsp">
     <div id="uID" name="uID">报名号
       <input id="uID_input" name="uID_input" type="text" value=""/>
     </div>

     <div id="uPassword" name="uPassword">密码&nbsp;&nbsp;
       <input id="uPassword_input" name="uPassword_input" type="password" value=""/>
     </div>
     
     <div id="identifyNum" name="identifyNum">验证码
       <input id="identifyNum_input" name="identifyNum_input" type="text" value=""/>
     </div>
      
     <div id="logIN_bu">
        <input style="width:90px; height:30px" type="submit" name="logIN_button" id="logIN_button" value="登录" />
     </div>
  </form>
  <p>&nbsp;</p>
</div>
<div id="apDiv2"><img src="../images/identiNum.jpg" width="50" height="21" /></div>
<div id="apDiv3"><img src="file:///C|/Users/Cui/Desktop/Src-ZiZhuZhaoShengA11/ZiZhuZhaoShengA11/WebRoot/images/studentLogin_GSQG7CZ[YAC1]6C%H}5BJ1F.png" width="441" height="538" /></div>
<div id="apDiv4"><strong>流程图</strong></div>
<div align="center"></div>
</body>
<script>
function locate(url)
{
	window.location.href=url;
}
</script>
</html>