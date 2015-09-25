
<%@ page import="com.surelution.wxmp.jx.Prize" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>POS</title>
		<script type="text/javascript" src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
		<script type="text/javascript">
			var interv;
			function loadQr(pId) {
				$("#imgQr").attr("src","${createLink(controller:'pos', action:'loadQr')}/" + pId);
				interv = setInterval(loadUser,2000);
			}
			function loadUser() {
				var tempPaymentId = $("#tempPaymentId").val();
				$.getJSON( "${createLink(controller:'pos', action:'currentClient')}/" + tempPaymentId, function( data ) {
					if(data.client.openId != null) {
						clearInterval(interv);
						if(data.client.status != 1) {
							alert("客户余额不足");
							$("#amount").removeAttr("readonly");
							$("#amount").focus();
							$("#tempPaymentId").val("");
							return;
						}
						$("#subscriberId").val(data.client.subscriberId);
						$("#tempPaymentId").val(tempPaymentId);
						$("#imgQr").attr("src", "${createLink(controller:'subscriber', action:'headImg')}/" + data.client.subscriberId);
						$("#txtNickName").val(data.client.nickName);
						alert("系统已把授权码发至客户微信，请填入授权码");
						$("#payToken").focus();
					}
				}
				);
			}

			function fetchPayToken() {
				var amount = $("#amount").val();
				
				if(!$.isNumeric(amount)) {
					alert("请先填入金额！");
					$("#amount").focus();
					return;
				}
				$("#amount").attr("readonly","readonly");
				$.getJSON( "${createLink(controller:'pos', action:'sendPayToken')}", 
						{ amount: amount } )
					.done(function( data ) {
						$("#tempPaymentId").val(data.payment.tempPaymentId);
						loadQr(data.payment.qrSn);
						loadUser(data.payment.tempPaymentId);
					  });
			}

			function verifyCheckOut() {
				if($("#subscriberId").val() == "") {
					alert("请先让客户扫描二维码！");
					return false;
				}
				var amount = $("#amount").val();
				if(!$.isNumeric(amount)) {
					alert("请先填入金额！");
					$("#amount").focus();
					return false;
				}
				if($("#payToken").val() == "") {
					alert("请填入授权码");
					$("#payToken").focus();
					return false;
				}
				return true;
			}
		</script>
	</head>
	<body>
		<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
	<table>
		<tr>
			<td>
				<img alt="" src="" id="imgQr" width="300" height="300"><br/>
				用户昵称：<input type="text" readonly="readonly" id="txtNickName">
			</td>
			<td>
			<g:form action="checkout" controller="pos" onsubmit="return verifyCheckOut();">
			<g:hiddenField name="subscriberId"/>
			<g:hiddenField name="tempPaymentId"/>
				<table>
					<tr>
						<td align="right">金额：</td>
						<td><g:textField name="amount"/></td>
					</tr>
					<tr>
						<td align="right">授权码：</td>
						<td><g:textField name="payToken" width="5" /><input type="button" value="刷微信" onclick="fetchPayToken()"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<g:submitButton name="create" class="save" value="结账" />
						</td>
					</tr>
				</table>
			</g:form>
			</td>
		</tr>
	</table>
	
	</body>
</html>
