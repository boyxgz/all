
<!DOCTYPE html>
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<%@page import="com.surelution.whistle.core.js.JsApiContext"%>
<%@page import="grails.util.Holders"%>
<html>
	<head>
		<title>关注有礼</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${resource(dir:'css/spring-festival-2015.css')}" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${resource(dir: 'js/jquery-1.9.1.min.js')}"></script>
		
		<wx:registerJsapi queryString="springFestival2015/description?${request.queryString }" apiList="'hideOptionMenu'"/>

		<script type="text/javascript">
			wx.ready(function () {
				wx.hideOptionMenu();
			})
		</script>
	</head>
	<body>
<div id="web_bg" style="position:absolute; width:100%; height:100%; z-index:-1"> 
<img style="position:fixed; max-width:800px;" src="${resource(dir:'images/bg-s-2015.jpg')}" height="100%" width="100%" /> 
</div>

<div class="content">
<p><a href="#"><img src="${resource(dir:'images/2015-spring-poster.jpg?v=13')}" style="width:90%;" /></a></p>
<g:if test="${!readerSubscribed }">
<p>
<a href="${KeyedMessage.findByKey("subscribing-guide-url")?.message }"><span class="button  blue">我也要参与</span></a>	
</p>
</g:if>
<p class="textBox">
<b>活动规则及说明：</b><br/>
${KeyedMessage.findByKey("2015-spring-festival-event-tips")?.message }
</p>
</div>
</body>
</html>