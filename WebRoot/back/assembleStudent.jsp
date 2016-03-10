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
<title>分配考生和专家</title>
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
#apDiv2 {	position: absolute;
	left: 1023px;
	top: 44px;
	width: 139px;
	height: 67px;
	z-index: 5;
}
#apDiv1 {
	position: absolute;
	left: 42px;
	top: 211px;
	width: 414px;
	height: 211px;
	z-index: 6;
}
#apDiv3 {
	position: absolute;
	left: 30px;
	top: 310px;
	width: 800px;
	height: 140px;
	z-index: 7;
}
#text_ap {
	position: absolute;
	left: 40px;
	top: 250px;
	width: 140px;
	height: 30px;
	z-index: 4;
}
</style>
</head>

<body>
<div id="homePicture_ap"><img src="../images/u26.jpg" width="600" height="130" /></div>
<div id="homeTitle_ap">
  <h1>2015年</h1>
  <pre><h1>自主招生后台管理系统</h1>
  </pre>
  <p>&nbsp;</p>
</div>
<div id="apDiv2">
 <form id="backForm" name="backForm" method="post" action="backIndex.jsp">
  <input type="submit" style="height:40px;width:100px" name="back" id="back" value="返回" />
 </form>
</div>
<div id="apDiv3">
  <form id="assembleForm" name="assembleForm" method="post" action="assembleCtrl.jsp">
    <table width="800" border="0">
      <tr>
        <td width="106"><em><strong>学生报名号</strong></em></td>
        <td width="134"><em><strong>报考类别</strong></em></td>
        <td width="88"><em><strong>科目</strong></em></td>
        <td width="100"><em><strong>考点</strong></em></td>
        <td width="104"><em><strong>教室名称</strong></em></td>
        <td width="115"><em><strong>专家姓名</strong></em></td>
        <td width="123"><strong><em>操作</em></strong></td>
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
      <tr>
        <td><input type="text" style="width:80px;height:20px"   name="studentRegisterNum_input" id="studentRegisterNum_input" value="" /></td>
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
        <td><input type="text" style="width:80px;height:20px"  name="subject_input" id="subject_input" value="" /></td>
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
        <td><input type="text" style="width:80px;height:20px" name="professorName_input" id="professorName_input" value="" /></td>
        <td><input type="submit" style="width:100px;height:30px" name="assemble" id="assemble" value="分配" /></td>
      </tr>
    </table>
  </form>
</div>
<div id="text_ap">
  <h3><strong>分配考生专家</strong></h3>
</div>
</body>
</html>