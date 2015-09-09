
<%@ page import="com.surelution.wxmp.jx.Subscribing" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subscribing.label', default: 'Subscribing')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subscribing" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subscribing" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="comeFrom" title="${message(code: 'subscribing.comeFrom.label', default: 'Come From')}" />
					
						<th>来源</th>
					
						<th>分公司</th>
					
						<th>加油站</th>
					
						<th><g:message code="subscribing.subscriber.label" default="Subscriber" /></th>
					
						<g:sortableColumn property="subscribingAt" title="${message(code: 'subscribing.subscribingAt.label', default: 'Subscribing At')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subscribingInstanceList}" status="i" var="subscribingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subscribingInstance.id}">${fieldValue(bean: subscribingInstance, field: "comeFrom")}</g:link></td>
					
						<td>${subscribingInstance.sf.name}</td>
					
						<td>${subscribingInstance.sf.branch?.name}</td>
					
						<td>${subscribingInstance.sf.gasStation?.name}</td>
					
						<td>${fieldValue(bean: subscribingInstance, field: "subscriber")}</td>
					
						<td><g:formatDate date="${subscribingInstance.subscribingAt}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subscribingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
