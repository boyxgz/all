
<%@ page import="com.surelution.wxmp.jx.Employee" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-employee" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="certified" title="${message(code: 'employee.certified.label', default: 'Certified')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'employee.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="codeExpiredAt" title="${message(code: 'employee.codeExpiredAt.label', default: 'Code Expired At')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'employee.name.label', default: 'Name')}" />
					
						<th><g:message code="employee.subscriber.label" default="Subscriber" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${employeeInstanceList}" status="i" var="employeeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${employeeInstance.id}">${fieldValue(bean: employeeInstance, field: "certified")}</g:link></td>
					
						<td>${fieldValue(bean: employeeInstance, field: "code")}</td>
					
						<td><g:formatDate date="${employeeInstance.codeExpiredAt}" /></td>
					
						<td>${fieldValue(bean: employeeInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "subscriber")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${employeeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
