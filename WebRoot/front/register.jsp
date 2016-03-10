<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.StudentInfo.Category"%>
<%@page import="control.*" %>
<%@page import="model.*" %>
<%@page session="true" %>

<jsp:useBean id="olReMgmt" scope="application" class="control.OLRegisterMgmt" />
<jsp:useBean id="adminMgmt" scope="application" class="control.AdminControl" />

<% 
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	
	if (!adminMgmt.getRegistState())
	{
		response.sendRedirect("registClosed.jsp");
        return;
	}
%>

<%
	if (request.getParameter("register_button") != null)
	{
		//获取身份证
    	String IDCardNumber = request.getParameter("uIdentifyNum_input");
    	//获取报名号
    	String examPermitNumber = request.getParameter("baominghao_input");
		//获取考试类别
    	String categoryString = request.getParameter("testSubject_input");
    	
    	Category category = StudentInfo.getCategory(categoryString);
    	
    	if (IDCardNumber != null && examPermitNumber != null && categoryString != null && category != null) 
    	{
    		String  registrationNumber = olReMgmt.verifyIdentity(examPermitNumber, IDCardNumber, category);
    		//默认密码为身份证后六位
    		boolean res = olReMgmt.register(registrationNumber, OLRegisterMgmt.cut6IdCardNumber(IDCardNumber), OLRegisterMgmt.cut6IdCardNumber(IDCardNumber));
    		if (registrationNumber != null && !registrationNumber.equals("") && res)
    		{
    			request.setAttribute("registrationNumber", registrationNumber);
    			request.setAttribute("IDCardNumber", IDCardNumber);
    			//response.sendRedirect("registerSuccess.jsp");//使用该方法request得不到数据
%>
<jsp:forward page="registerSuccess.jsp" />
<%
    		}
    		else
    		{
%>
<script>alert("注册失败，请重新注册！");history.back();</script>
<%
    		} 
    	}
    	else
    	{
%>
<script>alert("信息填写错误！");history.back();</script>
<%
    	}
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>注册报名号</title>
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
#headline_ap {
	position: absolute;
	left: 70px;
	top: 160px;
	width: 180px;
	height: 40px;
	z-index: 4;
}
#item_ap {
	position: absolute;
	left: 70px;
	top: 250px;
	width: 180px;
	height: 200px;
	z-index: 5;
}
#apDiv2 {
	position: absolute;
	left: 250px;
	top: 250px;
	width: 180px;
	height: 160px;
	z-index: 6;
}
#apDiv {position: absolute;
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
<div id="headline_ap">
  <h2><strong>注册报名号</strong></h2>
</div>
<div id="item_ap">
  <table border="0" width="180">
    <tr>
      <td>高考报名号</td>
    </tr>
    <tr>
      <td>身份证号</td>
    </tr>
    <tr>
      <td>报考类型</td>
    </tr>
  </table>
</div>
<div id="apDiv2">
  <form id="register_form" name="register_form" method="post" action="register.jsp">
    <label for="register_form"></label>

    <div id="baominghao" style="width:160px; height:27px">
        <input id="baominghao_input" name="baominghao_input" type="text" value=""/>
    </div>
    <div id="uIdentifyNum" style="width:160px; height:27px">
        <input id="uIdentifyNum_input" name="uIdentifyNum_input" type="text" value=""/>
    </div>
    <div id="testSubject" style="width:160px; height:27px">
    <select name="testSubject_input" id="testSubject_input">
      <option selected value="选择报考类型">选择报考类型</option>
          <option value="推荐生">推荐生</option>
          <option value="艺术特长生">艺术特长生</option>
          <option value="高水平运动员">高水平运动员</option>
          <option value="插班生">插班生</option>
          <option value="音乐学">音乐学</option>
          <option value="美术学">美术学</option>
          <option value="播音与主持艺术">播音与主持艺术</option>
    </select>
    </div>
    <hr />
    <div id="register_bu">
        <input style="width:90px; height:30px" type="submit" name="register_button" id="register_button" value="注册" />
    </div>
  </form>
</div>
<div id="apDiv">
 <form id="backForm" name="backForm" method="post" action="studentLogin.jsp">
  <input type="submit" style="height:40px;width:100px" name="back" id="back" value="返回" />
 </form>
</div>
</body>
</html>