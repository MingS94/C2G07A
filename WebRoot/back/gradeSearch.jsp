<%@page import="model.Score"%>
<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.StudentInfo.Category"%>
<%@page import="model.StudentInfo"%>
<%@ include file="checkvalid.jsp"%>
<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="scoreMgmt" scope="application" class="control.ScoreMgmt" />
<jsp:useBean id="studentMgmt" scope="application" class="control.StudentMgmt" />

<%
	if (request.getParameter("search_button") != null)
	{
	
  		String registrationNumber =  request.getParameter("registerNum_input");
  		LinkedList<Score> scoresList = null;
  		if (registrationNumber == null)
  		{
  			scoresList = scoreMgmt.listScores();
  		}
  		else
  		{
  			StudentInfo info = studentMgmt.getStudentInfoByRegistrationNumber(registrationNumber);
  			int studentId = -1;
  			if (info != null)
  			{
  				studentId = info.getStudentId();
  				scoresList = scoreMgmt.queryScores(studentId);	
  			}
  		}
		request.setAttribute("ScoresList", scoresList);
	
		request.getRequestDispatcher("gradeManage.jsp").forward(request, response);
	}
%>