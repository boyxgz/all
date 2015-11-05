
<%@ page import="com.surelution.zjolap.CustomerType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customerType.label', default: 'CustomerType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-customerType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div id="list-customerType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<%--<g:sortableColumn property="id" title="${message(code: 'customerType.id.label', default: 'Id')}" /> --%>
					
						<th><g:message code="customerType.name.label" default="Name" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerTypeInstanceList}" status="i" var="customerTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<%--<td><g:link action="show" id="${customerTypeInstance.id}">${fieldValue(bean: customerTypeInstance, field: "id")}</g:link></td>
					
						--%><td><g:link action="show" id="${customerTypeInstance.id}">${fieldValue(bean: customerTypeInstance, field: "name")}</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="paginateButtons">
				<g:paginate total="${customerTypeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
