<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page session="true" %>

<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<%   
    if (session == null || session.getAttribute("adminLogin") == null || !((String)session.getAttribute("adminLogin")).equals("ok")) 
    {   
    	if (session != null) 
    	{
    		//session.invalidate();//清除session
    		session.removeAttribute("adminLogin");
    	}
        response.sendRedirect("adminLogin.jsp");
        return;
	}   
%>