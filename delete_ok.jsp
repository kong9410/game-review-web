<%@page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/boardschema";
	
	try{
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(jdbc_url, "root", "q1w2e3r4");
		
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String sql = "delete from listboard where id="+Integer.toString(idx);
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate(sql);

		pstmt.close();
	}
	catch(Exception e){
		System.out.println(e);
	}
%>
<script>
	self.window.alert("해당 글을 삭제하였습니다.");
	location.href="review_list.jsp";
</script>