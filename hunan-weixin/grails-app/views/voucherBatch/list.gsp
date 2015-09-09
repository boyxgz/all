
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
					
						<g:sortableColumn property="amount" title="${message(code: 'voucherBatch.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="countDaily" title="${message(code: 'voucherBatch.countDaily.label', default: 'Count Daily')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'voucherBatch.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="eventName" title="${message(code: 'voucherBatch.eventName.label', default: 'Event Name')}" />
					
						<g:sortableColumn property="key" title="${message(code: 'voucherBatch.key.label', default: 'Key')}" />
					
						<g:sortableColumn property="luckyNum" title="${message(code: 'voucherBatch.luckyNum.label', default: 'Lucky Num')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${voucherBatchInstanceList}" status="i" var="voucherBatchInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${voucherBatchInstance.id}">${fieldValue(bean: voucherBatchInstance, field: "amount")}</g:link></td>
					
						<td>${fieldValue(bean: voucherBatchInstance, field: "countDaily")}</td>
					
						<td>${fieldValue(bean: voucherBatchInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: voucherBatchInstance, field: "eventName")}</td>
					
						<td>${fieldValue(bean: voucherBatchInstance, field: "key")}</td>
					
						<td>${fieldValue(bean: voucherBatchInstance, field: "luckyNum")}</td>
					
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
