<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/* 이해를 위한 용도  */

	request.setCharacterEncoding("UTF-8");	

	String a = request.getParameter("a");
	String b = request.getParameter("b");
	
	System.out.println("a = " + a);
	System.out.println("b = " + b);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두 문자열을 더한 결과</title>
</head>
<body>
두 문자열을 더한 결과 : <%= a+b %>
</body>
</html>