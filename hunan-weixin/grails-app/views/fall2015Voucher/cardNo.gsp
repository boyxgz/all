
<%@page import="com.surelution.wxmp.jx.Fall2015DrawPrizeTicket"%>
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.wxmp.jx.Fall2015Voucher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fall2015Voucher.label', default: 'Fall2015Voucher')}" />
		<title>${id }的全部抽奖信息</title>
	</head>
	<body>
		<a href="#list-fall2015Voucher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-fall2015Voucher" class="content scaffold-create">
			<table>
				<thead>
					<tr>
					
						<th>小票</th>
					
						<th>微信账号</th>
					
						<th>金额</th>
					
						<th>中奖信息</th>
					
						<th>奖品状态</th>
					
						<th>小票上传日期</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${receipts}" status="i" var="fall2015ReceiptInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<%
						def ticket = Fall2015DrawPrizeTicket.findByFreceipt(fall2015ReceiptInstance)
						def voucher
						if(ticket) {
							voucher = Fall2015Voucher.findByTicket(ticket)
						}
						def ui = UserInfo.loadUserInfo(fall2015ReceiptInstance.subscriber.openId)
					 %>
					
						<td>
							<img src="${createLink(controller:'fall2015Voucher', action:'receiptPic', id:fall2015ReceiptInstance.id) }" width="320" height="320">
						</td>
					
						<td><img src="${ui.headImgUrl }" width="80" height="80"><br/>${ui.nickname}</td>
					
						<td>${fieldValue(bean: fall2015ReceiptInstance, field: "amount")}</td>
					
						<td>${voucher?voucher.batch.name:"没有中奖"}</td>
					
						<td>${voucher?voucher.reviewStatus:"/"}</td>
					
						<td><g:formatDate date="${fall2015ReceiptInstance.dateCreated}" format="yyyy-MM-dd HH:mm:ss"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
