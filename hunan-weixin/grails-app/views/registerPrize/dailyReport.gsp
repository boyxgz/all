
<%@ page import="com.surelution.wxmp.jx.RegisterPrize" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registerPrize.dailyReport.label', default: 'RegisterPrize')}" />
		<title><g:message code="registerPrize.dailyReport.label" /></title>
	</head>
	<body>
		<a href="#list-registerPrize" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-registerPrize">
			<h1><g:message code="registerPrize.dailyReport.label" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					<th><g:message code="registerPrize.awardedAt.label" default="Awarded At" /></th>
						<th><g:message code="gasStation.label" default="Gas Station" /></th>
					
						<th>数量</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${registerPrizeInstanceList}" status="i" var="registerPrizeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:formatDate date="${registerPrizeInstance.key.date}" format="yyyy-MM-dd"/></td>
					<g:set var="station" value="${registerPrizeInstance.key.gasStation}"></g:set>
						<td>${station?.district?.branch?.shortName}&gt;&gt;${station?.district?.name}&gt;&gt;${station?.shortName}</td>
					
						<td>${registerPrizeInstance.count}</td>
					
					</tr>
				</g:each>
					<tr style="background-color: gray">
						<td>总数</td>
					
						<td colspan="2">${total }</td>
					
					</tr>
				</tbody>
			</table>
		</div>
	</body>
</html>
