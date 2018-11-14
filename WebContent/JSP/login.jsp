<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="../CSS/register-login.css">
<title>登录</title>
</head>
<body>
<div id="box"></div>
	<div class="cent-box">

		<div class="cont-main clearfix">
			<div class="index-tab">
				<div class="index-slide-nav">
					<a href="login.jsp" class="active">登录</a> <a href="register.jsp">注册</a>
					<div class="slide-bar"></div>
				</div>
			</div>
			<form action="doLogin.jsp" method="post">
				<div class="login form">
					<div class="group">
						<div class="group-ipt userID">
							<input type="text" name="userName" id="userID" class="ipt"
								placeholder="请输入您的用户名" required>
						</div>
						<div class="group-ipt password">
							<input type="password" name="password" id="password" class="ipt"
								placeholder="输入您的登录密码" required>
						</div>
					</div>
				</div>
	
				<div class="button">
					<button type="submit" class="login-btn register-btn" id="button">登录</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>