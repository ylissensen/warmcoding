<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="warmcoding.classes.current_live" %>
    <%@page import="java.util.List" %>
<!doctype html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>search-result</title>

<script src="<%=request.getContextPath()%>/jquery.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/html/css/bootstrap.min.css" type="text/css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/html/css/font-awesome.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/html/css/ionicons.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/html/css/owl.carousel.css" type="text/css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/html/css/owl.theme.css" type="text/css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/html/css/prettyPhoto.css" type="text/css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/html/css/style.css" type="text/css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/html/css/custom.css" type="text/css" media="all">
<link href="http://fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
 <%
     //在前台获取后台传递的对象，注意，要强转一下类型，不然会报错的
     List<current_live> titlelist = (List<current_live>)request.getAttribute("title");
     List<current_live> classlist = (List<current_live>)request.getAttribute("class");
     current_live idlist = (current_live)request.getAttribute("id");
     //循环输出title的
     %>
     
    
 <%   
      if (titlelist != null && titlelist.size() > 0){
         for ( int i = 0; i < titlelist.size(); i++){
            	 if(i==0 && titlelist.get(0).getCurrentLiveClass().equals("")){
 %>
       <script type="text/javascript">
           $(function(){
        	   $("#title_result").html("<div><p>无搜索结果</p></div>");
           });
           
      </script>
  <%
            		 //说明没有title相关的
            		 break;
            	 }
             %>
                    <script type="text/javascript">
                         $(function(){
                        	 var tem="";
                        	 tem+="<div class='col-md-4 col-sm-6 product-item text-center mb-3'><div class='product-thumb'>";
                    		 tem+="<a href='${pageContext.request.contextPath}/showCurLiveServlet?homeid="+"<%=titlelist.get(i).getCurrentLiveHomeNumber()%>"+"'>";
                             tem+=" <img src='${pageContext.request.contextPath}/CSS/images/"+"<%=i %10+1 %>"+".jpg' style='padding:10px' height='300px' width='250px'>";
                             tem+="</a>";
                             tem+="<div class='product-action'></div></div><div class='product-info'>";
                             tem+="<a href='${pageContext.request.contextPath}/showCurLiveServlet?homeid="+"<%=titlelist.get(i).getCurrentLiveHomeNumber()%>"+"'>";
                             tem+="<h2 class='title'> 标题: "+ "<%=titlelist.get(i).getCurrentLiveTitle() %> ";
                             tem+="</h2><span class='price'> 分类: "+"<%=titlelist.get(i).getCurrentLiveClass() %> "+"</span>";
                             tem+="</a></div></div>";
                              $("#title_result").append(tem);
                         });    
                     </script>  
             <%
           
         }
     } 
  %> 
  <%   
      if (classlist != null && classlist.size() > 0){
         for ( int j = 0; j < classlist.size(); j++){
            	 if(j==0 &&  classlist.get(0).getCurrentLiveClass().equals("")){
 %>
       <script type="text/javascript">
           $(function(){
        	   $("#class_result").html("<div><p>无搜索结果</p></div>");
           });
           
      </script>
  <%
            		 //说明没有class相关的
            		 break;
            	 }
             %>
                    <script type="text/javascript">
                         $(function(){
                        	  var tem="";
                        	  tem+="<div class='col-md-4 col-sm-6 product-item text-center mb-3'><div class='product-thumb'>";
                     		  tem+="<a href='${pageContext.request.contextPath}/showCurLiveServlet?homeid="+"<%=classlist.get(j).getCurrentLiveHomeNumber()%>"+"'>";
                              tem+=" <img src='${pageContext.request.contextPath}/CSS/images/"+"<%=j %8+2 %>"+".jpg' style='padding:10px' height='300px' width='250px'>";
                              tem+="</a>";
                              tem+="<div class='product-action'></div></div><div class='product-info'>";
                              tem+="<a href='${pageContext.request.contextPath}/showCurLiveServlet?homeid="+"<%=classlist.get(j).getCurrentLiveHomeNumber()%>"+"'>";
                              tem+="<h2 class='title'> 标题: "+ "<%=classlist.get(j).getCurrentLiveTitle() %> ";
                              tem+="</h2><span class='price'> 分类: "+"<%=classlist.get(j).getCurrentLiveClass() %> "+"</span>";
                              tem+="</a></div></div>";
                         
                              $("#class_result").append(tem);
                         });    
                     </script>  
             <%
           
         }
     } 
  %>
  <%   
      if (idlist != null){
             
             if(idlist.getCurrentLiveHomeNumber() == 0){
 %>
          <script type="text/javascript">
               $(function(){
             	   $("#id_result").html("<div class='col-md-3'><p>无搜索结果</p></div>");
              });
           
      </script>
  <%
            		 //说明没有id相关的
            	 }else{
             %>
                    <script type="text/javascript">
                         $(function(){
                        	 
                        	 tem+="<div class='col-md-4 col-sm-6 product-item text-center mb-3'><div class='product-thumb'>";
                    		 tem+="<a href='${pageContext.request.contextPath}/showCurLiveServlet?homeid="+"<%=idlist.getCurrentLiveHomeNumber()%>"+"'>";
                             tem+=" <img src='${pageContext.request.contextPath}/CSS/images/"+8+".jpg' style='padding:10px' height='300px' width='250px'>";
                             tem+="</a>";
                             tem+="<div class='product-action'></div></div><div class='product-info'>";
                             tem+="<a href='${pageContext.request.contextPath}/showCurLiveServlet?homeid="+"<%=idlist.getCurrentLiveHomeNumber()%>"+"'>";
                             tem+="<h2 class='title'> 标题: "+ "<%=idlist.getCurrentLiveTitle() %> "+"</h2><span class='price'> 分类: "+"<%=idlist.getCurrentLiveClass() %> "+"</span>";
                             tem+="</a></div></div>";
                  
                             $("#id_result").append(tem);
                         });    
                     </script>  
             <%
            	 }
         }
     
  %>
 

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
						<img class="logo-image" src="${pageContext.request.contextPath }/html/images/logo.png" alt="Organik Logo" />
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
						<h2 class="page-title text-center">search result</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="section pt-10 pb-10">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<h2 class="text-center section-title mtn-2">房间号搜索结果</h2>
						<div class="organik-seperator mb-6 center">
							<span class="sep-holder"><span class="sep-line"></span></span>
							<div class="sep-icon"><i class="organik-flower"></i></div>
							<span class="sep-holder"><span class="sep-line"></span></span>
						</div>
						<div id="id_result"></div>
					</div>
				</div>	
			</div>
		</div>
		<div class="section pt-10 pb-10">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<h2 class="text-center section-title mtn-2">标签搜索结果</h2>
						<div class="organik-seperator mb-6 center">
							<span class="sep-holder"><span class="sep-line"></span></span>
							<div class="sep-icon"><i class="organik-flower"></i></div>
							<span class="sep-holder"><span class="sep-line"></span></span>
						</div>
						<div id="class_result"></div>
					</div>
				</div>	
			</div>
		</div>
		<div class="section pt-10 pb-10">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<h2 class="text-center section-title mtn-2">房间名搜索结果</h2>
						<div class="organik-seperator mb-6 center">
							<span class="sep-holder"><span class="sep-line"></span></span>
							<div class="sep-icon"><i class="organik-flower"></i></div>
							<span class="sep-holder"><span class="sep-line"></span></span>
						</div>
						<div id="title_result"></div>
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
					Copyright &copy; 2017.warmcoding.
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath }/html/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/html/js/jquery-migrate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/html/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/html/js/modernizr-2.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/html/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/html/js/jquery.countdown.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/html/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/html/js/jquery.prettyPhoto.init.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/html/js/script.js"></script>
<script type="text/javascript" src="http://ditu.google.cn/maps/api/js?key=AIzaSyDwtb7cR_XBPEvxtQ_Yq3_xKsOWQroCTPA&sensor=false"></script>
</body>
</html>

