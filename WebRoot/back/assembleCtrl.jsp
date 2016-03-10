<%@page import="control.ExperMgmt"%>
<%@page import="model.StudentInfo"%>
<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="checkvalid.jsp"%>
<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="scoreMgmt" scope="application" class="control.ScoreMgmt" />
<jsp:useBean id="studentMgmt" scope="application" class="control.StudentMgmt" />
<jsp:useBean id="examMgmt" scope="application" class="control.ExamMgmt" />
<jsp:useBean id="expertMgmt" scope="application" class="control.ExperMgmt" />

<%
	if (request.getParameter("assemble") != null) 
	{
    	String registrationNumber = request.getParameter("studentRegisterNum_input");
    	String location = request.getParameter("location_input");
    	String roomName = request.getParameter("room_input");
    	String category = request.getParameter("categroy_input");
    	String subject = request.getParameter("subject_input");
    	String expertName = request.getParameter("professorName_input");
		
    	StudentInfo studentInfo = studentMgmt.getStudentInfoByRegistrationNumber(registrationNumber);
    	int studentId = -1;
    	if (studentInfo != null) studentId = studentInfo.getStudentId();
    	else
    	{
%>
<script>alert("报名号不存在");history.back();</script>
<%    	
			return;
    	}
    	
    	int examId = examMgmt.getExamId(category, subject, location, roomName);
    	int expertId = expertMgmt.getExpertIdByName(expertName);
    	
    	if (examId > 0 && studentId > 0 && expertId > 0)
    	{	
    		boolean res = scoreMgmt.allocateStudentAndExpertToExam(studentId, expertId, examId, subject);
    		if (res)
    		{
%>
<script>alert("分配成功！");window.location.href="assembleStudent.jsp";</script>
<%    			
				return;
    		}
    		else
    		{
%>
<script>alert("分配失败！");history.back();</script>
<%
				return;
    		}
    	}
    	else
    	{
%>
<script>alert("填写的信息有误，分配失败！");history.back();</script>
<%    	
			return;
    	}
	}
%>