<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="javax.servlet.http.Cookie" %>
    <%@page import="java.net.*" %>
    <%@page import="org.json.JSONObject" %>
    <%@page import="org.json.JSONArray" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../jquery.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
    function applyButton(){
    	$.ajax({
    		type:"get",
    		url:"${pageContext.request.contextPath}/applyHomeServlet",
    		data: {},	
    		dataType:"json",
    	    success:function(data){
    	      
    	      var homeNumber = data.homeNumber;
    	      alert(homeNumber);
    	      if (homeNumber==-1){
    	             alert("申请直播间失败");
    	       }else{
    	    	   var sapply = "你申请的房间号是:"+homeNumber;
    	    	   alert(sapply);
    	       }   
    	    }, error: function (data) {
    	    	alert("error");
            }
    	});
    	alert("hhh");
    }
</script>
</head>
<body>  
  
      <input id="test" value="jquery">
      <input type="submit"  onclick="applyButton()">
</body>
</html>
