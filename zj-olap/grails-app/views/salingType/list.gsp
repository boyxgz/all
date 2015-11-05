
<%@ page import="com.surelution.zjolap.SalingType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'salingType.label', default: 'SalingType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-salingType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div id="list-salingType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					
					<tr>
						<%--<th>Id</th>
						--%><g:sortableColumn property="name" title="${message(code: 'salingType.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${salingTypeInstanceList}" status="i" var="salingTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}"><%--
						<td>${fieldValue(bean: salingTypeInstance, field: "id")}</td>
						--%><td><g:link action="show" id="${salingTypeInstance.id}">${fieldValue(bean: salingTypeInstance, field: "name")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="paginateButtons">
				<g:paginate total="${salingTypeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
