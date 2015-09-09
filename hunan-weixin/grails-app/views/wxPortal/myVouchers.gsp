
<!DOCTYPE html>
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<%@page import="com.surelution.wxmp.jx.Voucher.VoucherStatus"%>
<html>
	<head>
		<title>我的红包</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/> 
		<link href="${resource(dir:'css/mobile-portal.css')}?v=543352345" rel="stylesheet" type="text/css" />
		
		<wx:registerJsapi queryString="wxPortal/myVouchers/${request.queryString }" apiList="'hideOptionMenu'"/>
		<script type="text/javascript">
			wx.ready(function () {
				wx.hideOptionMenu();
			});
		</script>
	</head>
	<body>

<div id="web_bg" style="position:absolute; width:100%; height:100%; z-index:-1"> 
<img style="position:fixed;" src="${resource(dir:'images/bg-s-2015.jpg')}" height="100%" width="100%" /> 
</div>

<div class="header">
&nbsp;<br />
 </div><br />
<div class="content">
<h2>我的红包</h2> 
奖品
<table width="95%" border="0" cellpadding="10" cellspacing="0" class="mytable">
<g:each in="${vouchers }" var="voucher">
	<tr>
		<td colspan="2" style="padding:4px;background:#83c6f3; color:#fff; border:1px #fff solid;">${voucher.name }</td>
	</tr>
	<tr>
		<td>编号</td>
		<td>${voucher.status == VoucherStatus.ACTIVED?"":"<del>"}${voucher.fullSn}${voucher.status == VoucherStatus.ACTIVED?"":"</del>"}</td>
	</tr>
	<tr>
		<td>有效期</td>
		<td>${formatDate(date:voucher.availableBeginAt,format:'yyyy-MM-dd') }~
	    	${formatDate(date:voucher.availableEndAt,format:'yyyy-MM-dd') }</td>
	</tr>
	<tr>
		<td>金额</td>
		<td>${voucher.amount }</td>
	</tr>
	<tr>
		<td>状态</td>
		<td>${voucher.status }</td>
	</tr>
	<tr>
		<td>详情</td>
		<td>${voucher.info }</td>
	</tr>
</g:each>
</table>

<p class="textBox">
<b>活动说明说明：</b><br/>
${KeyedMessage.findByKey("2015-voucher-description")?.message }
</p>

</div>
</body>
</html>