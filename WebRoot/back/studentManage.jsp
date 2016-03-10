<%@page import="model.StudentInfo.Category"%>
<%@page import="model.StudentInfo"%>
<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page session="true" %>
<%@ include file="checkvalid.jsp"%>
<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="studentMgmt" scope="application" class="control.StudentMgmt" />

<%	
	LinkedList<StudentInfo> studentsList = (LinkedList<StudentInfo>)request.getAttribute("StudentsList");
	if (studentsList == null) 
	{
		studentsList = studentMgmt.queryStudentInfo(null, null, null, null, null, null, null, null); 	
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>考生信息管理</title>
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
	left: 40px;
	top: 550px;
	width: 140px;
	height: 30px;
	z-index: 4;
}
#apDiv1 {
	position: absolute;
	left: 30px;
	top: 810px;
	width: 1800px;
	height: 300px;
	z-index: 5;
}
#apDiv2 {
	position: absolute;
	left: 40px;
	top: 760px;
	width: 140px;
	height: 30px;
	z-index: 6;
}
#apDiv3 {
	position: absolute;
	left: 30px;
	top: 600px;
	width: 1800px;
	height: 120px;
	z-index: 7;
}
#form_ap {
	position: absolute;
	left: 30px;
	top: 160px;
	width: 400px;
	height: 350px;
	z-index: 6;
}
#apDiv4 {position: absolute;
	left: 1023px;
	top: 44px;
	width: 139px;
	height: 67px;
	z-index: 5;
}
</style>
</head>

<body>
<div id="apDiv4">
 <form id="backForm" name="backForm" method="post" action="backIndex.jsp">
  <input type="submit" style="height:40px;width:100px" name="back" id="back" value="返回" />
 </form>
</div>
<div id="homePicture_ap"><img src="../images/u26.jpg" width="600" height="130" /></div>
<div id="homeTitle_ap">
  <h1>2015年</h1>
  <pre><h1>自主招生后台管理系统</h1></pre>
  <p>&nbsp;</p>
</div>

<div id="apDiv2">
  <h3><strong>学生信息表</strong></h3>
