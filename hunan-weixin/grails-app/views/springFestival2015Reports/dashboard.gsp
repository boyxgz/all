
<%@ page import="com.surelution.wxmp.jx.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-user" class="content scaffold-list" style="overflow: auto;" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
			<table>
				<thead>
					<tr>
						<th>日期</th>
						<th>扫码新增关注</th>
						<th>推荐关注</th>
						<th>2元</th>
						<th>6元</th>
						<th>66元</th>
						<th>168元</th>
						<th>1688元</th>
						<th>1999元</th>
						<th>888元</th>
						<th>666元</th>
						<th>66元</th>
						<th>6元</th>
						<th>1999元</th>
						<th>666元</th>
						<th>200元</th>
						<th>66元</th>
						<th>加油卡号</th>
						<th>小票号</th>
						<th>发票号</th>
						<th>2元红包</th>
						<th>推荐2位好友</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${vos}" status="i" var="vo">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:formatDate date="${vo[0].label }" format="yyyy-MM-dd"/></td>
						<td>${vo[1].scanSubscribing }</td>
						<td>${vo[1].invitSubscribing }</td>
						<td>${vo[1].payment2 }</td>
						<td>${vo[1].payment6 }</td>
						<td>${vo[1].payment66 }</td>
						<td>${vo[1].payment168 }</td>
						<td>${vo[1].payment1688 }</td>
						<td>${vo[1].paymento1999 }</td>
						<td>${vo[1].paymento888 }</td>
						<td>${vo[1].paymento666 }</td>
						<td>${vo[1].paymento66 }</td>
						<td>${vo[1].paymento6 }</td>
						
						<td>${vo[1].paymentTop1999 }</td>
						<td>${vo[1].paymentTop666 }</td>
						<td>${vo[1].paymentTop200 }</td>
						<td>${vo[1].paymentTop66 }</td>
						
						<td>${vo[1].drawWithCard }</td>
						<td>${vo[1].drawWithReceipt }</td>
						<td>${vo[1].drawWithInvioce }</td>
						<td>${vo[1].drawWithVoucher }</td>
						<td>${vo[1].drawWithInviting }</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
