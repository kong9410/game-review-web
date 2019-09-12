<%/*작성자 박서윤*/ %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<script language="javascript">
function validate() {
    var name = document.getElementById("name").value;
    var ID = document.getElementById("ID").value;
    var PW = document.getElementById("PW").value;
    var rePW = document.getElementById("rePW").value;
    var email = document.getElementById("email").value;
    var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    if(name==""){
    	alert("이름을 입력하세요.");
    	return false;
    }
    else if(name.length>10){
    	alert("이름은 10자 이내로 입력해야 합니다.");
    	return false;
    }
    else if(ID==""){
    	alert("아이디를 입력하세요.");
    	return false;
    }
    else if(ID.length<4||ID.length>12){
    	alert("아이디는 4~12자로 입력해야 합니다.");
    	return false;
    }
    else if(PW==""){
    	alert("패스워드를 입력하세요.");
    	return false;
    }
    else if(PW.length<4||PW.length>12){
    	alert("패스워드는 4~12자로 입력해야 합니다.");
    	return false;
    }
    else if(PW!=rePW){
    	alert("비밀번호가 틀립니다.");
    	return false;
    }
    else if(email==""){
    	alert("이메일을 입력하세요.");
    	return false;
    }
    else if(regex.test(email)==false){
    	alert("잘못된 이메일 형식입니다.");
    	return false;
    }
    form.action=("signup_ok.jsp");
    form.method=("post");
    form.submit();
    return true;
}
</script>

<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"/>
<body topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0">
<div class="main">
<h2><span style="color:#FFFFFF">Sign up</span></h2>
<form id="form" name="form">
<label>사용자 이름(~10자):</label>
<input type="text" name="name" id="name"/>
<label>ID(4~12자):</label>
<input type="text" name="ID" id="ID"/>
<label>PW(4~12자):</label>
<input type="password" name="PW" id="PW"/>
<label>PW 확인:</label>
<input type="password" name="rePW" id="rePW"/>
<label>e-mail:</label>
<input type="text" name="email" id="email"/>
<p align="center">
<input type="submit" value="Create account" onclick="validate()"/>
</p></form>
</div>
</body>
</html>