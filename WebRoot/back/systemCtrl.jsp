<%@page import="control.AdminControl"%>
<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="checkvalid.jsp"%>
<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="adminMgmt" scope="application" class="control.AdminControl" />

<%
	if (request.getParameter("confirm") != null)
	{
		//获取登录开关
    	String loginSwitch = request.getParameter("loginSwitch");
		//获取注册开关
    	String registerSwitch = request.getParameter("registerSwitch");
    	
    	boolean ret1 = adminMgmt.setLoginState(AdminControl.getStateBoolean(loginSwitch));
    	boolean ret2 = adminMgmt.setRegistState(AdminControl.getStateBoolean(registerSwitch));
    	if (ret1 && ret2)
    	{
%>
<script>alert("设置成功！");window.location.href="systemSet.jsp";</script>
<%   
    	}
    	else 
    	{
%>
<script>alert("设置失败！");history.back();</script>
<%   	
    	}
    }
 %>