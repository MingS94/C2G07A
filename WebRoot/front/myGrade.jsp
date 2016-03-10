<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.StudentInfo"%>
<%@page import="model.Score"%>
<%@page session="true" %>
<%@ include file="checkvalid.jsp"%>
<% 
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="olReMgmt" scope="application" class="control.OLRegisterMgmt" />

<%
	StudentInfo info = (StudentInfo)session.getAttribute("studentInfo");
	LinkedList<Score> scoreList = olReMgmt.checkScore(info);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的成绩</title>
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
#text_ap {position: absolute;
	left: 50px;
	top: 200px;
	width: 140px;
	height: 30px;
	z-index: 4;
}
#apDiv1 {
	position: absolute;
	left: 280px;
	top: 240px;
	width: 500px;
	height: 300px;
	z-index: 5;
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
<div id="homePicture_ap"><img src="../images/u26.jpg" alt="" width="600" height="130" /></div>
<div id="homeTitle_ap">
  <h1>2015年</h1>
  <pre><h1>自主招生网上报名</h1>
  </pre>
  <p>&nbsp;</p>
</div>
<div id="text_ap"> <strong>查看我的分数</strong></div>
<div id="apDiv1">
  <table width="500" border="0">
        <tr>
      <td><strong><em>序号</em></strong></td>
      <td><em><strong>考试科目</strong></em></td>
      <td><em><strong>第一印象分</strong></em></td>
      <td><em><strong>最终分数</strong></em></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
<%
	int i = 1;
	for (Score s : scoreList)
	{
%>    
    <tr>
      <td><%= i %></td>
      <td><%= s.getSubjectName() %></td>
      <td><%= s.getFistPoint() %></td>
      <td><%= s.getFinalPoint() %></td>
    </tr>
<%
		i++;
	}
%>
  </table>
</div>
<div id="apDiv2">
  <form id="backForm" name="backForm" method="post" action="studentIndex.jsp">
   <input type="submit" style="height:40px;width:100px" name="back" id="back" value="返回" />
  </form>
</div>
</body>
</html>