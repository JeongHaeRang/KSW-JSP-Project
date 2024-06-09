<%@page import="com.KSW.web.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	UsersDAO udao = new UsersDAO();
	
	if(!udao.CheckId(userid)){
		out.print("ok");
	}else{
		out.print("non-ok");
	}
%>