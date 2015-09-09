
<%@page import="com.surelution.whistle.push.UserInfo"%>
<!DOCTYPE html>
<html>
	<head>
		<title>POS</title>
	</head>
	<body>
	<g:if test="${voucher != null }">
		<table>
			<tr>
				<td colspan="2" align="center">现金抵扣凭条</td>
			</tr>
			<tr>
				<td>时间：</td>
				<td><g:formatDate date="${new Date() }" format="yyyy-MM-dd HH:mm"/></td>
			</tr>
			<tr>
				<td>用户昵称：</td>
				<td>${ UserInfo.loadUserInfo(voucher.owner.openId).nickname}</td>
			</tr>
			<tr>
				<td>礼品：</td>
				<td>${voucher?.info }</td>
			</tr>
			<tr>
				<td>礼品价值：</td>
				<td>${voucher?.amount } &nbsp;元</td>
			</tr>
			<tr>
				<td>兑奖编号：</td>
				<td>${voucher?.fullSn }</td>
			</tr>
			<tr>
				<td>收银员签名：</td>
				<td><sec:username/></td>
			</tr>
			<tr>
				<td>客户签名：</td>
				<td></td>
			</tr>
			
		</table>
	</g:if>
	</body>
	<script type="text/javascript">
		window.print();
		window.close();
	</script>
</html>
