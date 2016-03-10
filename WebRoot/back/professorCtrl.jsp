<%@page import="model.Expert"%>
<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="checkvalid.jsp"%>
<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="expertMgmt" scope="application" class="control.ExperMgmt" />

<%
	String deleteId = request.getParameter("deleteId");
	
	if (deleteId != null) 
	{ 
		int i= Integer.parseInt(deleteId);
		//暂时增加下面函数，否则或出错
		
		if (i <= 0)
		{
			response.sendRedirect("professorManage.jsp");
			return;
		}
		
		
		boolean res = expertMgmt.deleteExpert(i);
		if (res) 
		{
			//System.out.println("删除成功！");   
%>
<script>window.location.href="professorManage.jsp";</script>
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
	else if (request.getParameter("addExpert") != null) 
	{
    	String userName = request.getParameter("uName_input");
    	String password = request.getParameter("uPassword_input");
    	String certificate = request.getParameter("identifyNum_input");
    	String expertName = request.getParameter("professorName_input");
    	String major = request.getParameter("fangxiang_input");
    	String phone = request.getParameter("telephoneNum_input");
    	String email = request.getParameter("email_input");
    	
    	if (userName != null && password != null && certificate != null 
    		&& expertName != null && major != null && phone != null && email!= null)
    	{	
    		Expert expert = new Expert();
			expert.setUsername(userName);
			expert.setPassword(password);
			expert.setCertificateID(certificate);
			expert.setExpertName(expertName);
			expert.setMajorIn(major);
			expert.setMobilePhone(phone);
			expert.setEmail(email);
			expert.setAddress("None");
    		boolean res = expertMgmt.insertExpert(expert);
    		if (res)
    		{
%>
<script>alert("插入成功！");window.location.href="professorManage.jsp";</script>
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