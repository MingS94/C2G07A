<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page session="true" %>

<jsp:useBean id="adminMgmt" scope="application" class="control.AdminControl" />

<%  
	if (request.getParameter("logIN_button") != null)
	{
		String adminAccount = request.getParameter("uID_input");
    	String password = request.getParameter("uPassword_input");
    	
    	boolean res = adminMgmt.adminLogin(adminAccount, password);
    	
    	if(res)
    	{   
        	session.setAttribute("adminLogin", "ok");   
        	session.setMaxInactiveInterval(-1);   
        	response.sendRedirect("backIndex.jsp"); //该方法通过修改HTTP协议的HEADER部分,对浏览器下达重定向指令的,使浏览器显示重定向网页的内容. request无法传值过去.
        	return;
    	}
    	else
    	{   
%>
<script>alert("登录失败：管理员账号或密码不正确！");history.back();</script>
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