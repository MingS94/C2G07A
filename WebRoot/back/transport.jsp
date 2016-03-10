<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="checkvalid.jsp"%>

<%@page import="control.ExperMgmt"%>
<%@page import="model.StudentInfo"%>
<%@page import="model.StudentInfo.Gender"%>
<%@page import="model.StudentInfo.Category"%>

<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="scoreMgmt" scope="application" class="control.ScoreMgmt" />
<jsp:useBean id="studentMgmt" scope="application" class="control.StudentMgmt" />
<jsp:useBean id="examMgmt" scope="application" class="control.ExamMgmt" />
<jsp:useBean id="expertMgmt" scope="application" class="control.ExperMgmt" />

<%
	if (request.getParameter("dataSync") != null)
	{
	
		Category category2 = StudentInfo.getCategory("美术学");
		Gender gender2 = StudentInfo.getGender("男");
		
    	StudentInfo s = new StudentInfo();
    	
    	s.setState(true);
    	s.setStudentName("袁松超");
    	s.setAge(21);
    	s.setRegistrationNumber("F640410011234");
    	s.setExamPermitNumber("12345678901234");
    	s.setIdCardNumber("123456789012345678");
    	s.setGender(gender2);
    	s.setCategory(category2);
    	s.setLocation("上海考点");
    	s.setProvince("上海市");
    	s.setRegion("普陀区");
    	s.setGraduateSchool("上海高中");
    	s.setAddress("上海市普陀区环球港");
    	s.setPhoneNumber("13212332123");
    	s.setE_mail("123456789@qq.com");
    	s.setPassword("123456");
    			
    	int resinsert = studentMgmt.insertStudentInfo(s);
    	if (resinsert == 0)
    	{
			return;
    	}
	
		StudentInfo studentInfo = studentMgmt.getStudentInfoByRegistrationNumber("F640410011234");
    	int studentId = -1;
    	if (studentInfo != null) studentId = studentInfo.getStudentId();
    	else
    	{ 	
			return;
    	}
    	
    	int examId = examMgmt.getExamId("美术学", "绘画", "上海考点", "华东师范大学中山北路校区文史楼315");
    	int expertId = expertMgmt.getExpertIdByName("唐波福");
    	
    	if (examId > 0 && studentId > 0 && expertId > 0)
    	{	
    		boolean res = scoreMgmt.allocateStudentAndExpertToExam(studentId, expertId, examId, "绘画");
    		if (!res)
    		{
    			return;
    		}
    	}
    	else
    	{ 	
			return;
    	}
		
    	int scoreId1 = scoreMgmt.getScoreId("F106130011234", "美术学", "绘画", "上海考点", "华东师范大学中山北路校区文史楼315");
    	int scoreId2 = scoreMgmt.getScoreId("F106130011235", "美术学", "绘画", "上海考点", "华东师范大学中山北路校区文史楼315");
    	int scoreId3 = scoreMgmt.getScoreId("F640410011234", "美术学", "绘画", "上海考点", "华东师范大学中山北路校区文史楼315");
    	
    	if (scoreId1 > 0 && scoreId2 > 0 && scoreId3 > 0)
    	{	
    		
    		boolean res1 = scoreMgmt.addScore(scoreId1, 80, 85);
    		boolean res2 = scoreMgmt.addScore(scoreId2, 80, 80);
    		boolean res3 = scoreMgmt.addScore(scoreId3, 75, 85);
    		if (res1 && res2 && res3)
    		{
%>
<script>window.location.href="systemSet.jsp";</script>
<%   	
				return;		
    		}
    		else
    		{
%>
<script>alert("学生信息不存在！");history.back();</script>
<%
				return;
    		}
    	}
    	else
    	{
%>
<script>alert("学生信息不存在！");history.back();</script>
<%   
			return; 	
    	}
    }
 %>