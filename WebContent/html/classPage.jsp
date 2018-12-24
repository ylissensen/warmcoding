<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>Live-Center</title>

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

<script type="text/javascript">
$(function test(){
    $.ajax({
          type:"GET",
          url:"${pageContext.request.contextPath}/getAllCurLiveServlet",
          cache: false,
          dataType:"json",
          success:function(json){
         	   // alert("hhhhhhhhhhhh");
         	    var tem = " ";
         	 for(var i=0,l=json.length;i<l;i++){
         		  tem+="<div class='col-md-4 col-sm-6 product-item text-center mb-3'><div class='product-thumb'>";
         		  tem+="<a href='${pageContext.request.contextPath}/showCurLiveServlet?homeid="+json[i].currentLiveHomeNumber+"'>";
                  tem+=" <img src='${pageContext.request.contextPath}/CSS/images/"+(i%14+1)+".jpg' style='padding:10px' height='300px' width='250px'>";
                  tem+="</a>";
                  tem+="<div class='product-action'></div></div><div class='product-info'>";
                  tem+="<a href='${pageContext.request.contextPath}/showCurLiveServlet?homeid="+json[i].currentLiveHomeNumber+"'>";
                  tem+="<h2 class='title'> 标题: "+json[i].currentLiveTitle+"</h2><span class='price'> 分类: "+json[i].currentLiveClass+"</span>";
                  tem+="</a></div></div>";
         	      
         	 }
         	 $("#livediv").html(tem);
          },error: function (XMLHttpRequest, textStatus, errorThrown) {  
              alert(XMLHttpRequest.status);
              alert(XMLHttpRequest.readyState);
              alert(textStatus);
           }
   }); 
});
</script>


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
					<div class="topbar-text">
					</div>
				</div>
				<div class="col-md-6">
					<div class="topbar-menu">
						<ul class="topbar-menu">
							<li class="dropdown">
							</li>
							<li><a href="#">Login</a></li>
							<li><a href="#">Register</a></li>
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
						<h2 class="page-title text-center">Live-Center</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="section border-bottom pt-2 pb-2">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
					</div>
				</div>
			</div>
		</div>
		<div class="section pt-7 pb-7">
			<div class="container">
				<div class="row">
					<div class="col-md-9 col-md-push-3">
						<div class="shop-filter">
							<div class="col-md-6">
								<p class="result-count"> </p>
							</div>
							<div class="col-md-6">
								<div class="shop-filter-right">
									<div class="switch-view">
									</div>
								</div>
							</div>
						</div>
						<div class="product-grid"  id="livediv"></div>
							
							
							
						<div class="pagination"> 
							<a class="prev page-numbers" href="#">Prev</a>
							<a class="page-numbers current" href="#">1</a>
							<a class="next page-numbers" href="#">Next</a>
						</div>
					</div>
					<div class="col-md-3 col-md-pull-9">
						<div class="sidebar">
							<div class="widget widget-product-categories">
								<h3 class="widget-title">Live-Class</h3>
								<ul class="product-categories">
									<li>按照房间号搜索<span class="count">5</span></li>
									<li>分类搜索<span class="count">5</span></li>
									<li>按照标题搜索<span class="count">6</span></li>
								</ul>
							</div>
					
							<div class="widget widget-tags">
								<h3 class="widget-title">Live-Tages</h3>
								<div class="tagcloud">
									<a href="#">c++</a>
									<a href="#">Java</a>
									 <a href="#">Python</a>
									 <a href="#">c#</a>
								</div>
							</div>
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
					Copyright &copy; 2018.Company warmcoding.
				</div>
			</div>
		</div>
		<div class="backtotop" id="backtotop"></div>
	</div>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/modernizr-2.7.1.min.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/jquery.countdown.min.js"></script>
<script type='text/javascript' src='js/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/jquery.prettyPhoto.init.min.js'></script>
<script type="text/javascript" src="js/script.js"></script>

<script type="text/javascript" src="js/core.min.js"></script>
<script type="text/javascript" src="js/widget.min.js"></script>
<script type="text/javascript" src="js/mouse.min.js"></script>
<script type="text/javascript" src="js/slider.min.js"></script>
<script type="text/javascript" src="js/jquery.ui.touch-punch.js"></script>
<script type="text/javascript" src="js/price-slider.js"></script>
</body>
</html>