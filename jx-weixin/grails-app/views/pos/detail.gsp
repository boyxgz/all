
<%@page import="com.surelution.wxmp.jx.Voucher"%>
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.wxmp.jx.Prize" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>POS</title>
		
		<script type="text/javascript">

	    function printIt() {
		    var url = "${createLink(controller:'pos', action:'print')}/" + "${voucher.sn}";
	        var mywindow = window.open(url, "打印", "width=300,height=400,left=10,top=20,location=yes,status=yes");
	    }

	    function returnBack() {
	    	document.location.href = "${createLink(controller:'pos', action:'index')}"
		}
	    
		</script>
		
	</head>
	<body>
		<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
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
				<td>状态：</td>
				<td>${ voucher.status}</td>
			</tr>
			<g:if test="${voucher.status == Voucher.VoucherStatus.ACTIVED }">
			<tr>
				<td colspan="2" align="center"><input type="button" value="打印" onclick="printIt()"></td>
			</tr>
			</g:if>
			<tr>
				<td colspan="2" align="center"><input type="button" value="返回" onclick="returnBack()"></td>
			</tr>
			
		</table>
	
	</body>
</html>
