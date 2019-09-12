<%@page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Calendar days = Calendar.getInstance();
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/boardschema";
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	String game = request.getParameter("game");
	String title = request.getParameter("title");
	String writer = (String)session.getAttribute("ID");
	
	String memo = request.getParameter("memo");
	String review = request.getParameter("star");
	int ica = 6;
	try{
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(jdbc_url, "root", "q1w2e3r4");
		String sql = "update listboard set game=?, title=?, review=?, memo=? where id=?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, game);
		pstmt.setString(2, title);
		pstmt.setString(3, review);
		pstmt.setString(4, memo);
		pstmt.setInt(5, idx);
		
		pstmt.executeUpdate();

		pstmt.close();
	}
	catch(Exception e){
		System.out.println(e);
	}
%>
<script language=javascript>
	location.href="review_list.jsp";
</script>