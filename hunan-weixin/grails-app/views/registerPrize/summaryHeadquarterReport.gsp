
<%@ page import="com.surelution.wxmp.jx.RegisterPrize" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registerPrize。summaryHeadquarterReport.label', default: 'RegisterPrize')}" />
		<title><g:message code="registerPrize。summaryHeadquarterReport.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-registerPrize" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		
		
		<div>
			<h1><g:message code="registerPrize。summaryHeadquarterReport.label" args="[entityName]" /></h1>
		</div>
		
		
		<div id="list-registerPrize">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<th><g:message code="gasStation.label" default="Gas Station" /></th>
						<th>总数</th>
						<th>昨日新增数量</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${result}" status="i" var="registerPrizeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${registerPrizeInstance.key.name}</td>
					
						<td>${registerPrizeInstance.total}</td>
						<td>${registerPrizeInstance.yesterday}</td>
					
					</tr>
				</g:each>
				
				
					<tr style="background-color: gray">
						<td>汇总</td>
					
						<td>${result?.sum{it.total}}</td>
						<td>${result?.sum{it.yesterday}}</td>
					
					</tr>
				
				</tbody>
			</table>
		</div>
	</body>
</html>
