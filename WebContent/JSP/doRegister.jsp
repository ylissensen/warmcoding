<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="warmcoding.classes.user"%>
<%@page import="warmcoding.daoiml.UserDaoImpl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>处理注册信息</title>
</head>
<body>
<%
boolean CSU = false;
String username = new String(request.getParameter("user").getBytes("iso-8859-1"),"utf-8");
String password = new String(request.getParameter("password").getBytes("iso-8859-1"),"utf-8");
String passwordC = new String(request.getParameter("password1").getBytes("iso-8859-1"),"utf-8");

if (password.equals(passwordC)) {
	user user = new user();
	if (username != null && !username.equals("")) {
		user.setUserName(username);
		user.setUserPassWord(password);
		user.setUserIdentificationCode(0);
	}
	
	if (new UserDaoImpl().findUser(user) == false) {
		CSU = new UserDaoImpl().addUser(user);
	} else {
%>
	<script type="text/javascript"
		alert("用户名已存在");
		window.location.href='register.jsp';
	 </script>
<%	}%>
<%
	if (CSU) {
		System.out.println("用户名" + username + "密码" + password);
		response.sendRedirect("login.jsp");
	} else {
		%>
		<script type="text/javascript">
			alert("服务器出现问题，请重试！");
			window.location.href='login.jsp';
		 </script>
<%	}%>
<%
}
%>
</body>
</html>