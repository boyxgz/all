
<%@ page import="com.surelution.wxmp.jx.ChangshaSubscribingGiftType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'changshaSubscribingGiftType.label', default: 'ChangshaSubscribingGiftType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-changshaSubscribingGiftType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-changshaSubscribingGiftType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="key" title="${message(code: 'changshaSubscribingGiftType.key.label', default: 'Key')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'changshaSubscribingGiftType.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'changshaSubscribingGiftType.price.label', default: 'Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${changshaSubscribingGiftTypeInstanceList}" status="i" var="changshaSubscribingGiftTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${changshaSubscribingGiftTypeInstance.id}">${fieldValue(bean: changshaSubscribingGiftTypeInstance, field: "key")}</g:link></td>
					
						<td>${fieldValue(bean: changshaSubscribingGiftTypeInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: changshaSubscribingGiftTypeInstance, field: "price")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${changshaSubscribingGiftTypeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
