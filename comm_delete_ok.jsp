<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
int refnum=Integer.parseInt(request.getParameter("ref_num"));
int commnum=Integer.parseInt(request.getParameter("comm_num"));
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/boardschema";
	
	try{
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(jdbc_url, "root", "q1w2e3r4");
		
		String sql = "delete from comment where num="+commnum;
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate(sql);

		pstmt.close();
	}
	catch(Exception e){
		System.out.println(e);
	}
%>
<body>
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
</body>
</html>