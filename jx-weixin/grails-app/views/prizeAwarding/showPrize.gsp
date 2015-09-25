
<%@ page import="com.surelution.wxmp.jx.PrizeAwarding" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'prizeAwarding.label', default: 'PrizeAwarding')}" />
		<title>中国石油嘉兴公司50万大奖加油就送，我中了${prizeAwarding.prize.name }</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link href="${resource(dir:'css/bootstrap.min.css')}" rel="stylesheet" media="screen">
		<script type="text/javascript" src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jQueryRotateCompressed.js')}"></script>
		<style type="text/css">
		#image {
			margin: 80px 70px;
		}
		</style>
		<script type="text/javascript">
		//<![CDATA[ 
			$(window).load(function(){
				$("#image").rotate(36 * ${prizeAwarding.wheelIndex-1});
				});
			
		//]]>
		</script>
	</head>
	<body>
		<br>
		<font size="+2"><b>加汽油玩微信，大奖三亚五日游</b></font><br><br>
		<div style="background-image: url(${resource(dir:'app-images/pc.jpg?v=2') });width: 258px;height: 258px;" >
		<img src="${resource(dir:'app-images/arrow.gif?v=2')}" id="image" style="-webkit-transform: rotate(321deg); -webkit-transform-origin: 50% 50%;" onclick="stopRotate()">
		</div>
		<div>
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td background="${resource(dir:'app-images/')}wc1.jpg" width="80px" align="center">谢谢惠顾</td>
				<td background="${resource(dir:'app-images/')}wc2.jpg" width="80px" align="center">价值20元汽车用品</td>
			</tr>
			<tr>
				<td background="${resource(dir:'app-images/')}wc3.jpg" width="80px" align="center">价值30元汽车用品</td>
				<td background="${resource(dir:'app-images/')}wc4.jpg" align="center">价值90元汽车用品</td>
			</tr>
			<tr>
				<td background="${resource(dir:'app-images/')}wc5.jpg" align="center">价值70元汽车用品</td>
				<td background="${resource(dir:'app-images/')}wc6.jpg" align="center">价值50元汽车用品</td>
			</tr>
		</table>
		</div>
		<br>
	<font size="+2" color="red"><b>我中了${prizeAwarding.prize.name }!</b></font><br>
	<br><a href="../promotion/gameDemo">来跟我一起来玩吧</a>，下月初让中国石油买单组团去三亚！
	</body>
</html>
