<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int refnum=Integer.parseInt(request.getParameter("refnum"));
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
		String sql = "insert into comment(refnum, writer, content) values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,refnum);
		pstmt.setString(2,(String)session.getAttribute("ID"));
		pstmt.setString(3,request.getParameter("comment"));

		pstmt.executeUpdate();
		}
	catch(Exception e) {
		System.out.println(e);
	}
	%>
<html><body bgcolor="#2c2c32">
</body>
<script language="javascript">
function URLParser(u){
    var path="",query="",hash="",params;
    if(u.indexOf("#") > 0){
        hash = u.substr(u.indexOf("#") + 1);
        u = u.substr(0 , u.indexOf("#"));
    }
    if(u.indexOf("?") > 0){
        path = u.substr(0 , u.indexOf("?"));        
        query = u.substr(u.indexOf("?") + 1);
        params= query.split('&');
    }else
        path = u;
    return {
        setParam: function(name, value){
            if(!params){
                params= new Array();
            }
            params.push(name + '=' + value);
            for (var i = 0; i < params.length; i++) {
                if(query.length > 0)
                    query += "&";
                query += params[i];
            }
            if(query.length > 0)
                query = "?" + query;
            if(hash.length > 0)
                query = query + "#" + hash;
            return path + query;
        }
    }
};
var url="review_view.jsp"
url = URLParser(url).setParam('idx',<%=refnum%>);
window.location.replace(url);
</script>
</html>