</div>
<div id="apDiv1">
  <table width="1700" border="0">
    <tr>
      <td width="48"><strong><em>序号</em></strong></td>
      <td width="92"><em><strong>报名状态</strong></em></td>
      <td width="77"><em><strong>报名号</strong></em></td>
      <td width="108"><em><strong>高考报名号</strong></em></td>
      <td width="52"><em><strong>姓名</strong></em></td>
      <td width="86"><em><strong>身份证</strong></em></td>
      <td width="41"><em><strong>性别</strong></em></td>
      <td width="66"><strong><em>年龄</em></strong></td>
      <td width="48"><em><strong>考点</strong></em></td>
      <td width="91"><strong><em>报考类型</em></strong></td>
      <td width="96"><strong><em>生源地省份</em></strong></td>
      <td width="93"><strong><em>生源地县市</em></strong></td>
      <td width="73"><em><strong>毕业高中</strong></em></td>
      <td width="77"><em><strong>家庭住址</strong></em></td>
      <td width="60"><strong><em>电话</em></strong></td>
      <td width="78"><strong><em>电子邮箱</em></strong></td>
      <td width="83"><em><strong>登录密码</strong></em></td>
      <td width="57"><strong><em>操作</em></strong></td>
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
	for (StudentInfo studentInfo : studentsList)
	{
%>
    <tr>
      <td><%= i %></td>
      <td><%= StudentInfo.printState(studentInfo.isState()) %></td>
      <td><%= studentInfo.getRegistrationNumber() %></td>
      <td><%= studentInfo.getExamPermitNumber() %></td>
      <td><%= studentInfo.getStudentName() %></td>
      <td><%= studentInfo.getIdCardNumber() %></td>
      <td><%= StudentInfo.getGenderString(studentInfo.getGender()) %></td>
      <td><%= studentInfo.getAge() %></td>
      <td><%= studentInfo.getLocation() %></td>
      <td><%= StudentInfo.getCategoryString(studentInfo.getCategory()) %></td>
      <td><%= studentInfo.getProvince() %></td>
      <td><%= studentInfo.getRegion() %></td>
      <td><%= studentInfo.getGraduateSchool() %></td>
      <td><%= studentInfo.getAddress() %></td>
      <td><%= studentInfo.getPhoneNumber() %></td>
      <td><%= studentInfo.getE_mail() %></td>
      <td><%= studentInfo.getPassword() %></td>
      <td><a href="studentsCtrl.jsp?deleteId=<%= studentInfo.getStudentId() %>">删除</a></td>
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
  <form id="addform" name="addform" method="post" action="studentsCtrl.jsp">
  <table width="1067" border="0">
    <tr>
      <td width="85"><em><strong>高考报名号</strong></em></td>
      <td width="41"><em><strong>姓名</strong></em></td>
      <td width="68"><em><strong>身份证</strong></em></td>
      <td width="43"><em><strong>性别</strong></em></td>
      <td width="52"><strong><em>年龄</em></strong></td>
      <td width="84"><em><strong>考点</strong></em></td>
      <td width="123"><strong><em>报考类型</em></strong></td>  
      <td width="38"><strong><em>生源地省份</em></strong></td>
      <td width="46"><strong><em>生源地县市</em></strong></td>
      <td width="123"><strong><em>毕业高中</em></strong></td>
      <td width="45"><strong><em>电话</em></strong></td>
      <td width="77"><em><strong>家庭住址</strong></em></td>
      <td width="69"><strong><em>电子邮箱</em></strong></td>
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
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><input type="text" style="width:120px;height:20px" name="gaokaobaominghao_input2" id="gaokaobaominghao_input2" value="" /></td>
      <td><input type="text" style="width:120px;height:20px" name="studentName_input2" id="studentName_input2" value="" /></td>
      <td><input type="text" style="width:120px;height:20px" name="idCard_input2" id="idCard_input2" value="" /></td>
      <td>
      	<select name="gender_input2" id="gender_input2">
          <option selected="selected" value="选择性别">选择性别</option>
          <option value="男">男</option>
          <option value="女">女</option>
      	</select>
      </td>
      <td><input type="text" style="width:120px;height:20px" name="age_input2" id="age_input2" value="" /></td>
      <td><select name="testPort_input2" id="testPort_input2">
        <option selected="selected" value="选择考点">选择考点</option>
        <option value="上海考点">上海考点</option>
        <option value="浙江考点">浙江考点</option>
        <option value="江苏考点">江苏考点</option>
        <option value="安徽考点">安徽考点</option>
        <option value="山东考点">山东考点</option>
        <option value="福建考点">福建考点</option>
      </select></td>
      <td><select name="studentSubject_input2" id="studentSubject_input2">
        <option selected="selected" value="选择报考类型">选择报考类型</option>
        <option value="推荐生">推荐生</option>
        <option value="艺术特长生">艺术特长生</option>
        <option value="高水平运动员">高水平运动员</option>
        <option value="插班生">插班生</option>
        <option value="音乐学">音乐学</option>
        <option value="美术学">美术学</option>
        <option value="播音与主持艺术">播音与主持艺术</option>
      </select></td>
      <td><input type="text" style="width:120px;height:20px" name="province_input2" id="province_input2" value="" /></td>
      <td><input type="text" style="width:120px;height:20px" name="region_input2" id="region_input2" value="" /></td> 
      <td><input type="text" style="width:120px;height:20px" name="graduateSchool_input2" id="graduateSchool_input2" value="" /></td>
      <td><input type="text" style="width:120px;height:20px" name="phone_input2" id="phone_input2" value="" /></td>
      <td><input type="text" style="width:120px;height:20px" name="address_input2" id="address_input2" value="" /></td>
      <td><input type="text" style="width:120px;height:20px" name="email_input2" id="email_input2" value="" /></td>
      <td>
        <input type="submit" name="addStudent" id="addStudent" value="添加考生" />
      </td>
    </tr>
  </table>
  </form>
</div>
<div id="form_ap">
  <form id="search_ap" name="search_ap" method="post" action="studentsSearch.jsp">
    <h2><strong>学生信息检索</strong>
      <br/>
    </h2>
    <table width="400" border="0">
      <tr>
        <td width="80">报名号 </td>
        <td width="180"><div id="baominghao" style="width:160px; height:27px">
          <input id="baominghao_input" name="baominghao_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80">考生姓名 </td>
        <td width="180"><div id="uName" style="width:160px; height:27px">
          <input id="uName_input" name="uName_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80">身份证号 </td>
        <td width="180"><div id="uIdentifyNum" style="width:160px; height:27px">
          <input id="uIdentifyNum_input" name="uIdentifyNum_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80">省份 </td>
        <td width="180"><div id="province" style="width:160px; height:27px">
          <input id="province_input" name="province_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80">县市 </td>
        <td width="180"><div id="region" style="width:160px; height:27px">
          <input id="region_input" name="region_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80">毕业高中 </td>
        <td width="180"><div id="graduateSchool" style="width:160px; height:27px">
          <input id="graduateSchool_input" name="graduateSchool_input" type="text" value=""/>
        </div></td>
      </tr>
      
      <tr>
        <td width="80">报考类型 </td>
        <td width="180"><div id="studentSubject" style="width:160px; height:27px">
          <select name="studentSubject_input2" id="studentSubject_input2">
            <option selected="selected" value="选择报考类型">选择报考类型</option>
            <option value="推荐生">推荐生</option>
            <option value="艺术特长生">艺术特长生</option>
            <option value="高水平运动员">高水平运动员</option>
            <option value="插班生">插班生</option>
            <option value="音乐学">音乐学</option>
            <option value="美术学">美术学</option>
            <option value="播音与主持艺术">播音与主持艺术</option>
          </select>
        </div></td>
      </tr>
      <tr>
        <td width="80">报名状态</td>
        <td width="180"><div id="uAddress" style="width:160px; height:27px">
          <select name="status_input" id="status_input">
            <option selected="selected" value="选择报名状态">选择报名状态</option>
            <option value="已报名">已报名</option>
            <option value="未报名">未报名</option>
          </select>
        </div></td>
      </tr>
      <tr>
        <td width="80"></td>
        <td width="80"></td>
      </tr>
      <tr>
        <td width="80"></td>
        <td width="80"><div id="logIN_bu">
          <input style="width:90px; height:30px" type="submit" name="search_button" id="search_button" value="点击查询" />
        </div></td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>