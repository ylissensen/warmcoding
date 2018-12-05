<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="javax.servlet.http.Cookie" %>
   <%@page import="java.net.*" %>
    <%@page import="org.json.JSONObject" %>
    <%@page import="org.json.JSONArray" %>
    <%@page import="warmcoding.classes.user" %>
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
<script src="<%=request.getContextPath()%>/jquery.js"></script>

<script type="text/javascript">
function applyButton(){
	$.ajax({
		  type:"get",
		  url:"${pageContext.request.contextPath}/applyLiveServlet",
		  data:{title:$("#title").val(),liveclass:$('#liveclass').val()},
		  dataType:"json",
		  success:function(data){
			  layer.open({
  	   			type: 1,
  	   			title:false,
  	   			closeBtn: 0,
  	   			area: ['500px', '250px'],
  	   			shadeClose: true, //点击遮罩关闭
  	   			content: '\<\div style="font-size:18px; padding:85px; background-color:#ebf6f7;">将rtmp和密匙放入到您推流的软件中即可直播!~ \<\/div>'
  	   			});
			  var htmlstring = '\<\div style="font-size:18px; padding:40px;">您的rtmp: '+data[0]+'\<\/div>'+'\<\div style="font-size:18px; padding:40px;"> 您的密匙'+data[1]+'\<\/div>';
			  var divshow = $("#show");
			  divshow.append(htmlstring);
 	      },error: function (XMLHttpRequest, textStatus, errorThrown) {  
             alert(XMLHttpRequest.status);
             alert(XMLHttpRequest.readyState);
             alert(textStatus);
          }
	});
}
</script>
</head>
<body style="text-align:center">
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
	
<div style="text-align: center; background-color: lightgray; height: 7em; position:relative; top: -1.3em;">
		<p style="font-size: 2em; padding: 0.3em;">申请本次直播</p>
		<p style="font-size: 0.9em"></p>
</div>
<div style="width:400px; height:250px;  margin:0 auto;margin:0 auto">
<form style="text-align: center; font-size: 24px; width: 350px; height:40px; border: lightgrey;">
  <div class="form-group">
    <label for="title" >本次直播的标题</label>
    <input type="text" class="form-control" id="title" placeholder="#本次直播的标题#">
  </div>
  <div class="form-group">
    <label for="liveclass" >本次直播的分类</label>
    <select class="form-control" id="liveclass">
      <option>C++</option>
      <option>C</option>
      <option>C#</option>
      <option>Java</option>
      <option>JavaScript</option>
      <option>Python</option>
      <option>HTML</option>
      <option>CSS</option>
    </select>
  </div>
  <button type="button" class="pure-button pure-button-primary" onclick="applyButton()" style="color: black; text-align: center; font-size: 24px; width: 120px; height:40px; border: lightgrey;">确认</button> 
</form>
</div>
<div id="show" style="width:1000px;height:500px; margin:0 auto;margin:0 auto">

</div>

</body>
</html>