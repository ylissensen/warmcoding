<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="../CSS/register-login.css">
<title>注册</title>
</head>
<body>
<div id="box"></div>
	<div class="cent-box register-box">

		<div class="cont-main clearfix">
			<div class="index-tab">
				<div class="index-slide-nav">
					<a href="login.jsp">登录</a> <a href="register.jsp" class="active">注册</a>
					<div class="slide-bar slide-bar1"></div>
				</div>
			</div>
			<form action="doRegister.jsp" method="post">
				<div class="login form">
					<div class="group">
						<div class="group-ipt user">
							<input type="text" name="user" id="user" class="ipt"
								placeholder="设置您的用户名" required>
						</div>
						<div class="group-ipt password">
							<input type="password" name="password" id="password" class="ipt"
								placeholder="设置登录密码" required>
						</div>
						<div class="group-ipt password1">
							<input type="password" name="password1" id="password1" class="ipt"
								placeholder="重复密码" required>
						</div>
					</div>
				</div>
	
				<div class="button">
					<button type="submit" class="login-btn register-btn" id="button">注册</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>