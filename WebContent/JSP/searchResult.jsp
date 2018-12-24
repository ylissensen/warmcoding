<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="warmcoding.classes.current_live" %>
    <%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索结果</title>
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
      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search"  name="shabi" id="shabi">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav> 
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
        	   $("#title_result").html("<div class='col-md-3'><p>无搜索结果</p></div>");
           });
           
      </script>
  <%
            		 //说明没有title相关的
            		 break;
            	 }
             %>
                    <script type="text/javascript">
                         $(function(){
                        	  var titlehtml = "<div class='col-md-3'><figure><a href='${pageContext.request.contextPath}/showCurLiveServlet?homeid="+"<%=titlelist.get(i).getCurrentLiveHomeNumber()%>"+"'>"+"<img src='${pageContext.request.contextPath}/CSS/images/"+"<%=i %10+1 %>"+".jpg' style='padding:10px' height='300px' width='250px'>";
                              titlehtml+="</a></figure><p style='padding:20px;'>";
                              titlehtml+="房间号："+ "<%=titlelist.get(i).getCurrentLiveHomeNumber() %> "+"<br/>";
                              titlehtml+="标题："+ "<%=titlelist.get(i).getCurrentLiveTitle() %> "+"<br/>";
                              titlehtml+="分类："+ "<%=titlelist.get(i).getCurrentLiveClass() %> "+"<br/>";  
                              titlehtml+="</p></div>";
                              $("#title_result").append(titlehtml);
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
        	   $("#class_result").html("<div class='col-md-3'><p>无搜索结果</p></div>");
           });
           
      </script>
  <%
            		 //说明没有class相关的
            		 break;
            	 }
             %>
                    <script type="text/javascript">
                         $(function(){
                        	  var classhtml = "<div class='col-md-3'><figure><a href='${pageContext.request.contextPath}/showCurLiveServlet?homeid="+"<%=classlist.get(j).getCurrentLiveHomeNumber()%>"+"'>"+"<img src='${pageContext.request.contextPath}/CSS/images/"+"<%=j %10+1 %>"+".jpg' style='padding:10px' height='300px' width='250px'>";
                              classhtml+="</a></figure><p style='padding:20px;'>";
                              classhtml+="房间号："+ "<%=classlist.get(j).getCurrentLiveHomeNumber() %> "+"<br/>";
                              classhtml+="标题："+ "<%=classlist.get(j).getCurrentLiveTitle() %> "+"<br/>";
                              classhtml+="分类："+ "<%=classlist.get(j).getCurrentLiveClass() %> "+"<br/>";  
                              classhtml+="</p></div>";
                              $("#class_result").append(classhtml);
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
                        	  var idhtml = "<div class='col-md-3'><figure><a href='${pageContext.request.contextPath}/showCurLiveServlet?homeid="+"<%=idlist.getCurrentLiveHomeNumber()%>"+"'>"+"<img src='${pageContext.request.contextPath}/CSS/images/10.jpg' style='padding:10px' height='300px' width='250px'>";
                              idhtml+="</a></figure><p style='padding:20px;'>";
                              idhtml+="房间号："+ "<%=idlist.getCurrentLiveHomeNumber() %> "+"<br/>";
                              idhtml+="标题："+ "<%=idlist.getCurrentLiveTitle() %> "+"<br/>";
                              idhtml+="分类："+ "<%=idlist.getCurrentLiveClass() %> "+"<br/>";  
                              idhtml+="</p></div>";
                              $("#id_result").append(idhtml);
                         });    
                     </script>  
             <%
            	 }
         }
     
  %>

<div>
<div>
<p style="padding-left: 250px">房间号搜索如下:</p>
<div></div> 
<div class='row'id="id_result" style="padding-left: 250px"></div>
</div>
<div>
<p style="padding-left: 250px">标题搜索如下:</p>
<div></div>
<div class='row' id="title_result"  style="padding-left: 250px" ></div>
</div>
<div>
<p style="padding-left: 250px">分类搜索如下:</p>
 <div></div>
 <div class='row'  id="class_result"  style="padding-left: 250px"></div>
</div>
</div>



</body>
</html>