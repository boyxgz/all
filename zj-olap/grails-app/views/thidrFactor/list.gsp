
<%@ page import="com.surelution.zjolap.ThidrFactor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'thidrFactor.label', default: 'ThidrFactor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-thidrFactor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-thidrFactor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="branch" title="${message(code: 'thidrFactor.branch.label', default: 'Branch')}" />
					
						<g:sortableColumn property="influncedAt" title="${message(code: 'thidrFactor.influncedAt.label', default: 'Influnced At')}" />
					
						<th><g:message code="thidrFactor.type.label" default="Type" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'thidrFactor.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${thidrFactorInstanceList}" status="i" var="thidrFactorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${thidrFactorInstance.id}">
						<g:if test="${thidrFactorInstance?.branch}">${thidrFactorInstance?.branch.name}</g:if>
							<g:else>全省</g:else></g:link></td>
					
						<td><g:formatDate date="${thidrFactorInstance.influncedAt}" format="yyyy-MM-dd"/></td>
					
						<td>${thidrFactorInstance.type?.name}</td>
					
						<td>${fieldValue(bean: thidrFactorInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${thidrFactorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
