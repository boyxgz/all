
<%@ page import="com.surelution.wxmp.jx.Voucher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'voucher.label', default: 'Voucher')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-voucher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-voucher" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="sn" title="${message(code: 'voucher.sn.label', default: 'Sn')}" />
					
						<th><g:message code="voucher.cashier.label" default="Cashier" /></th>
					
						<g:sortableColumn property="paidAt" title="${message(code: 'voucher.paidAt.label', default: 'Paid At')}" />
					
						<th><g:message code="voucher.batch.label" default="Batch" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'voucher.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'voucher.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${voucherInstanceList}" status="i" var="voucherInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${voucherInstance.id}">${fieldValue(bean: voucherInstance, field: "sn")}</g:link></td>
					
						<td>${fieldValue(bean: voucherInstance, field: "cashier.username")}</td>
					
						<td><g:formatDate date="${voucherInstance.paidAt}" format="yyyy-MM-dd HH:mm:ss"/></td>
					
						<td>${fieldValue(bean: voucherInstance, field: "batch.name")}</td>
					
						<td><g:formatDate date="${voucherInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: voucherInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${voucherInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
