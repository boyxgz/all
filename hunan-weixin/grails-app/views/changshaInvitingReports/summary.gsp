
<%@page import="com.surelution.wxmp.jx.ChangshaSubscribingGift.GiftChannel"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reports.label', default: 'Voucher')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-voucher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-voucher" style="overflow: scroll;height: 600px">
			<table>
				<thead>
					<tr>
						<th>编号</th>
						<th>加油站</th>
						<th>个数</th>
					</tr>
				</thead>
				<tbody>
				<g:if test="${gifts}">
					<g:each in="${gifts}" status="i" var="gift">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>${i + 1 }</td>
							<td>${gift[0].name}</td>
						
							<td>${gift[1]}</td>
						</tr>
					</g:each>
				</g:if>
				<tr>
					<td colspan="2">合计</td>
					<td>${gifts.sum{it[1]} }</td>
				</tr>
				</tbody>
			</table>
		</div>
	</body>
</html>
