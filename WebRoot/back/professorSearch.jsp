<%@page import="model.Expert"%>
<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="checkvalid.jsp"%>
<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="expertMgmt" scope="application" class="control.ExperMgmt" />

<%
	if (request.getParameter("search_button") != null)
	{
	
  		String certificate = request.getParameter("number_input");
  		if (certificate == null || certificate.equals("")) certificate = null;
  	
  		String expertName = request.getParameter("expertName_input");
  		if (expertName == null || expertName.equals("")) expertName = null;
  	
  		String major = request.getParameter("major_input");
  		if (major == null || major.equals("")) major = null;
  	 
  	
  		LinkedList<Expert> expertsList = expertMgmt.queryExpertsInfo(expertName, certificate, major);
		request.setAttribute("ExpertsList", expertsList);
	
		request.getRequestDispatcher("professorManage.jsp").forward(request, response);
	}
%>