<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="checkvalid.jsp"%>
<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="scoreMgmt" scope="application" class="control.ScoreMgmt" />

<%
	String deleteId = request.getParameter("deleteId");
	
	if (deleteId != null) 
	{ 
		int i= Integer.parseInt(deleteId);
		//暂时增加下面函数，否则或出错
		
		if (i <= 0)
		{
			response.sendRedirect("gradeManage.jsp");
			return;
		}
		
		
		boolean res = scoreMgmt.deleteScore(i);
		if (res) 
		{
			//System.out.println("删除成功！");   
%>
<script>window.location.href="gradeManage.jsp";</script>
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
	else if (request.getParameter("addGrade") != null) 
	{
    	String registrationNumber = request.getParameter("studentRegisterNum_input");
    	String location = request.getParameter("location_input");
    	String roomName = request.getParameter("room_input");
    	String category = request.getParameter("categroy_input");
    	String subject = request.getParameter("subject_input");
    	String firstPointStr = request.getParameter("impressGrade_input");
    	String finalPointStr = request.getParameter("finalGrade_input");
    	String expertName = request.getParameter("professorName_input");
		
    	int scoreId = scoreMgmt.getScoreId(registrationNumber, category, subject, location, roomName);
    	
    	if (scoreId > 0)
    	{	
    		double firstPoint = 0;
    		double finalPoint = 0;
    		try
    		{
    		firstPoint = Double.parseDouble(firstPointStr);
    		finalPoint = Double.parseDouble(finalPointStr);
    		}
    		catch (Exception e)
    		{
%>
<script>alert("输入的数据有误,插入失败！");history.back();</script>
<%     		
    			return;
    		}
    		boolean res = scoreMgmt.addScore(scoreId, firstPoint, finalPoint);
    		if (res)
    		{
%>
<script>alert("插入成功！");window.location.href="gradeManage.jsp";</script>
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
<script>alert("该考生没有这场考试，插入失败！");history.back();</script>
<%   
			return; 	
    	}
	}
%>