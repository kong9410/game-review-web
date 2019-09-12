<!-- 오픈소스 12조
	이름 : 게임 리뷰 글쓰기 기능
	작성자 : 공민철
	설명 : 글쓰기 기능에 실제로 데이터베이스에
	데이터가 들어가는 jsp이다.
 -->

<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@page import="java.sql.*, java.util.*, java.io.File"%>
<%
	request.setCharacterEncoding("utf-8");
	Calendar days = Calendar.getInstance();
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/boardschema";
	/*
	int maxsize = 1024 * 1024 * 5;
	String uploadPath = request.getRealPath("/upload");
	String fileName = "";
	String fileType = "";
	String originalName = "";
	long filesize = 0;
	MultipartRequest multi = null;
	System.out.println(uploadPath);
	*/
	String imageName = request.getParameter("img");
	String game = request.getParameter("game");
	String title = request.getParameter("title");
	String writer = (String)session.getAttribute("ID");
	String memo = request.getParameter("memo");
	String review = request.getParameter("star");
	//review를 선택하지 않았을시 0점
	if(review==null){
		review = "0";
	}
	String day = Integer.toString(days.get(Calendar.YEAR)) +"/"+ Integer.toString(days.get(Calendar.MONTH)+1) +"/"+ Integer.toString(days.get(Calendar.DAY_OF_MONTH));
	
	
	int ica = 6;
	try{
		/*
		multi = new MultipartRequest(request, uploadPath, maxsize);
		Enumeration files = multi.getFileNames();
		while(files.hasMoreElements()){
			String file1 = (String)files.nextElement();
			originalName = multi.getOriginalFileName(file1);
			fileName = multi.getFilesystemName(file1);
			fileType = multi.getContentType(file1);
			File file = multi.getFile(file1);
			filesize = file.length();
		}
		*/
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(jdbc_url, "root", "q1w2e3r4");
		String sql = "insert into infolist(game, title, writer, days, view, memo) values(?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, game);
		pstmt.setString(2, title);
		pstmt.setString(3, writer);
		pstmt.setString(4, day);
		pstmt.setInt(5, 0);
		pstmt.setString(6, memo);
		
		pstmt.execute();
		pstmt.close();
	}
	catch(Exception e){
		System.out.println(e);
	}
%>
<script language=javascript>
	location.href="info_list.jsp";
</script>