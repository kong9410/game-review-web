<%/*작성자 박서윤*/ %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>로그인</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style.css"/>
<script language="javascript">
function validate(){
	var ID = document.getElementById("ID").value;
	var PW = document.getElementById("PW").value;
	if(ID==""){
		alert("아이디를 입력하세요.");
		return false;
	}
	else if(PW==""){
		alert("패스워드를 입력하세요.");
		return false;
	}
    form.action=("signin_ok.jsp");
    form.method=("post");
    form.submit();
	return true;
}
</script>
</head>
<body topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0">
<div class="main">
<h2><span style="color:#FFFFFF">Sign in</span></h2>
<form id="form" name="form">
<label>ID:</label>
<input type="text" name="ID" id="ID"/>
<label>PW:</label>
<input type="password" name="PW" id="PW"/>
<p align="center">
<input type="submit" value="Continue" onclick="validate()"/>
</p>
</form>
</div>
</body>
</html>