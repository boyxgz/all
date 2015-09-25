
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
		
		<div class="x-form-fieldset-inner">
		${KeyedMessage.findByKey("HORSE-GIFT-SELECTGIFT").message }
		<g:if test="${hg.replyInfo }">
			<br><font color="blue">小U还给您温馨提醒：${hg.replyInfo }</font>
		</g:if>
		</div>
		<div class="x-form-fieldset-inner">
			<div class="x-field mainBtn   clast">
				<div class="x-form-label ">
					<a href="${createLink(action:'showNewCard') }/${verifyCode}">新办卡</a>
				</div>
			</div>
		</div>
		<div class="x-form-fieldset-inner">
			<div class="x-field mainBtn   clast">
				<div class="x-form-label ">
					<a href="${createLink(action:'showEditCard') }/${verifyCode}">我已经有了一张加油卡</a>
				</div>
			</div>
		</div>
	</body>
</html>
