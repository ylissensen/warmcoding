
<!doctype html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>APPLY HOME</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/CSS/layer/layer.js"></script>
	
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/layer/mobile/need/layer.css">
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
     

 <script>
 function applyButton(){
		$.ajax({
 		type:"get",
 		url:"${pageContext.request.contextPath}/applyHomeServlet",
 		data: {},	
 		dataType:"json",
 	    success:function(data){ 
 	      var homeNumber = data.homeNumber;
 	      if (homeNumber==-1){
 	    	  layer.open({
	    	   			type: 1,
	    	   			title:false,
	    	   			closeBtn: 0,
	    	   			area: ['500px', '200px'],
	    	   			shadeClose: true, //点击遮罩关闭
	    	   			content: '\<\div style="font-size:18px; padding:85px; background-color:#ebf6f7;">不好意思 申请失败了呢! 可能是网络问题哦~ \<\/div>'
	    	   			});
 	       }else{
 	    	   var sapply = "你申请的房间号是:"+homeNumber;
 	    	  // alert(sapply);
 	    	   layer.open({
 	   			type: 1,
 	   			title:false,
 	   			closeBtn: 0,
 	   			area: ['500px', '250px'],
 	   			shadeClose: true, //点击遮罩关闭
 	   			
                 btn:['现在直播','暂不直播'],
                 btn1:function(index,layero){
                 	window.location.href="${pageContext.request.contextPath }/JSP/applyLive.jsp";
                 },
                 btn2:function(index,layero){
              
                 },
 	   			content: '\<\div style="font-size:18px; padding:85px; background-color:#ebf6f7;">恭喜！你已经成为一名光荣的主播！<br/>'+sapply+'<br/>\<\/div>'
 	   			});
 	    	    
 	       } 
 	    
 	    }, error: function (data) {
 	    	alert("error");
         }
 	});
	}
 
 </script>
 <script>
 var code;
 function createCode() 
 {
  code = "";
  var codeLength = 6; //验证码的长度
  var checkCode = document.getElementById("checkCode");
  var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
       'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
       'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
  for(var i = 0; i < codeLength; i++) 
  {
   var charNum = Math.floor(Math.random() * 52);
   code += codeChars[charNum];
  }
  if(checkCode) 
  {
   checkCode.className = "code";
   checkCode.innerHTML = code;
  }
 }
 function validateCode() 
 {
  var inputCode=document.getElementById("inputCode").value;
  if(inputCode.length <= 0) 
  {
 	 layer.open({
    			type: 1,
    			title:false,
    			closeBtn: 0,
    			area: ['500px', '200px'],
    			shadeClose: true, //点击遮罩关闭
    			content: '\<\div style="font-size:18px; padding:85px; background-color:#ebf6f7;">输入验证码\<\/div>'
    			});
  }
  else if(inputCode.toUpperCase() != code.toUpperCase()) 
  {
 	 layer.open({
    			type: 1,
    			title:false,
    			closeBtn: 0,
    			area: ['500px', '200px'],
    			shadeClose: true, //点击遮罩关闭
    			content: '\<\div style="font-size:18px; padding:85px; background-color:#ebf6f7;">验证码错误\<\/div>'
    			});
    createCode();
  }
  else 
  {
 	 applyButton();
  }    
 }  
 </script>

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
		<div class="section bg-light pt-16 pb-6">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="text-center mb-1 section-pretitle">申请成为主播</div>
						<div class="organik-seperator mb-9 center">
							<span class="sep-holder"><span class="sep-line"></span></span>
							<div class="sep-icon"><i class="organik-flower"></i></div>
							<span class="sep-holder"><span class="sep-line"></span></span>
						</div>	
					<div class="col-md-8">
	                 <div class="row">
	                   <div class="col-md-6">
	                       <h4 style="padding:40px;">填表申请</h4> 
	                      <form id="form1" runat="server" onsubmit="validateCode()">
                     
                             <div class="row">
								<div class="col-md-12">
									<label>姓名 <span class="required">*</span></label>
									<div class="form-wrap">
										<input type="text" name="your-address" value="" size="40" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<label>身份证 <span class="required">*</span></label>
									<div class="form-wrap">
										<input type="text" name="your-postal" value="" size="40" />
									</div>
								</div>
							</div>
								
							<div class="row">
							   <div class="col-md-6">
									 <label>验证码:  </label> 
									<div class="form-wrap">
										<input style="float:left;" type="text"  id="inputCode" />
									</div>
								</div>
								<div class="col-md-6">
									<label><p class="code" id="checkCode" onclick="createCode()" ></p></label>
									 <div> <a href="#" onclick="createCode()"> 看不清换一张</a></div>
								</div>
							
							</div>
                             <input id="Button1" onclick="validateCode();" type="button" value="确定" />     
                         
                          </form>
                           </div>
	                    </div>
	                    </div>
	                    <div class="row">
	                        <div class="col-md-4 col-sm-12">
                        <h4 style="padding:40px;">注意事项</h4>
						<div class="icon-boxes right">
							<div class="icon-boxes-icon"><i class="ion-android-star-outline"></i></div>
							<div class="icon-boxes-inner">
								
								<p>1. 本功能目前属于开发测试阶段,申请填写表格较为简单,后续可能需要补充上传多项证件哦</p>
							</div>
						</div>
						<div class="icon-boxes right">
							<div class="icon-boxes-icon"><i class="organik-cucumber"></i></div>
							<div class="icon-boxes-inner">
								
								<p> 2. 对直播流程有问题可以拨打电话 15071091360 咨询美女客服</p>
							</div>
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
					Copyright &copy; 2017.warmcoding.
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
</body>
</html>