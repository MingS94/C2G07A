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
<title>系统设置</title>
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
	left: 72px;
	top: 217px;
	width: 380px;
	height: 236px;
	z-index: 4;
}
#apDiv2 {
	position: absolute;
	left: 1023px;
	top: 44px;
	width: 139px;
	height: 67px;
	z-index: 5;
}
#apDiv3 {
	position: absolute;
	left: 588px;
	top: 212px;
	width: 416px;
	height: 198px;
	z-index: 6;
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
<div id="apDiv1">
  <form id="form1" name="form1" method="post" action="systemCtrl.jsp">
    <select name="loginSwitch" id="loginSwitch">
            <option selected="selected" value="前台登录开关">前台登录开关</option>
            <option value="开">开</option>
            <option value="关">关</option>
    </select>
    <hr />       
    <select name="registerSwitch" id="registerSwitch">
      <option selected="selected" value="前台注册开关">前台注册开关</option>
            <option value="开">开</option>
            <option value="关">关</option>
    </select>
    <hr />
    <input type="submit" name="confirm" id="confirm" value="确认提交" />
  </form>
</div>
<div id="apDiv2">
 <form id="backForm" name="backForm" method="post" action="backIndex.jsp">
  <input type="submit" style="height:40px;width:100px" name="back" id="back" value="返回" />
 </form>
</div>
<div id="apDiv3">
  <form id="form2" name="form2" method="post" action="transport.jsp">
    <p>
    移动服务器URL：</p>
    <p>
  <input type="text" name="urlAddress" id="urlAddress" />
    </p>
    <p>
      <input type="submit" name="dataSync" id="dataSync" value="数据同步" onClick=transport() />
    </p>
  </form>
</div>
</body>
<script>
function transport()
{
	alert("数据同步完成!");
}
</script>
</html>