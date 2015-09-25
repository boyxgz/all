
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.wxmp.jx.Prize" %>
<!DOCTYPE html>
<html>
	<head>
		<title>POS</title>
	</head>
	<body>
	<g:if test="${voucher != null }">
		<table>
			<tr>
				<td colspan="2" align="center">验证码凭条</td>
			</tr>
			<tr>
				<td>时间：</td>
				<td><g:formatDate date="${new Date() }" format="yyyy-MM-dd HH:mm"/></td>
			</tr>
			<tr>
				<td>用户昵称：</td>
				<td>${ UserInfo.loadUserInfo(voucher.subscriber.openId).nickname}</td>
			</tr>
			<tr>
				<td>活动：</td>
				<td>${ voucher.batch.name}</td>
			</tr>
			<tr>
				<td>商品：</td>
				<td>${ voucher.batch.production}</td>
			</tr>
			<tr>
				<td>验证码：</td>
				<td>${voucher.sn }</td>
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
