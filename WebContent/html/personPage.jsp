<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.Cookie" %>
   <%@page import="java.net.*" %>
    <%@page import="org.json.JSONObject" %>
    <%@page import="org.json.JSONArray" %>
    <%@page import="warmcoding.classes.user" %>
<!doctype html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>个人 中心</title>

<script src="<%=request.getContextPath()%>/CSS/layer/layer.js"></script>
<script src="<%=request.getContextPath()%>/jquery.js"></script>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="all">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/ionicons.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
<link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
<link rel='stylesheet' href='css/prettyPhoto.css' type='text/css' media='all'>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<link rel="stylesheet" href="css/custom.css" type="text/css" media="all">
<link href="http://fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
 


<div class="noo-spinner">
	<div class="spinner">
		<div class="cube1"></div>
		<div class="cube2"></div>
	</div>
</div>
<div id="menu-slideout" class="slideout-menu hidden-md-up">
	<div class="mobile-menu">
		<ul id="mobile-menu" class="menu">
			<li><a href="${pageContext.request.contextPath }/html/homePage.jsp">首页</a></li>
			<li><a href="${pageContext.request.contextPath }/html/classPage.jsp">直播</a></li>
			<li><a href="${pageContext.request.contextPath }/html/personPage.jsp">个人中心</a></li>
		</ul>
	</div>
</div>
<div class="site">
	<div class="topbar">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					
				</div>
				<div class="col-md-6">
					<div class="topbar-menu">
						<ul class="topbar-menu">
							<li class="dropdown">
							
							</li>
							<li><a href="${pageContext.request.contextPath }/JSP/login.jsp">Login</a></li>
							<li><a href="${pageContext.request.contextPath }/JSP/register.jsp">Register</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<header id="header" class="header header-desktop header-2">
		<div class="top-search">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
							<form action="${pageContext.request.contextPath}/roomFinderServlet">
							<input type="search" class="top-search-input"  name="shabi" id="shabi" placeholder="What are you looking for?" />
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<a href="#" id="logo">
						<img class="logo-image" src="images/logo.png" alt="Organik Logo" />
					</a>
				</div>
				<div class="col-md-9">
					<div class="header-right">
						<nav class="menu">
							<ul class="main-menu">
								<li><a href="${pageContext.request.contextPath }/html/homePage.jsp">首页</a></li>
			                    <li><a href="${pageContext.request.contextPath }/html/classPage.jsp">直播</a></li>
			                    <li><a href="${pageContext.request.contextPath }/html/personPage.jsp">个人中心</a></li>
							</ul>
						</nav>
						<div class="btn-wrap">
						
							<div class="top-search-btn-wrap">
								<div class="top-search-btn">
									<a href="javascript:void(0);">
										<i class="ion-search"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<header class="header header-mobile">
		<div class="container">
			<div class="row">
				<div class="col-xs-2">
					<div class="header-left">
						<div id="open-left"><i class="ion-navicon"></i></div>
					</div>
				</div>
				<div class="col-xs-8">
					<div class="header-center">
						<a href="#" id="logo-2">
							<img class="logo-image" src="images/logo.png" alt="Organik Logo" />
						</a>
					</div>
				</div>
				<div class="col-xs-2">
					<div class="header-right">
						<div class="mini-cart-wrap">
							<a href="cart.html">
								<div class="mini-cart">
									<div class="mini-cart-icon" data-count="2">
										<i class="ion-bag"></i>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div id="main">
		<div class="section section-bg-10 pt-11 pb-17">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<h2 class="page-title text-center">person center</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		<div class="section pt-7 pb-7">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="container">
				            <div class="row">
				                 <h2 style="padding:40px;">用户信息</h2>
                                          <h4 style="padding:40px;"> 用户名：<p><%= session.getAttribute("name")%><br/></p></h4>
                                          
                       
                            <div  id="homeinfor"></div>
                          </div>
                      </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <h4 style="padding:40px;">申请直播流程</h4>
						<div class="icon-boxes right">
							<div class="icon-boxes-icon"><i class="ion-android-star-outline"></i></div>
							<div class="icon-boxes-inner">
								<h6 class="icon-boxes-title">1. 申请房间号</h6>
								<p>想要顺利直播,首先要申请直播的房间号.房间号是指一个专门属于你的id,你不论直播或者不直播,这个房间都存在着,不离不散.</p>
							</div>
						</div>
						<div class="icon-boxes right">
							<div class="icon-boxes-icon"><i class="organik-cucumber"></i></div>
							<div class="icon-boxes-inner">
								<h6 class="icon-boxes-title">2. 申请本次直播</h6>
								<p>在你申请了房间号之后,就可以再次申请本次的直播.每一次直播都会给你一个rtmp地址和一个密匙.每一次申请直播的密匙都是新的且具有实效性.</p>
							</div>
						</div>
						<div class="icon-boxes right">
							<div class="icon-boxes-icon"><i class="organik-tomato"></i></div>
							<div class="icon-boxes-inner">
								<h6 class="icon-boxes-title">3. 将密匙/rtmp放入到推流软件中</h6>
								<p>在第二步拿到密匙和rtmp请求之后,将这两个串放入到推流的软件中,我们推荐的是os软件.</p>
							</div>
						</div>
					</div>
                 </div>
            </div>
            
		</div>
	
	
	
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<img src="images/footer_logo.png" class="footer-logo" alt="" />
					<p>欢迎你来到 温暖码农 直播平台.</p>
					<p>让我们一起在这里成长. 探索学习和编程的乐趣</p>
				</div>
				
			</div>
		</div>
	</footer>
	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					Copyright &copy; 2018.Company WarmCoding.
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
    $(function(){
    	$.ajax({
  		  type:"get",
  		  url:"${pageContext.request.contextPath}/judgeUserServlet",
  		  dataType:"json",
  		  success:function(data){
  			  if(data.data==0){
  				  var html = "<h4 style='padding:40px;'>您还不是主播呢~<br/><a href='${pageContext.request.contextPath }/JSP/applyHome.jsp'>点击此处一键</a>开启你的直播间</p>";
  				  $("#homeinfor").html(html);
  			  }else{
  				var html = "<h4 style='padding:40px;'>您是不是要开启本次直播呢~<br/><a href='${pageContext.request.contextPath }/JSP/applyLive.jsp'>点击此处一键</a>开启你的本次直播</p>";
  				 $("#homeinfor").html(html);
  			  }
   	      },error: function (XMLHttpRequest, textStatus, errorThrown) {  
               alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
            }
  	});
})
</script>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/modernizr-2.7.1.min.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/jquery.countdown.min.js"></script>
<script type='text/javascript' src='js/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/jquery.prettyPhoto.init.min.js'></script>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>