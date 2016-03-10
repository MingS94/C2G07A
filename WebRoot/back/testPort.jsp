<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.Exam"%>
<%@page import="model.Room"%>
<%@page import="model.StudentInfo"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page session="true" %>
<%@ include file="checkvalid.jsp"%>
<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="examMgmt" scope="application" class="control.ExamMgmt" />

<%
	LinkedList<Exam> examsList = examMgmt.listExams();
	LinkedList<Room> roomsList = examMgmt.getRooms();
	DateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>考试设置</title>
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

#text_ap {
	position: absolute;
	left: 30px;
	top: 180px;
	width: 150px;
	height: 30px;
	z-index: 4;
}
#apDiv2 {
	position: absolute;
	left: 30px;
	top: 380px;
	width: 140px;
	height: 30px;
	z-index: 6;
}
#apDiv1 {
	position: absolute;
	left: 23px;
	top: 430px;
	width: 550px;
	height: 300px;
	z-index: 5;
}
#apDiv3 {
	position: absolute;
	left: 20px;
	top: 230px;
	width: 550px;
	height: 90px;
	z-index: 7;
}
#apDiv4 {
	position: absolute;
	left: 750px;
	top: 180px;
	width: 150px;
	height: 35px;
	z-index: 8;
}
#apDiv5 {
	position: absolute;
	left: 740px;
	top: 230px;
	width: 500px;
	height: 90px;
	z-index: 9;
}
#apDiv6 {
	position: absolute;
	left: 750px;
	top: 380px;
	width: 200px;
	height: 30px;
	z-index: 10;
}
#apDiv7 {
	position: absolute;
	left: 740px;
	top: 430px;
	width: 515px;
	height: 293px;
	z-index: 11;
}
#apDiv8 {position: absolute;
	left: 1023px;
	top: 44px;
	width: 139px;
	height: 67px;
	z-index: 5;
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
<div id="text_ap">
  <h3><strong>考试操作区域</strong></h3>
</div>
<div id="apDiv2">
  <h3><strong>考试信息表</strong></h3>
</div>
<div id="apDiv1">
  <table width="540" border="0">
    <tr>
      <td width="73"><strong><em>序号</em></strong></td>
      <td width="54"><em><strong>科目</strong></em></td>
      <td width="54"><em><strong>考点</strong></em></td>
      <td width="70"><em><strong>报考类型</strong></em></td>
      <td width="82"><em><strong>考试时间</strong></em></td>
      <td width="50"><strong><em>教室</em></strong></td>
      <td width="67"><strong><em>操作</em></strong></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
<%
	int i = 1;
	for (Exam exam : examsList)
	{
%>
    <tr>
      <td><%= i %></td>
      <td><%= exam.getSubjectName() %></td>
      <td><%= exam.getRoom().getLocation() %></td>
      <td><%= StudentInfo.getCategoryString(exam.getCategory()) %></td>
      <td><%= dtFormat.format(exam.getDatetime()) %></td>
      <td><%= exam.getRoom().getRoomName() %></td>
      <td><a href="testPortCtrl.jsp?deleteId=<%= exam.getExamId() %>">删除</a></td>
    </tr>
<%
		i++;
	}
%>
  </table>
</div>

<div id="apDiv3">
 <form id="form1" name="form1" method="post" action="testPortCtrl.jsp">
  <table width="523" border="0">
    <tr>
      <td width="80"><em><strong>科目</strong></em></td>
      <td width="84"><em><strong>考点</strong></em></td>
      <td width="123"><em><strong>报考类型</strong></em></td>
      <td width="80"><em><strong>考试时间</strong></em></td>
      <td width="80"><strong>教室</strong></td>
      <td width="50"><strong><em>操作</em></strong></td>
      </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      </tr>
    <tr>
      <td><input type="text" style="width:80px;height:20px"  name="subject_input" id="subject_input" value="" /></td>
      <td><select name="testPort_input" id="testPort_input">
            <option selected="selected" value="选择考点">选择考点</option>
            <option value="上海考点">上海考点</option>
            <option value="浙江考点">浙江考点</option>
            <option value="江苏考点">江苏考点</option>
            <option value="安徽考点">安徽考点</option>
            <option value="山东考点">山东考点</option>
            <option value="福建考点">福建考点</option>
          </select></td>
      <td><select name="category_input" id="category_input">
            <option selected="selected" value="选择报考类型">选择报考类型</option>
            <option value="推荐生">推荐生</option>
            <option value="艺术特长生">艺术特长生</option>
            <option value="高水平运动员">高水平运动员</option>
            <option value="插班生">插班生</option>
            <option value="音乐学">音乐学</option>
            <option value="美术学">美术学</option>
            <option value="播音与主持艺术">播音与主持艺术</option>
          </select></td>
      <td><input type="text" style="width:80px;height:20px"   name="testTime_input" id="testTime_input" value="" /></td>
      <td><input type="text" style="width:80px;height:20px"  name="room_input" id="room_input" value="" /></td>
      <td><input type="submit" name="add" id="add" value="增加" /></td>
      </tr>
  </table>
 </form>
</div>
<div id="apDiv4">
  <h3><strong>教室操作区域</strong></h3>
</div>
<div id="apDiv5">
 <form id="form2" name="form2" method="post" action="roomCtrl.jsp">
  <table width="262" border="0">
    <tr>
      <td width="84"><em><strong>考点</strong></em></td>
      <td width="79"><em><strong>容纳人数</strong></em></td>
      <td width="38"><strong><em>教室名称</em></strong></td>
      <td width="43"><strong><em>操作</em></strong></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><select name="testPort_input2" id="testPort_input2">
        <option selected="selected" value="选择考点">选择考点</option>
        <option value="上海考点">上海考点</option>
        <option value="浙江考点">浙江考点</option>
        <option value="江苏考点">江苏考点</option>
        <option value="安徽考点">安徽考点</option>
        <option value="山东考点">山东考点</option>
        <option value="福建考点">福建考点</option>
      </select></td>
      <td><input type="text"  style="width:80px;height:20px"  name="roomCapacity_input" id="roomCapacity_input" value="" /></td>
      <td><input type="text" style="width:80px;height:20px"  name="roomName_input" id="roomName_input" value="" /></td>
      <td><input type="submit" style="width:80px;height:20px"  name="add2" id="add2" value="增加" /></td>
    </tr>
  </table>
 </form>
</div>
<div id="apDiv6">
  <h3><strong>教室信息表</strong></h3>
</div>
<div id="apDiv7">
  <table width="498" border="0">
    <tr>
      <td width="123"><strong><em>序号</em></strong></td>
      <td width="102"><em><strong>考点</strong></em></td>
      <td width="87"><em><strong>容纳人数</strong></em></td>
      <td width="97"><strong><em>教室名称</em></strong></td>
      <td width="98"><strong><em>操作</em></strong></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
<%
	i = 1;
	for (Room room : roomsList)
	{
%>
    <tr>
      <td><%= i %></td>
      <td><%= room.getLocation() %></td>
      <td><%= room.getRoomCapacity() %></td>
      <td><%= room.getRoomName() %></td>
      <td><a href="roomCtrl.jsp?deleteId=<%= room.getRoomId() %>">删除</a></td>
    </tr>
<%
		i++;
	}
%>
  </table>
</div>
<div id="apDiv8">
 <form id="backForm" name="backForm" method="post" action="backIndex.jsp">
  <input type="submit" style="height:40px;width:100px" name="back" id="back" value="返回" />
 </form>
</div>
</body>

</html>