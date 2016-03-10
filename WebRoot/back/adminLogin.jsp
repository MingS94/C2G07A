<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<% 
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	
	<title>华东师范大学自主招生后台管理系统</title>
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
</style>
</head>

<body>

<div id="homePicture_ap"><img src="../images/u26.jpg" width="600" height="130" /></div>
<div id="homeTitle_ap">
  <h1>2015年</h1>
  <pre><h1>自主招生后台管理系统</h1></pre>
  </pre>
  <p>&nbsp;</p>
</div>

<div id="middleLine_ap">
  <hr />
</div>
<div id="logInForm_ap">
  <form id="logIn_form" name="logIn_form" method="post" action="checkLogin.jsp">
     <div id="uID" name="uID">管理员账号
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
<div align="center"></div>
</body>

</html>