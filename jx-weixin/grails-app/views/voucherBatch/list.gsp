
<%@ page import="com.surelution.wxmp.jx.VoucherBatch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'voucherBatch.label', default: 'VoucherBatch')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-voucherBatch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-voucherBatch" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'voucherBatch.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'voucherBatch.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'voucherBatch.price.label', default: 'Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${voucherBatchInstanceList}" status="i" var="voucherBatchInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${voucherBatchInstance.id}">${fieldValue(bean: voucherBatchInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: voucherBatchInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: voucherBatchInstance, field: "price")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${voucherBatchInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
