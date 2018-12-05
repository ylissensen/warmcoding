<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <!-- layer框架 用于弹框 -->  	<!-- bootstrap框架  -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/layer/mobile/need/layer.css">

<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/CSS/layer/layer.js"></script>
<script src="<%=request.getContextPath()%>/CSS/class/*"></script>
<script src="<%=request.getContextPath()%>/jquery.js"></script>
<title>直播房间-${curlive.curliveInfor.currentLiveTitle }</title>
</head>
<body style="background-color:  #e9dfe5">
<!-- 以下部分代码为主要导航栏 -->
<nav style="background:black;" class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="homePage.jsp">Warmcoding</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath }/JSP/homePage.jsp">首  页<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath }/JSP/classPage.jsp">直播分类</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath }/JSP/personPage.jsp">个人中心</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/roomFinderServlet">
      <input class="form-control mr-sm-2"  type="text"  name="shabi" id="shabi" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav> 

<!-- 以下部分代码为直播标题代码 -->
<div style="text-align: center; height: 7em; position:relative; top: -1.2em;">
		<p style="font-size: 2em; padding: 0.3em;">您当前所在的房间: ${curlive.curliveInfor.currentLiveTitle } </p>
		<p style="font-size: 0.9em"></p>
</div>
<script src="//qzonestyle.gtimg.cn/open/qcloud/video/live/h5/live_connect.js" charset="utf-8"></script>
<div id="left">
     <div id="id_video_container" style="width:100%; height:auto;">
     </div> </div>
<!-- <div id="content" class="rounded"> -->
  <div class="container"style="position: absolute;right: 20%;padding: 20px;background-color: #fdeff2; width: auto">
    <h4 style="background-color:#e9e4d4; padding:10px;">直播信息</h4>
<ul style="list-style-type:none;padding: 10px">
   <!-- <ul style="text-align: left">  -->
      <li>标&nbsp&nbsp&nbsp&nbsp题:<span style="padding-left: 18px">${curlive.curliveInfor.currentLiveTitle }</span></li>
    
      <li>主播名:<span style="padding-left: 20px">${curlive.userName }</span></li>
    
      <li>分&nbsp&nbsp&nbsp&nbsp类:<span style="padding-left: 18px">${curlive.curliveInfor.currentLiveClass }</span></li>
   
      <li>房间号:<span style="padding-left: 20px">${curlive.curliveInfor.currentLiveHomeNumber }</span></li>
  <!-- </ul> -->
</ul>
</div>
<!-- </div> -->










<script type="text/javascript">
var option = {
		   "live_url" : "rtmp://33772.liveplay.myqcloud.com/live/33772_100001",
		   "live_url2" : "htmp://33772.liveplay.myqcloud.com/live/33772_100001.flv",
		   "live_url3": "htmp://33772.liveplay.myqcloud.com/33772_100001.m3u8",
		   "width" : 540,
		   "height" : 360
};
(function(){
 var player = new qcVideo.Player("id_video_container", option)
 })()
</script>
</body>
<style type="text/css">
			*{
				margin: 0;
				padding: 0;
			}

			#left {
				float: left;
				width: 800px;
			}

			#content {
				background-color: rgba(200,200,200,0.1);
				margin-left: 800px;/*==等于左边栏宽度==*/
				height : 360px;
			}
			.infor {
			   font-size:25px;
			}
		</style>
</html>