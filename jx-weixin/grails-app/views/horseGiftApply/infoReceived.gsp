
<!DOCTYPE html>
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<html>
	<head>
		<title>请选择</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=yes">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<!-- Mobile IE allows us to activate ClearType technology for smoothing fonts for easy reading -->
		<meta http-equiv="cleartype" content="on">
		<link type="text/css" rel="stylesheet" href="${createLink(uri: '/css/weixin-mobile.css')}" />
	</head>
	<body>
		${KeyedMessage.findByKey('HORSE-GIFT-INFO-RECEIVED').message}
	</body>
</html>
