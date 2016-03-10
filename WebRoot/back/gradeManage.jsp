<%@page import="model.StudentInfo"%>
<%@page import="model.Score"%>
<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page session="true" %>
<%@ include file="checkvalid.jsp"%>

<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="scoreMgmt" scope="application" class="control.ScoreMgmt" />
<%	
	LinkedList<Score> scoresList = (LinkedList<Score>)request.getAttribute("ScoresList");
	if (scoresList == null) 
	{
		scoresList = scoreMgmt.listScores();
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>考生成绩管理</title>
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
#form_ap {position: absolute;
	left: 30px;
	top: 160px;
	width: 400px;
	height: 200px;
	z-index: 6;
}
#text_ap {position: absolute;
	left: 40px;
	top: 460px;
	width: 140px;
	height: 30px;
	z-index: 4;
}
#apDiv1 {
	position: absolute;
	left: 30px;
	top: 764px;
	width: 800px;
	height: 300px;
	z-index: 5;
}
#apDiv2 {
	position: absolute;
	left: 40px;
	top: 713px;
	width: 140px;
	height: 30px;
	z-index: 6;
}
#apDiv3 {
	position: absolute;
	left: 30px;
	top: 510px;
	width: 800px;
	height: 128px;
	z-index: 7;
}
#apDiv4 {
	position: absolute;
	left: 685px;
	top: 223px;
	width: 327px;
	height: 126px;
	z-index: 8;
}
#apDiv5 {position: absolute;
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
<div id="form_ap">
  <form id="search_ap" name="search_ap" method="post" action="gradeSearch.jsp">
    <h2><strong>考生成绩检索</strong> <br/>
    </h2>
    <table width="400" border="0">
      <tr>
        <td width="80">考生报名号 </td>
        <td width="180"><div id="registerNum" style="width:160px; height:27px">
          <input id="registerNum_input" name="registerNum_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80"></td>
        <td width="80"><div id="logIN_bu">
          <input style="width:90px; height:30px" type="submit" name="search_button" id="search_button" value="确认查询" />
        </div></td>
      </tr>
    </table>
  </form>
</div>
<div id="apDiv2">
  <h3><strong>成绩信息表</strong></h3>
</div>
<div id="apDiv1">
  <table width="686" border="0">
    <tr>
      <td width="58"><em><strong>序号</strong></em></td>
      <td width="92"><em><strong>学生报名号</strong></em></td>
      <td width="83"><em><strong>学生姓名</strong></em></td>
      <td width="91"><em><strong>报考类别</strong></em></td>
      <td width="73"><em><strong>科目</strong></em></td>
      <td width="67"><em><strong>印象分</strong></em></td>
      <td width="68"><em><strong>最终分</strong></em></td>
      <td width="83"><em><strong>打分专家</strong></em></td>
      <td width="58"><strong><em>操作</em></strong></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
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
	for (Score score : scoresList)
	{
%>
    <tr>
      <td><%= i %></td>
      <td><%= score.getStudentInfo().getRegistrationNumber() %></td>
      <td><%= score.getStudentInfo().getStudentName() %></td>
      <td><%= StudentInfo.getCategoryString(score.getExam().getCategory()) %></td>
      <td><%= score.getExam().getSubjectName() %></td>
      <td><%= score.getFistPoint() %></td>
      <td><%= score.getFinalPoint() %></td>
      <td><%= score.getExpert().getExpertName() %></td>
      <td><a href="gradeCtrl.jsp?deleteId=<%= score.getScoreId() %>">删除</a></td>
    </tr>
<%
		i++;
	}
%>
  </table>
</div>
<div id="text_ap">
  <h3><strong>操作区域</strong></h3>
</div>
<div id="apDiv3">
  <form id="addForm" name="addForm" method="post" action="gradeCtrl.jsp">
  <table width="720" border="0">
     <tr>
      <td width="92"><em><strong>学生报名号</strong></em></td>
      <td width="91"><em><strong>报考类别</strong></em></td>
      <td width="73"><em><strong>科目</strong></em></td>
      <td width="73"><em><strong>考点</strong></em></td>
      <td width="73"><em><strong>考场</strong></em></td>
      <td width="67"><em><strong>印象分</strong></em></td>
      <td width="68"><em><strong>最终分</strong></em></td>
      <td width="60"><em><strong>打分专家</strong></em></td>
      <td width="58"><strong><em>操作</em></strong></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><input type="text" style="width:80px;height:20px" name="studentRegisterNum_input" id="studentRegisterNum_input" value="" /></td>  
      <td><select name="categroy_input" id="categroy_input">
        <option selected="selected" value="选择报考类型">选择报考类型</option>
        <option value="推荐生">推荐生</option>
        <option value="艺术特长生">艺术特长生</option>
        <option value="高水平运动员">高水平运动员</option>
        <option value="插班生">插班生</option>
        <option value="音乐学">音乐学</option>
        <option value="美术学">美术学</option>
        <option value="播音与主持艺术">播音与主持艺术</option>
      </select></td>
      <td><input type="text" style="width:80px;height:20px" name="subject_input" id="subject_input" value="" /></td>
      <td><select name="location_input" id="location_input">
        <option selected="selected" value="选择考点">选择考点</option>
        <option value="上海考点">上海考点</option>
        <option value="浙江考点">浙江考点</option>
        <option value="江苏考点">江苏考点</option>
        <option value="安徽考点">安徽考点</option>
        <option value="山东考点">山东考点</option>
        <option value="福建考点">福建考点</option>
      </select></td>
      <td><input type="text" style="width:80px;height:20px" name="room_input" id="room_input" value="" /></td>
      <td><input type="text" style="width:80px;height:20px" name="impressGrade_input" id="impressGrade_input" value="" /></td>
      <td><input type="text" style="width:80px;height:20px" name="finalGrade_input" id="finalGrade_input" value="" /></td>
      <td><input type="text" style="width:80px;height:20px" name="professorName_input" id="professorName_input" value="" /></td>
      <td>
        <input type="submit" name="addGrade" id="addGrade" value="添加成绩" />
      </td>
    </tr>
  </table>
  </form>
</div>
<div id="apDiv4">
  <input style="width:120px;height:40px;" type="submit" name="import_button" id="import_button" value="批量导入" />
</div>
<div id="apDiv5">
 <form id="backForm" name="backForm" method="post" action="backIndex.jsp">
  <input type="submit" style="height:40px;width:100px" name="back" id="back" value="返回" />
 </form>
</div>
</body>
</html>