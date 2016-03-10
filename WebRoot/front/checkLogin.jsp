<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="control.*" %>
<%@page import="model.*" %>
<%@page session="true" %>

<jsp:useBean id="olReMgmt" scope="application" class="control.OLRegisterMgmt" />

<%  
	if (request.getParameter("logIN_button") != null)
	{
		String registrationNumber = request.getParameter("uID_input");
    	String password = request.getParameter("uPassword_input");
    	
    	StudentInfo info = olReMgmt.login(registrationNumber, password);
    	
    	if(info != null)
    	{   
        	session.setAttribute("login", "ok");   
        	session.setAttribute("studentInfo", info);
        	session.setMaxInactiveInterval(-1);   
        	response.sendRedirect("studentIndex.jsp"); //该方法通过修改HTTP协议的HEADER部分,对浏览器下达重定向指令的,使浏览器显示重定向网页的内容. request无法传值过去.
        	return;
    	}
    	else
    	{   
%>
<script>alert("登录失败：报名号或密码不正确！");history.back();</script>
<%
		}   	
	}
	else
	{
%>
<script>history.back();</script>
<%
	}
%>