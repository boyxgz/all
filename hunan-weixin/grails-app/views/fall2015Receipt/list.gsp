
<%@ page import="com.surelution.wxmp.jx.Fall2015Receipt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fall2015Receipt.label', default: 'Fall2015Receipt')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-fall2015Receipt" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-fall2015Receipt" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="fall2015Receipt.rule.label" default="Rule" /></th>
					
						<g:sortableColumn property="transNo" title="${message(code: 'fall2015Receipt.transNo.label', default: 'Trans No')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'fall2015Receipt.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="cardNo" title="${message(code: 'fall2015Receipt.cardNo.label', default: 'Card No')}" />
					
						<g:sortableColumn property="cardType" title="${message(code: 'fall2015Receipt.cardType.label', default: 'Card Type')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'fall2015Receipt.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fall2015ReceiptInstanceList}" status="i" var="fall2015ReceiptInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${fall2015ReceiptInstance.id}">${fieldValue(bean: fall2015ReceiptInstance, field: "rule")}</g:link></td>
					
						<td>${fieldValue(bean: fall2015ReceiptInstance, field: "transNo")}</td>
					
						<td>${fieldValue(bean: fall2015ReceiptInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: fall2015ReceiptInstance, field: "cardNo")}</td>
					
						<td>${fieldValue(bean: fall2015ReceiptInstance, field: "cardType")}</td>
					
						<td><g:formatDate date="${fall2015ReceiptInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fall2015ReceiptInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
