<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="warmcoding.classes.user"%>
<%@page import="warmcoding.daoiml.UserDaoImpl" %>
<%@page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>处理登录信息</title>
</head>
<body>
<%
	boolean CLI = false;
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");

	//得到用户名
	//设置字符集--针对get请求

	String usn = request.getParameter("userName");
	String pwd = request.getParameter("password");
	System.out.print(usn+pwd);
	user user = new user();
	user.setUserName(usn);
	UserDaoImpl test = new UserDaoImpl();
	//test.updateUserIndentificationCode(usn);
	
	if (test.findUser(user)) {
		CLI = new UserDaoImpl().logIn(user);
	}
	System.out.print(CLI);
	if (CLI) {
		//添加Cookie
		Cookie cookie = new Cookie("username", usn);
		//设置cookie的有效期，以秒为单位
		cookie.setMaxAge(60 * 60 * 24 * 30);
		response.addCookie(cookie);
		 response.sendRedirect("navigation.jsp"); 
		//response.sendRedirect("applyHome.jsp");

	} else if (!CLI) {
%>
		<script type="text/javascript">
			alert("用户名不存在或密码错误");
			window.location.href='register.jsp';
		</script>
<%	}%>
</body>
</html>