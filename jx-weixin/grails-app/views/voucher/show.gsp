
<%@ page import="com.surelution.wxmp.jx.Voucher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'voucher.label', default: 'Voucher')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-voucher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-voucher" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list voucher">
			
				<g:if test="${voucherInstance?.sn}">
				<li class="fieldcontain">
					<span id="sn-label" class="property-label"><g:message code="voucher.sn.label" default="Sn" /></span>
					
						<span class="property-value" aria-labelledby="sn-label"><g:fieldValue bean="${voucherInstance}" field="sn"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voucherInstance?.cashier}">
				<li class="fieldcontain">
					<span id="cashier-label" class="property-label"><g:message code="voucher.cashier.label" default="Cashier" /></span>
					
						<span class="property-value" aria-labelledby="cashier-label"><g:link controller="user" action="show" id="${voucherInstance?.cashier?.id}">${voucherInstance?.cashier?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${voucherInstance?.paidAt}">
				<li class="fieldcontain">
					<span id="paidAt-label" class="property-label"><g:message code="voucher.paidAt.label" default="Paid At" /></span>
					
						<span class="property-value" aria-labelledby="paidAt-label"><g:formatDate date="${voucherInstance?.paidAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${voucherInstance?.batch}">
				<li class="fieldcontain">
					<span id="batch-label" class="property-label"><g:message code="voucher.batch.label" default="Batch" /></span>
					
						<span class="property-value" aria-labelledby="batch-label"><g:link controller="voucherBatch" action="show" id="${voucherInstance?.batch?.id}">${voucherInstance?.batch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${voucherInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="voucher.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${voucherInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${voucherInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="voucher.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${voucherInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voucherInstance?.subscriber}">
				<li class="fieldcontain">
					<span id="subscriber-label" class="property-label"><g:message code="voucher.subscriber.label" default="Subscriber" /></span>
					
						<span class="property-value" aria-labelledby="subscriber-label"><g:link controller="subscriber" action="show" id="${voucherInstance?.subscriber?.id}">${voucherInstance?.subscriber?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${voucherInstance?.id}" />
					<g:link class="edit" action="edit" id="${voucherInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
