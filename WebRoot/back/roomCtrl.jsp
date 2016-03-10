<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.Room"%>
<%@page import="model.StudentInfo"%>
<%@ include file="checkvalid.jsp"%>
<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="examMgmt" scope="application" class="control.ExamMgmt" />

<%
	String deleteId = request.getParameter("deleteId");
	
	if (deleteId != null) 
	{ 
		int i= Integer.parseInt(deleteId);
		Room room = examMgmt.getAnRoomById(i);
		//暂时增加下面函数，否则或出错
		
		if (room == null)
		{
			response.sendRedirect("testPort.jsp");
			return;
		}
		
		
		boolean res = examMgmt.deleteAnRoom(room); 
		if (res) 
		{
			//System.out.println("删除成功！");   
%>
<script>window.location.href="testPort.jsp";</script>
<%  
			return;
		}
		else
		{
%>
<script>alert("删除失败！");history.back();</script>
<%
			return;
		}
	}
	else if (request.getParameter("add2") != null) 
	{
		//获取考点
    	String location = request.getParameter("testPort_input2");
		//获取教室容纳人数
    	String capacity = request.getParameter("roomCapacity_input");
    	//获取教室名称
    	String roomName = request.getParameter("roomName_input");
		
    	Room room = new Room();
    	room.setLocation(location);
    	try
    	{
    		room.setRoomCapacity(Integer.parseInt(capacity));
    	}
    	catch (Exception e)
    	{
%>
<script>alert("输入的数据有误，插入失败！");history.back();</script>
<%    	
			return;	
    	}	
    	room.setRoomName(roomName);
    	if (location != null && capacity != null && roomName != null)
    	{	
    		int res = examMgmt.insertAnRoom(room);
    		if (res != 0)
    		{
    			room.setRoomId(res);
%>
<script>alert("插入成功！");window.location.href="testPort.jsp";</script>
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