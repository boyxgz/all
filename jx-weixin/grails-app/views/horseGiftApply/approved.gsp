
<!DOCTYPE html>
<%@page import="com.surelution.wxmp.jx.HorseGiftApply"%>
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
	亲，您已中奖！中奖码为<font color="red">${hg.verifyCode }</font><br>
	请于2014-2-28日前，工作日早9点至下午5点前往就近中国石油嘉兴分公司所属加油站领奖。<br>
	<g:if test="${hg.giftType == HorseGiftApply.GiftType.APPLY_CARD}">
	带上您的姓名为&nbsp;<b>${hg.gasCardApply.holderName }</b>&nbsp;、号码为&nbsp;<b>${hg.gasCardApply.holderSId }</b>&nbsp;的身份证办理加油卡.
	</g:if>
	<g:if test="${hg.giftType == HorseGiftApply.GiftType.OLD_CARD}">
	带上您的姓名为&nbsp;<b>${hg.gasCard.holderName }</b>&nbsp;、号码为&nbsp;<b>${hg.gasCard.holderSId }</b>&nbsp;的身份证、卡号为&nbsp;<b>${hg.gasCard.cardNo }</b>&nbsp;的加油卡进行加油卡圈存，圈存后，您即可以正常使用您卡中的余额消费。
	</g:if>
	</body>
</html>
