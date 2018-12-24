<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>直播房间-${curlive.curliveInfor.currentLiveTitle }</title>

<script src="<%=request.getContextPath()%>/jquery.js"></script>

<script src="//qzonestyle.gtimg.cn/open/qcloud/video/live/h5/live_connect.js" charset="utf-8"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/html/css/bootstrap.min.css" type="text/css" media="all">
<link rel="stylesheet" href="<%=request.getContextPath()%>/html/css/font-awesome.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/html/css/ionicons.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/html/css/owl.carousel.css" type="text/css" media="all">
<link rel="stylesheet" href="<%=request.getContextPath()%>/html/css/owl.theme.css" type="text/css" media="all">
<link rel='stylesheet' href='<%=request.getContextPath()%>/html/css/prettyPhoto.css' type='text/css' media='all'>
<link rel="stylesheet" href="<%=request.getContextPath()%>/html/css/style.css" type="text/css" media="all">
<link rel="stylesheet" href="<%=request.getContextPath()%>/html/css/custom.css" type="text/css" media="all">
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
						<img class="logo-image" src="<%=request.getContextPath()%>/html/images/logo.png" alt="Organik Logo" />
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
		<div class="section border-bottom pt-2 pb-2">
			<div class="container">
				<p style="font-size: 2em; padding: 0.3em; ">您当前所在的房间: ${curlive.curliveInfor.currentLiveTitle } </p>
			</div>
		</div>
		<div class="section pt-7 pb-7">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div  id="id_video_container" style="width:100%; height:auto;"></div>
					</div>
					<div class="col-md-4">
						<div class="cart-totals">
							<table>
								<tbody>
									<tr class="cart-subtotal">
										<th>标题</th>
										<td>${curlive.curliveInfor.currentLiveTitle }</td>
									</tr>
									<tr class="shipping">
										<th>主播名</th>
										<td>${curlive.userName }</td>
									</tr>
									<tr class="order-total">
										<th>分类</th>
										<td>${curlive.curliveInfor.currentLiveClass }</td>
									</tr>
									
								</tbody>
							</table>
							
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
					<img src="<%=request.getContextPath()%>/html/images/footer_logo.png" class="footer-logo" alt="" />
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
var option = {
		   "live_url" : "rtmp://liveplay.warmcoding.com/live/${curlive.curliveInfor.streamid}",
		   "live_url2" : "http://liveplay.warmcoding.com/live/${curlive.curliveInfor.streamid}.flv",
		   "live_url3": "http://liveplay.warmcoding.com/live/${curlive.curliveInfor.streamid}.m3u8",
		   "width" : 540,
		   "height" : 360
};
(function(){
 var player = new qcVideo.Player("id_video_container", option)
 })()
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/html/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/html/js/jquery-migrate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/html/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/html/js/modernizr-2.7.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/html/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/html/js/jquery.countdown.min.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/html/js/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/html/js/jquery.prettyPhoto.init.min.js'></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/html/js/script.js"></script>
</body>
</html>