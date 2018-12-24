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
<title>WARM CODING</title>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="all">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/ionicons.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
<link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
<link rel="stylesheet" href="css/settings.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<link rel="stylesheet" href="css/custom.css" type="text/css" media="all">
<link href="http://fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">

<!-- layer用于弹框的设计 -->
<script src="<%=request.getContextPath()%>/CSS/layer/layer.js"></script>
<script src="<%=request.getContextPath()%>/jquery.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- 获取用户session,以判断登录/注册 -->
<!-- 随机获取推荐的直播 -->
<script type="text/javascript">
var userid = <%=session.getAttribute("name")%> ;
$(function test(){
	$.ajax({
        type:"GET",
        url:"${pageContext.request.contextPath}/getAllCurLiveServlet",
        cache: false,
        dataType:"json",
        success:function(json){
       	   // alert("hhhhhhhhhhhh");
       	    var tem = " ";
       	 if(json.length > 3) json.length = 3;
       	 for(var i=0,l=json.length;i<l;i++){
       	   tem+="<div class='col-md-4 col-sm-6 product-item text-center mb-3'><div class='product-thumb'>";
  		   tem+="<a href='${pageContext.request.contextPath}/showCurLiveServlet?homeid="+json[i].currentLiveHomeNumber+"'>";
           tem+=" <img src='${pageContext.request.contextPath}/CSS/images/"+(i%10+1)+".jpg' style='padding:10px' height='300px' width='250px'>";
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
                                <ul class="sub-menu">
								</ul>
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
					
						<img class="logo-image" src="${pageContext.request.contextPath }/html/images/logo.png" alt="Logo" />
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
							<img class="logo-image" src="images/logo.png" alt="Logo" />
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
		<div class="section">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12 p-0">
						<div id="rev_slider" class="rev_slider fullscreenbanner">
						<!-- 这里是最大的那两张图片 可以滑动的  修改成 一个是我们网站的介绍, 另一个是快加入我们 login? -->
							<ul>
								<li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Slide">
									<img src="images/slider/slide_bg_4.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="off" class="rev-slidebg" />
									<div class="tp-caption rs-parallaxlevel-2"
										 data-x="center" data-hoffset=""
										 data-y="center" data-voffset="-80"
										 data-width="['none','none','none','none']"
										 data-height="['none','none','none','none']"
										 data-type="image" data-responsive_offset="on"
										 data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
										 data-textAlign="['inherit','inherit','inherit','inherit']"
										 data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
										 data-paddingbottom="[0,0,0,0]"
										 data-paddingleft="[0,0,0,0]">
									<img src="images/slider/slide_6.png" alt="" />
									</div>
									<div class="tp-caption rs-parallaxlevel-1"
										 data-x="center" data-hoffset=""
										 data-y="center" data-voffset="-80"
										 data-width="['none','none','none','none']"
										 data-height="['none','none','none','none']"
										 data-type="image" data-responsive_offset="on"
										 data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
										 data-textAlign="['inherit','inherit','inherit','inherit']"
										 data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
										 data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
									<img src="images/slider/slide_7.png" alt="" />
									</div>
									<a class="tp-caption btn-2 hidden-xs" href="#"
										 data-x="['center','center','center','center']" 
										 data-y="['center','center','center','center']" data-voffset="['260','260','260','260']"
										 data-width="['auto']" data-height="['auto']"
										 data-type="button" data-responsive_offset="on"
										 data-responsive="off"
										 data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"300","ease":"Power0.easeIn","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgb(95,189,116);bg:rgba(51, 51, 51, 0);"}]'
										 data-textAlign="['inherit','inherit','inherit','inherit']"
										 data-paddingtop="[16,16,16,16]" data-paddingright="[30,30,30,30]"
										 data-paddingbottom="[16,16,16,16]" data-paddingleft="[30,30,30,30]">Live Now
									</a>
								</li>
								<li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Slide"> 
									<img src="images/slider/slide_bg_5.jpg"  alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="off" class="rev-slidebg" />
									<div class="tp-caption rs-parallaxlevel-1"
										 data-x="center" data-hoffset=""
										 data-y="center" data-voffset="-120"
										 data-width="['none','none','none','none']"
										 data-height="['none','none','none','none']"
										 data-type="image" data-responsive_offset="on"
										 data-frames='[{"delay":0,"speed":1500,"frame":"0","from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
										 data-textAlign="['inherit','inherit','inherit','inherit']"
										 data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
										 data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
											<img src="images/slider/slide_8.png" alt="" />
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section pt-12">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="text-center mb-1 section-pretitle">Latest</div>
						<h2 class="text-center section-title mtn-2">Hot or Good Live</h2>
						<div class="organik-seperator center mb-6">
							<span class="sep-holder"><span class="sep-line"></span></span>
							<div class="sep-icon"><i class="organik-flower"></i></div>
							<span class="sep-holder"><span class="sep-line"></span></span>
						</div>
					</div>
				</div>
				<!-- 在该div插入房间数据 -->
				<div class="row" id="livediv">
				</div>
				<div class="row">
					<div class="col-sm-12">
						<hr class="mt-7 mb-3" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<img src="${pageContext.request.contextPath }/html/images/footer_logo.png" class="footer-logo" alt="" />
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
					Copyright &copy; 2018.Warmcoding.
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
<script type="text/javascript" src="js/imagesloaded.pkgd.min.js"></script>
<script type="text/javascript" src="js/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="js/jquery.isotope.init.js"></script>
<script type="text/javascript" src="js/script.js"></script>

<script type="text/javascript" src="js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.video.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.actions.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.kenburn.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.migration.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.parallax.min.js"></script>
</body>
</html>