
<%@ page import="com.surelution.wxmp.jx.SubscribingFrom" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subscribingFrom.label', default: 'SubscribingFrom')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subscribingFrom" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subscribingFrom" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="comeFrom" title="${message(code: 'subscribingFrom.comeFrom.label', default: 'Come From')}" />
					
						<th><g:message code="subscribingFrom.gasStation.label" default="Gas Station" /></th>
					
						<th><g:message code="subscribingFrom.branch.label" default="Branch" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'subscribingFrom.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'subscribingFrom.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subscribingFromInstanceList}" status="i" var="subscribingFromInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subscribingFromInstance.id}">${fieldValue(bean: subscribingFromInstance, field: "comeFrom")}</g:link></td>
					
						<td>${fieldValue(bean: subscribingFromInstance, field: "gasStation")}</td>
					
						<td>${fieldValue(bean: subscribingFromInstance, field: "branch")}</td>
					
						<td>${fieldValue(bean: subscribingFromInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: subscribingFromInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subscribingFromInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
