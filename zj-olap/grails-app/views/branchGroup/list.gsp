
<%@ page import="com.surelution.zjolap.BranchGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'branchGroup.label', default: 'BranchGroup')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-branchGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="['公司组']" /></g:link></span>
		</div>
		<div id="list-branchGroup" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="['公司组']" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr><%--
					    <g:sortableColumn property="id" title="${message(code: 'branchGroup.id.label', default: 'id')}" />
					    --%><g:sortableColumn property="name" title="${message(code: 'branchGroup.name.label', default: 'Name')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${branchGroupInstanceList}" status="i" var="branchGroupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<%--<td>${fieldValue(bean: branchGroupInstance, field: "id")}</td>
						--%><td><g:link action="show" id="${branchGroupInstance.id}">${fieldValue(bean: branchGroupInstance, field: "name")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${branchGroupInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
