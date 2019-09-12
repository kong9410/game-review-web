<%/*작성자 박서윤*/ %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><body bgcolor="#2c2c32">
<% request.setCharacterEncoding("utf-8"); %>
<%
	// 데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;

	// 데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/boardschema";
	
	try{
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);

		// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url, "root", "q1w2e3r4");//아이디-비밀번호

		// Connection 클래스의 인스턴스로 부터 SQL  문 작성을 위한 Statement 준비
		String sql = "insert into user(name, ID, PW, email) values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,request.getParameter("name"));
		pstmt.setString(2,request.getParameter("ID"));
		pstmt.setString(3,request.getParameter("PW"));
		pstmt.setString(4,request.getParameter("email"));

		pstmt.executeUpdate();
		out.println("<script>alert('회원가입이 완료되었습니다.');");
		out.println("window.close();");
		session.setAttribute("name", request.getParameter("name")); 
		session.setAttribute("ID", request.getParameter("ID")); 
		session.setAttribute("PW", request.getParameter("PW")); 
		session.setAttribute("email", request.getParameter("email")); 
		session.setAttribute("admin", 0); 
		out.println("window.opener.location.reload(); ");
		out.println("</script>");
	}
	catch(Exception e) {
		out.println("<script>alert('이미 존재하는 아이디입니다.')");
		out.println("window.location='signup.jsp';");
		out.println("</script>");
		System.out.println(e);
	}
%>
</body>
</html>