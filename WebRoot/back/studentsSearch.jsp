<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.StudentInfo.Category"%>
<%@page import="model.StudentInfo"%>
<%@ include file="checkvalid.jsp"%>
<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="studentMgmt" scope="application" class="control.StudentMgmt" />

<%
	if (request.getParameter("search_button") != null)
	{
	//获取姓名
  	String studentName = request.getParameter("uName_input");
  	if (studentName == null || studentName.equals("")) studentName = null;
  	
  	//获取身份证
  	String idCardNumber = request.getParameter("uIdentifyNum_input");
  	if (idCardNumber == null || idCardNumber.equals("")) idCardNumber = null;
  	
	//获取省份
  	String province = request.getParameter("province_input");
  	if (province == null || province.equals("")) province = null;
  	
  	//获取县市
  	String region = request.getParameter("region_input");
  	if (region == null || region.equals("")) region = null;
  	
  	//获取毕业高中
  	String graduateSchool = request.getParameter("graduateSchool_input");
  	if (graduateSchool == null || graduateSchool.equals("")) graduateSchool = null;
  	
  	//获取报名号
  	String registrationNumber = request.getParameter("baominghao_input");
  	if (registrationNumber == null || registrationNumber.equals("")) registrationNumber = null;
  	   
  	//考生类别
	String studentSubject = request.getParameter("studentSubject_input");
	Category category = StudentInfo.getCategory(studentSubject);
  	//获取状态
  	String status = request.getParameter("status_input");
  	Boolean statusBoolean = null;
  	if (status != null && status.equals("已报名")) statusBoolean = true;
  	else if (status != null && status.equals("未报名")) statusBoolean = false; 
  	
  	LinkedList<StudentInfo> studentsList = studentMgmt.queryStudentInfo(registrationNumber, studentName, idCardNumber, category, province, region, graduateSchool, statusBoolean);
	request.setAttribute("StudentsList", studentsList);
	
	request.getRequestDispatcher("studentManage.jsp").forward(request, response);
	}
%>