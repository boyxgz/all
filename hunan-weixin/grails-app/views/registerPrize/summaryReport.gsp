
<%@ page import="com.surelution.wxmp.jx.RegisterPrize" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'report.summayrReport.label', default: 'RegisterPrize')}" />
		<title><g:message code="report.summayrReport.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-registerPrize" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		
		
		<div>
			<h1><g:message code="report.summayrReport.label" args="[entityName]" /></h1>
			<g:form action="summaryReport">
				<fieldset class="form">
				
				<div class="fieldcontain">
					<label for="awardedAtFrom">
						所属公司
						
					</label>
					<g:select name="branch.id" id="branch" from="${branches }" optionKey="id" value="${params['branch.id'] }" optionValue="name"/>
				</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="search" value="查询" />
				</fieldset>
			</g:form>
		</div>
		
		
		<div id="list-registerPrize" style="overflow: auto;height: 570px">
			<h1><g:message code="report.summayrReport.label" args="[entityName]" /></h1>
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
					<g:set var="station" value="${registerPrizeInstance.key}"></g:set>
						<td>${station?.district?.branch?.name}&gt;&gt;${station?.district?.name}&gt;&gt;${station?.name}</td>
					
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
