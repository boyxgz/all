
<%@ page import="com.surelution.zjolap.CustomerTypeLevel2" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customerTypeLevel2.label', default: 'CustomerTypeLevel2')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-customerTypeLevel2" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div id="list-customerTypeLevel2" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<%--<th><g:message code="customerType2.id" default="Id" /></th>
						
						
						--%>
						
						<g:sortableColumn property="name" title="名称" />
						<th><g:message code="customerTypeLevel2.label" default="Level1" /></th>
					
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerTypeLevel2InstanceList}" status="i" var="customerTypeLevel2Instance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
						<%--<td>${fieldValue(bean: customerTypeLevel2Instance, field: "id")}</td>
					
						--%><td><g:link action="show" id="${customerTypeLevel2Instance.id}">${fieldValue(bean: customerTypeLevel2Instance, field: "name")}</g:link></td>
					
						<td>${customerTypeLevel2Instance?.level1?.name}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="paginateButtons">
				<g:paginate total="${customerTypeLevel2InstanceTotal}" />
			</div>
		</div>
	</body>
</html>
