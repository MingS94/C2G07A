<%@page import="model.StudentInfo.Gender"%>
<%@page import="control.OLRegisterMgmt"%>
<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.StudentInfo.Category"%>
<%@page import="model.StudentInfo"%>
<%@ include file="checkvalid.jsp"%>
<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="olReMgmt" scope="application" class="control.OLRegisterMgmt" />
<jsp:useBean id="studentMgmt" scope="application" class="control.StudentMgmt" />

<%
	String deleteId = request.getParameter("deleteId");
	
	if (deleteId != null) 
	{ 
		int i= Integer.parseInt(deleteId);
		StudentInfo info = studentMgmt.getStudentInfoById(i);
		//暂时增加下面函数，否则或出错
		
		if (info == null)
		{
%>
<script language="javascript" type="text/javascript">window.location.href="studentManage.jsp";</script>
<%  
			return;
		}
		
		
		boolean res = studentMgmt.deleteStudentInfo(info.getRegistrationNumber());
		if (res) 
		{
%>
<script language="javascript" type="text/javascript">window.location.href="studentManage.jsp";</script>
<%  
			return;
		}
		else
		{
%>
<script language="javascript" type="text/javascript">alert("删除失败！");history.back();</script>
<%
			return;
		}
	}
	else if (request.getParameter("addStudent") != null) 
	{
		String examPerNum2 = request.getParameter("gaokaobaominghao_input2");
		String studentName2 = request.getParameter("studentName_input2");
		String idCardNum2 = request.getParameter("idCard_input2");
		String genderStr2 = request.getParameter("gender_input2");
		String age2 = request.getParameter("age_input2");
		String location2 = request.getParameter("testPort_input2");
		String categoryStr2 = request.getParameter("studentSubject_input2");
		String province2 = request.getParameter("province_input2");
		String region2 = request.getParameter("region_input2");
    	String graduateSchool2 = request.getParameter("graduateSchool_input2");
    	String phone2 = request.getParameter("phone_input2");
    	String address2 = request.getParameter("address_input2");
    	String email2 = request.getParameter("email_input2");
		
		Category category2 = StudentInfo.getCategory(categoryStr2);
		Gender gender2 = StudentInfo.getGender(genderStr2);
		int ageInt2 = 0;
		try{
			ageInt2 = Integer.parseInt(age2);
		}
		catch (Exception e)
		{
%>
<script>alert("输入的数据有误，插入失败！");history.back();</script>
<%    	
			return;	
		}
		String registrationNumber2 = null;
		String password2 = null;
		if (idCardNum2 != null && examPerNum2 != null && categoryStr2 != null && category2 != null) 
    	{
    		registrationNumber2 = olReMgmt.verifyIdentity(examPerNum2, idCardNum2, category2);
    		//默认密码为身份证后六位
    		password2 = OLRegisterMgmt.cut6IdCardNumber(idCardNum2);
    	}
		
    	StudentInfo s = new StudentInfo();
    	
    	if (registrationNumber2 != null && password2 != null)
    	{
    		
    		s.setState(true);
    		s.setStudentName(studentName2);
    		s.setAge(ageInt2);
    		s.setRegistrationNumber(registrationNumber2);
    		s.setExamPermitNumber(examPerNum2);
    		s.setIdCardNumber(idCardNum2);
    		s.setGender(gender2);
    		s.setCategory(category2);
    		s.setLocation(location2);
    		s.setProvince(province2);
    		s.setRegion(region2);
    		s.setGraduateSchool(graduateSchool2);
    		s.setAddress(address2);
    		s.setPhoneNumber(phone2);
    		s.setE_mail(email2);
    		s.setPassword(password2);
    			
    		int res = studentMgmt.insertStudentInfo(s);
    		if (res != 0)
    		{
    			s.setStudentId(res);
%>
<script>alert("插入成功！");window.location.href="studentManage.jsp";</script>
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