<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.Exam"%>
<%@page import="model.Room"%>
<%@page import="model.StudentInfo"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ include file="checkvalid.jsp"%>
<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="examMgmt" scope="application" class="control.ExamMgmt" />

<%
	DateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
	
	String deleteId = request.getParameter("deleteId");
	
	if (deleteId != null) 
	{   
		int i= Integer.parseInt(deleteId);
		Exam exam = examMgmt.getAnExamByExamId(i);
		//暂时增加下面函数，否则可能会出错
		
		if (exam == null)
		{
			response.sendRedirect("testPort.jsp");
			return;
		}
		
		boolean res = examMgmt.deleteAnExam(exam); 
		if (res) 
		{
			//System.out.println("删除成功！");   
%>
<script>window.location.href="testPort.jsp";</script>
<%  
			return;
		}
		else
		{
%>
<script>alert("删除失败！");history.back();</script>
<%
			return;
		}
	}
	else if (request.getParameter("add") != null) 
	{
		//获取科目
    	String subjectName = request.getParameter("subject_input");
		//获取考点
    	String location = request.getParameter("testPort_input");
		//获取报告类型
    	String category = request.getParameter("category_input");
    	//获取考试时间
    	String datetime = request.getParameter("testTime_input");
		//获取考场
    	String roomName = request.getParameter("room_input");
    	Room room = examMgmt.getAnRoom(roomName, location);
    	if (subjectName !=null && location != null && category != null && 
    		datetime != null && roomName != null)
    	{
    		if (room == null)
    		{
%>
<script>alert("插入失败：考点或教室不存在！");history.back();</script>
<%    			
				return;
    		}
    		Exam exam = new Exam();
    		exam.setSubjectName(subjectName);
    		exam.setCategory(StudentInfo.getCategory(category));
    		exam.setRoom(room);
    		exam.setDatetime(Timestamp.valueOf(datetime));
    		
    		int res = examMgmt.insertAnExam(exam);
    		if (res != 0)
    		{
    			exam.setExamId(res);
%>
<script>alert("插入成功！");window.location.href="testPort.jsp";</script>
<%    			
				return;
    		}
    		else
    		{
%>
<script>alert("插入失败！");history.back();</script>
<%
				return;
    		}
    	}
    	else
    	{
%>
<script>alert("插入失败！");history.back();</script>
<%    	
			return;
    	}
	}
%>