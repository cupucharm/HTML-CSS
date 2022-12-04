<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	

	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	String url = request.getParameter("url");
	
	String result="실패";
	
	
	try {
		//1. JDBC 드라이버 로딩
		Class.forName("oracle.jdbc.OracleDriver");
		
		//2. DB 서버에 연결
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "user1", "passwd");
		
		//3. SQL 구문 실행
		//3.1 PreparedStatement 생성
		PreparedStatement pstmt = conn.prepareStatement("select * from member where userid=?");
		//3.2 조회 시 사용할 입력인자를 전달한다
		pstmt.setString(1, uid);
		//3.3 결과 집합을 얻는다
		ResultSet rs = pstmt.executeQuery();
		//3.4 결과 집합과 사용자가 입력한 값과 비교한다
		if (rs. next()){
			String dbUid = rs.getString("userid");
			String dbPwd = rs.getString("pwd");
			if (dbUid.equals(uid) && dbPwd.equals(pwd)){
				result = "성공 [" + rs.getString("name") + "]";
			}
		}
		//4. 연결 종료
		rs.close();
		pstmt.close();
		conn.close();
		
		
	} catch (Exception e){
		e.printStackTrace();
	}
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>
	로그인 결과 : <%= result %><br />
	url : <%= url %>
</body>
</html>