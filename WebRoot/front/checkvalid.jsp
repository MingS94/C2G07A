<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.StudentInfo"%>
<%@page session="true" %>

<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<%   
    if (session == null || session.getAttribute("login") == null ||
     !((String)session.getAttribute("login")).equals("ok") || 
     (StudentInfo)session.getAttribute("studentInfo") == null) 
    {   
    	if (session != null) 
    	{	
    		//session.invalidate();//清除session
    		session.removeAttribute("login");
    		session.removeAttribute("studentInfo");
    	}	
        response.sendRedirect("studentLogin.jsp");
        return;
	}   
%>