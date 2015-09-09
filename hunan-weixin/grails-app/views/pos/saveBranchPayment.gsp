
<!DOCTYPE html>
<%@page import="com.surelution.wxmp.jx.Voucher.VoucherStatus"%>
<html>
	<head>
		<meta name="layout" content="main">
		<title>POS</title>
		<script type="text/javascript">
		    function printIt2() {
			    var mobileNo = document.getElementById("mobileNo").value
			    if(!(/^1[3|4|5|8][0-9]\d{8}$/.test(mobileNo))){ 
			        alert("不是完整的11位手机号"); 
			        document.getElementById("mobileNo").focus(); 
			        return false; 
			    }
			    var url = "${createLink(controller:'pos', action:'print')}/${gift?.sn}?mobileNo=" + mobileNo;
		        window.open(url, "打印", "width=300,height=400,left=10,top=20,location=yes,status=yes");
		        gotoSearchForm();
		    }
		    function printIt() {
		    	var url = "${createLink(controller:'pos', action:'print')}/${voucher?.fullSn}";
		        window.open(url, "打印", "width=300,height=400,left=10,top=20,location=yes,status=yes");
		        gotoSearchForm();
			}

		    function gotoSearchForm() {
				var url = "${createLink(controller:'pos', action='index')}";
				document.location.href = url;
			}
		</script>
	</head>
	<body>
		<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:form action="saveBranchPayment">
		<g:hiddenField name="fullSn" value="${voucher?.fullSn }"/>
			<table>
				<tr>
					<td align="right">兑奖编号：</td>
					<td>${voucher?.fullSn }</td>
				</tr>
				<tr>
					<td align="right">奖品状态：</td>
					<td>${voucher?.status }</td>
				</tr>
				<tr>
					<td align="right">礼品类型：</td>
					<td>${voucher?.info }</td>
				</tr>
				<tr>
					<td align="right">礼品价值：</td>
					<td>${voucher?.amount } &nbsp;元</td>
				</tr>
				<tr>
					<td align="right">销账代码：</td>
					<td>${payment?.id }</td>
				</tr>
				<tr>
					<td align="right">客户身份证号：</td>
					<td>${payment?.customerSid }</td>
				</tr>
				<tr>
					<td align="right">加油卡充值卡号：</td>
					<td>${payment?.rechargeTo }</td>
				</tr>
				<tr>
					<td align="right">充值金额：</td>
					<td>${payment?.rechargeAmount }</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="返回" onclick="gotoSearchForm()">
					</td>
				</tr>
			</table>
		</g:form>
	</body>
</html>
