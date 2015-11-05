
<%@ page import="com.surelution.zjolap.WarningRule" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'warningRule.label', default: 'WarningRule')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-warningRule" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div id="list-warningRule" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="warningRule.branch.label" default="Branch" /></th>
					
					
						<th><g:message code="warningRule.category.label" default="Category" /></th>
						<th><g:message code="warningRule.gasType.label" default="Gas Type" /></th>
						
					
						<g:sortableColumn property="type" title="${message(code: 'warningRule.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="value" title="${message(code: 'warningRule.value.label', default: 'Value')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${warningRuleInstanceList}" status="i" var="warningRuleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${warningRuleInstance.id}">${warningRuleInstance?.branch?.name}</g:link></td>
					
						<td>${warningRuleInstance.gasType?.category?.name}</td>
						<td>${warningRuleInstance.gasType?.name}</td>
					
						<td>${fieldValue(bean: warningRuleInstance, field: "typeName")}</td>
					
						<td>${fieldValue(bean: warningRuleInstance, field: "value")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="paginateButtons" id="paginateButtons">
				<g:paginate total="${warningRuleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
