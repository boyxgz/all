
<%@ page import="com.surelution.wxmp.jx.WeatherItem" %>

<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>中国石油湖南分公司</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=yes">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<!-- Mobile IE allows us to activate ClearType technology for smoothing fonts for easy reading -->
		<meta http-equiv="cleartype" content="on">
		<link type="text/css" rel="stylesheet" href="${createLink(uri: '/css/weixin-mobile.css')}" />

	<style type="text/css">
		.forecastBox
			{
			background-color:#ebeff8;
			padding-top:5px;
		   padding-bottom:10px;
		   float:left;
		   width:340px;
		   padding-left:1px;
			}
		html>body .forecastBox
			{
			min-height:35px;
			}
		.forecastBox dl
			{
			display:block;
			width:340px;
			height:38px;
			float:left;
			border:1px #99b0d9 solid;
			background-color:#fff;
			margin:8px 0 0 9px;
			display:inline;
		    overflow:hidden;
			}
		.forecastBox dl dt
			{
			display:block;
			float:left;
			padding-left:10px;
			width:70px;
			height:38px;
			line-height:38px;
			font-weight:bold;
			}
		.forecastBox dl dd
			{
			float:left;
			width:250px;
			height:38px;
			line-height:38px;
			}
		.forecastBox dl dd img
			{
			float:left;
			margin-top:10px;
			margin-right:6px;
			border:0;
			}
		.forecastBox dl dd span
			{
			
			}
		.forecastBox dl dd a span 
			{
			color:#cc0003;
			}
		.forecastBox dl dd a:hover span
			{
			text-decoration:none;
			}
		.forecastBox dl dd a:hover b
			{
			text-decoration:none;
			color:#36B;
			}
		.forecastBox dl dd img b
			{
			float:left;
			}
	
	</style>
</head>
	<body>
	
	
	<div class="topimgAdWarp">
 	<img alt="" class="topimgAd" src="/uploads/Image/tqyb.png" />
 	</div>
		<div>
		<g:formatDate date="${new Date()}" format="yyyy年MM月dd日"/>全省天气情况如下：
		</div>
		<div class="forecastBox">
			<g:each in="${weatherItems}" var="weatherItemInstance">
				<dl>
					<dt>${weatherItemInstance.branch.name}</dt>
					<dd>
					<img src="http://m.weather.com.cn/img/${weatherItemInstance.img1 }"/>
					<img src="http://m.weather.com.cn/img/${weatherItemInstance.img2 }"/>
					<font color="green">${weatherItemInstance.temp2}</font>
					/
					<font color="red">${fieldValue(bean: weatherItemInstance, field: "temp1")}</font>
					${fieldValue(bean: weatherItemInstance, field: "description")}
					</dd>
				</dl>
			</g:each>
		</div>
	</body>
</html>
