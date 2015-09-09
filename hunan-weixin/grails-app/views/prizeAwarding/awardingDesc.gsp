
<%@ page import="com.surelution.wxmp.jx.PrizeAwarding" %>
<!DOCTYPE html>
<html>
	<head>
		<title>抽奖结果</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link href="${resource(dir:'css/bootstrap.min.css')}" rel="stylesheet" media="screen">
		<script type="text/javascript" src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
	</head>
	<body>
		您已抽中${prizeAwarding.prize.name }，请与一周内至方兴加油站、中环东路加油站或象贤加油站领取。<br/>
		您的兑奖码是${prizeAwarding.verifyCode }。
	</body>
</html>
