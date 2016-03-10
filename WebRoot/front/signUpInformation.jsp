<%@page import="model.StudentInfo"%>
<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page session="true" %>
<%@ include file="checkvalid.jsp"%>

<% 
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="olReMgmt" scope="application" class="control.OLRegisterMgmt" />

<%
	StudentInfo info = (StudentInfo)session.getAttribute("studentInfo");
	if (info != null && request.getParameter("signUp_button") != null)
	{
		//获取姓名
    	String uName = request.getParameter("uName_input");
		//获取性别
    	String uSex = request.getParameter("uSex_input");
    	//获取年龄
    	String uAge = request.getParameter("uAge_input");
    	int uIntAge = Integer.parseInt(uAge);
    	//获取身份证
    	String uIdentifyNum = request.getParameter("uIdentifyNum_input");
		//获取省份
    	String province = request.getParameter("province_input");
    	//获取县市
    	String region = request.getParameter("region_input");
    	//获取毕业高中
    	String graduateSchool = request.getParameter("graduateSchool_input");
    	//获取报名号
    	String baominghao = request.getParameter("baominghao_input");    
    	//考生类别
		String studentSubject = request.getParameter("studentSubject_input");
   	 	//获取电话
    	String uTelephone = request.getParameter("uTelephone_input");
    	//获取邮箱
    	String uEmail = request.getParameter("uEmail_input");
    	//获取地址
    	String uAddress = request.getParameter("uAddress_input");
    	//获取考点
    	String uLocation = request.getParameter("testPort_input");
    	
    	info.setStudentName(uName);
    	info.setGender(StudentInfo.getGender(uSex));
    	info.setAge(uIntAge);
    	info.setIdCardNumber(uIdentifyNum);
    	info.setProvince(province);
    	info.setRegion(region);
    	info.setGraduateSchool(graduateSchool);
    	info.setExamPermitNumber(baominghao);
    	info.setCategory(StudentInfo.getCategory(studentSubject));
    	info.setPhoneNumber(uTelephone);
    	info.setE_mail(uEmail);
    	info.setAddress(uAddress);
    	info.setLocation(uLocation);
    	
    	boolean res = olReMgmt.confirmStudentInfo(info);
    	if (res)
    	{
    		
%>
<script>alert("报名成功！");window.location.href="studentIndex.jsp";</script>
<%    		
    	}
    	else
    	{
%>
<script>alert("报名失败！");history.back();</script>
<%
    	}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>申请报名</title>
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
#text_ap {
	position: absolute;
	left: 50px;
	top: 200px;
	width: 140px;
	height: 30px;
	z-index: 4;
}
#form_ap {
	position: absolute;
	left: 280px;
	top: 220px;
	width: 400px;
	height: 250px;
	z-index: 6;
}
#apDiv1 {
	position: absolute;
	left: 500px;
	top: 280px;
	width: 80px;
	height: 80px;
	z-index: 7;
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
<div id="homeTitle_ap">
  <h1>2015年</h1>
  <pre><h1>自主招生网上报名</h1>
  </pre>
  <p>&nbsp;</p>
</div>
<div id="homePicture_ap"><img src="../images/u26.jpg" alt="" width="600" height="130" /></div>
<div id="text_ap"><strong>填写报名信息</strong></div>
<div id="form_ap">
  <form id="information_ap" name="information_ap" method="post" action="signUpInformation.jsp">
    <table width="400" border="0">
      <tr>
        <td width="80">考生姓名 </td>
        <td width="180"><div id="uName" style="width:160px; height:27px">
          <input id="uName_input" name="uName_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80">考生性别 </td>
        <td width="180"><div id="uSex" style="width:160px; height:27px">
          <select name="uSex_input" id="uSex_input">
            <option selected="selected" value="选择性别">选择性别</option>
            <option value="男">男</option>
            <option value="女">女</option>
          </select>
        </div></td>
      </tr>
      <tr>
        <td width="80">考生年龄 </td>
        <td width="180"><div id="uAge" style="width:160px; height:27px">
          <input id="uAge_input" name="uAge_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80">身份证号 </td>
        <td width="180"><div id="uIdentifyNum" style="width:160px; height:27px">
          <input id="uIdentifyNum_input" name="uIdentifyNum_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80">生源地省份 </td>
        <td width="180"><div id="province" style="width:160px; height:27px">
          <input id="province_input" name="province_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80">生源地县市 </td>
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
        <td width="80">高考报名号 </td>
        <td width="180"><div id="baominghao" style="width:160px; height:27px">
          <input id="baominghao_input" name="baominghao_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80">报考类型 </td>
        <td width="180"><div id="studentSubject" style="width:160px; height:27px">
          <select name="studentSubject_input" id="studentSubject_input">
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
        <td width="80">考点 </td>
        <td width="180"><div id="testPort" style="width:160px; height:27px">
          <select name="testPort_input" id="testPort_input">
            <option selected="selected" value="选择考点">选择考点</option>
            <option value="上海考点">上海考点</option>
            <option value="浙江考点">浙江考点</option>
            <option value="江苏考点">江苏考点</option>
            <option value="安徽考点">安徽考点</option>
            <option value="山东考点">山东考点</option>
            <option value="福建考点">福建考点</option>
          </select>
        </div></td>
      </tr>
      <tr>
        <td width="80">电话 </td>
        <td width="180"><div id="uTelephone" style="width:160px; height:27px">
          <input id="uTelephone_input" name="uTelephone_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80">电子邮箱 </td>
        <td width="180"><div id="uEmail" style="width:160px; height:27px">
          <input id="uEmail_input" name="uEmail_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80">家庭住址 </td>
        <td width="180"><div id="uAddress" style="width:160px; height:27px">
          <input id="uAddress_input" name="uAddress_input" type="text" value=""/>
        </div></td>
      </tr>
      <tr>
        <td width="80"></td>
        <td width="80"></td>
      </tr>
      <tr>
        <td width="80"></td>
        <td width="80"><div id="logIN_bu">
          <input style="width:90px; height:30px" type="submit" name="signUp_button" id="signUp_button" value="确认报名" />
        </div></td>
      </tr>
    </table>
  </form>
</div>
<div id="apDiv2">
  <form id="backForm" name="backForm" method="post" action="studentIndex.jsp">
  <input type="submit" style="height:40px;width:100px" name="back" id="back" value="返回" />
  </form>
</div>
</body>
</html>