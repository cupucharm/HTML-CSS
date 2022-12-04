<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");	

	String uid = request.getParameter("uid");
	String uname = request.getParameter("uname");
	String ubirth = request.getParameter("ubirth");
	String umail = request.getParameter("umail");
	String pwd1 = request.getParameter("pwd1");
	String pwd2 = request.getParameter("pwd2");
	String path = request.getParameter("path");
	String memo = request.getParameter("memo");
	String mailing = request.getParameter("mailing");

	String result="실패";
	String mention = "님 다시 회원가입 해주세요";
	
	if (!pwd2.equals(pwd1)) {
		result = "비밀번호를 확인해 주세요.";
	} else {

		try {
			//1. JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");
		
			//2. DB 서버에 연결
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "user1", "passwd");
			conn.setAutoCommit(false);
			
			//3. SQL 구문 실행
			//3.1 PreparedStatement 생성
			PreparedStatement pstmt = conn.prepareStatement("insert into member_html values(?, ?, ?, ?, ?, ?, ?, ?)");
			//3.2 조회 시 사용할 입력인자를 전달한다
			pstmt.setString(1, uid);
			pstmt.setString(2, uname);
			pstmt.setString(3, ubirth);
			pstmt.setString(4, umail);
			pstmt.setString(5, pwd1);
			pstmt.setString(6, path);
			pstmt.setString(7, memo);
			pstmt.setString(8, mailing);
			
			try {
				int rs = pstmt.executeUpdate();
				if(!(rs==0)){
					conn.commit();
					result = "성공";
					mention = "님 회원가입을 축하드립니다!";
				}
			} catch (SQLException e) {
				conn.rollback();
			}
			
			//4. 연결 종료
			pstmt.close();
			conn.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 결과</title>
</head>
<body>
	회원가입 결과 : <%= result %><br/>
	<h1><%= uname %> <%= mention %> </h1><br/>
	
	<%= uid + " " + uname + " " +  ubirth + " " + umail + " " + path + " " + memo + " " + mailing  %>
</body>
</html>