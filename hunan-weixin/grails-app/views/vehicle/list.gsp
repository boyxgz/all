
<%@ page import="com.surelution.wxmp.jx.Vehicle" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vehicle.label', default: 'Vehicle')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vehicle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vehicle" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="engineId" title="${message(code: 'vehicle.engineId.label', default: 'Engine Id')}" />
					
						<th><g:message code="vehicle.subscriber.label" default="Subscriber" /></th>
					
						<th><g:message code="vehicle.type.label" default="Type" /></th>
					
						<g:sortableColumn property="vId" title="${message(code: 'vehicle.vId.label', default: 'VI d')}" />
					
						<g:sortableColumn property="vNo" title="${message(code: 'vehicle.vNo.label', default: 'VN o')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vehicleInstanceList}" status="i" var="vehicleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vehicleInstance.id}">${fieldValue(bean: vehicleInstance, field: "engineId")}</g:link></td>
					
						<td>${fieldValue(bean: vehicleInstance, field: "subscriber")}</td>
					
						<td>${fieldValue(bean: vehicleInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: vehicleInstance, field: "vId")}</td>
					
						<td>${fieldValue(bean: vehicleInstance, field: "vNo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vehicleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
