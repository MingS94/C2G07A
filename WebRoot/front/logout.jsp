<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	if (session != null)
	{
		//session.invalidate();
		session.removeAttribute("login");
    	session.removeAttribute("studentInfo");
	}
%>
<script>alert("注销成功！");window.location.href="studentLogin.jsp";</script>