
<%@ page import="com.surelution.wxmp.jx.ThirdpartTakingOn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'thirdpartTakingOn.label', default: 'ThirdpartTakingOn')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-thirdpartTakingOn" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-thirdpartTakingOn" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'thirdpartTakingOn.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="linkMan" title="${message(code: 'thirdpartTakingOn.linkMan.label', default: 'Link Man')}" />
					
						<g:sortableColumn property="production" title="${message(code: 'thirdpartTakingOn.production.label', default: 'Production')}" />
					
						<g:sortableColumn property="tel" title="${message(code: 'thirdpartTakingOn.tel.label', default: 'Tel')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${thirdpartTakingOnInstanceList}" status="i" var="thirdpartTakingOnInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${thirdpartTakingOnInstance.id}">${fieldValue(bean: thirdpartTakingOnInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: thirdpartTakingOnInstance, field: "production")}</td>
					
						<td>${fieldValue(bean: thirdpartTakingOnInstance, field: "linkMan")}</td>
					
						<td>${fieldValue(bean: thirdpartTakingOnInstance, field: "tel")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${thirdpartTakingOnInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
