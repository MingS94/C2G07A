<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.StudentInfo"%>
<%@page session="true" %>
<%@ include file="checkvalid.jsp"%>

<% 
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<jsp:useBean id="olReMgmt" scope="application" class="control.OLRegisterMgmt" />

<%
	StudentInfo info = (StudentInfo)session.getAttribute("studentInfo");
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的报名信息</title>
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
#form_ap {	position: absolute;
	left: 280px;
	top: 220px;
	width: 400px;
	height: 250px;
	z-index: 6;
}
#text_ap {	position: absolute;
	left: 50px;
	top: 200px;
	width: 140px;
	height: 30px;
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
  <pre><h1>自主招生网上报名</h1></pre>
  <p>&nbsp;</p>
</div>
<div id="form_ap">
<table width="400" border="0">
    <tr>
      <td width="80"><em><strong>考生姓名
      </strong></em></td>
      <td width="180">
       <%= info.getStudentName() %>
      </td>      
    </tr>
    
    <tr>
      <td width="80"><em><strong>考生性别
      </strong></em></td>
      <td width="180">
        <%= StudentInfo.getGenderString(info.getGender()) %>
      </td>      
    </tr>
    
    <tr>
      <td width="80"><em><strong>考生年龄
      </strong></em></td>
      <td width="180">
       <%= info.getAge() %>
      </td>      
    </tr>
    
    <tr>
      <td width="80"><em><strong>身份证号</strong> </em></td>
      <td width="180">
       <%= info.getIdCardNumber() %>
      </td>      
    </tr>
    
    <tr>
      <td width="80"><strong><em>生源地省份
      </em></strong></td>
      <td width="180">
      <%= info.getProvince() %>
      </td>      
    </tr>
    
    <tr>
      <td width="80"><strong><em>生源地县市</em></strong></td>
      <td width="180">
      <%= info.getRegion() %>
      </td>      
    </tr>
    
    <tr>
      <td width="80"><strong><em>毕业高中</em></strong></td>
      <td width="180">
      <%= info.getGraduateSchool() %>
      </td>      
    </tr>
    
    <tr>
      <td width="80"><strong><em>高考报名号</em></strong></td>
      <td width="180">
      <%= info.getExamPermitNumber() %>
      </td>      
    </tr>
    
    <tr>
      <td width="80"><strong><em>报考类型
      </em></strong></td>
      <td width="180">
      <%= StudentInfo.getCategoryString(info.getCategory()) %>
      </td>      
    </tr>
    
    <tr>
      <td width="80"><strong><em>考点</em></strong></td>
      <td width="180">
      <%= info.getLocation() %>
      </td>      
    </tr>
    
    <tr>
      <td width="80"><strong><em>电话</em></strong></td>
      <td width="180">
      <%= info.getPhoneNumber() %>
      </td>      
    </tr>
    
    <tr>
      <td width="80"><strong><em>电子邮箱
      </em></strong></td>
      <td width="180">
      <%= info.getE_mail() %>
      </td>      
    </tr>
    
    <tr>
      <td width="80"><strong><em>家庭住址
      </em></strong></td>
      <td width="180">
      <%= info.getAddress() %>
      </td>      
    </tr>
    
    <tr>
      <td width="80"></td>
      <td width="80"></td>            
    </tr>  
  </table>   
</div>
<div id="text_ap"> <strong>查看报名信息</strong></div>
</body>
</html>