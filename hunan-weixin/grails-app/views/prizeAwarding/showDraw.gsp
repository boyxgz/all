
<%@ page import="com.surelution.wxmp.jx.PrizeAwarding" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'prizeAwarding.label', default: 'PrizeAwarding')}" />
		<title>加汽油玩微信，大奖三亚五日游</title>
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
		var interval;
		var angle = 0;
		//<![CDATA[ 
			$(window).load(function(){
			interval = setInterval(function(){
			      angle+=36;
			     $("#image").rotate(angle);
			},50);
			});
		//]]>
		function stopRotate() {
			clearInterval(interval);
			//$("#image").rotate(36 * ${prizeAwarding.wheelIndex-1});
			$.ajax({
			    url:"${g.createLink(controller:'prizeAwarding',action:'draw')}",
			    dataType: 'json',
			    data: { token:'${token}',i: ((angle / 36) % 10 + 1)},
			    success: function(ret) {
				    var s;
				    if(ret.empty) {
					    s = "很遗憾，您没有抽中奖品，下次再来吧！当然，您同样有机会抽取三亚游！";
					} else {
				    	s = "您已抽中" + ret.name;
					    s += "，请于7日内至以下加油站领取。领奖详情您可以随时回复 幸运大转盘 给小U，小U会即时回复给您相关信息。";
					    s += "您的兑奖码是：${prizeAwarding.verifyCode}";
					    $("#qrCode").attr("src","${resource(dir:'dynImage/qr/')}${prizeAwarding.verifyCode}").attr("hidden",false);
					}
			        $("#prizeResult").html(s);
			    }
			});
			
		}
		</script>
	</head>
	<body>
	<br>
	<font size="20px"><b>幸运宝石花</b></font><br><br>
	触摸圆盘中间的指针，指针即停，根据指针指向的颜色，即表示您奖品的类别。擦干手心的汗，让指针停在那个幸运的颜色上吧！<br>
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
		<div id="prizeResult">
		</div>
		<img id="qrCode" alt="" hidden="true" src="">
	</body>
</html>
