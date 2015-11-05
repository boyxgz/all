
<%@ page import="com.surelution.zjolap.GasType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gasType.label', default: 'GasType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-gasType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div id="list-gasType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<%--<g:sortableColumn property="id" title="${message(code: 'gasType.id.label', default: 'Id')}" />
					
						--%><th><g:message code="gasType.category.label" default="Category" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'gasType.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gasTypeInstanceList}" status="i" var="gasTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<%--<td>${gasTypeInstance.id}</td>
					
						--%><td><g:link action="show" id="${gasTypeInstance.id}">${gasTypeInstance.category.name}</g:link></td>
					
						<td>${fieldValue(bean: gasTypeInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="paginateButtons">
				<g:paginate total="${gasTypeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
