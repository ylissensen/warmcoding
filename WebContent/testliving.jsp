<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>

<meta charset="UTF-8">
<title>warm coding</title>
</head>
<body>
 <script src="//qzonestyle.gtimg.cn/open/qcloud/video/live/h5/live_connect.js" charset="utf-8"></script>;
<div id="id_video_container" style="width:100%; height:auto;"></div> 
<script type="text/javascript">
   var option = {
		   "live_url" : "rtmp://33772.liveplay.myqcloud.com/live/33772_000001",
		   "live_url2" : "rtmp://33772.liveplay.myqcloud.com/live/33772_000001.flv",
		   "live_url3": "rtmp://33772.liveplay.myqcloud.com/live/33772_000001.m3u8",
		   "width" : 480,
		   "height" : 320
   };
   (function(){
    var player = new qcVideo.Player("id_video_container", option)
    })()
</script>
</body>
</html>