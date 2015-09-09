
<%@ page import="com.surelution.wxmp.jx.DrawPrizeVoucher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'drawPrizeVoucher.label', default: 'DrawPrizeVoucher')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-drawPrizeVoucher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-drawPrizeVoucher" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list drawPrizeVoucher">
			
				<g:if test="${drawPrizeVoucherInstance?.paiedAt}">
				<li class="fieldcontain">
					<span id="paiedAt-label" class="property-label"><g:message code="drawPrizeVoucher.paiedAt.label" default="Paied At" /></span>
					
						<span class="property-value" aria-labelledby="paiedAt-label"><g:formatDate date="${drawPrizeVoucherInstance?.paiedAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawPrizeVoucherInstance?.whoPaied}">
				<li class="fieldcontain">
					<span id="whoPaied-label" class="property-label"><g:message code="drawPrizeVoucher.whoPaied.label" default="Who Paied" /></span>
					
						<span class="property-value" aria-labelledby="whoPaied-label"><g:link controller="user" action="show" id="${drawPrizeVoucherInstance?.whoPaied?.id}">${drawPrizeVoucherInstance?.whoPaied?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawPrizeVoucherInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="drawPrizeVoucher.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="subscriber" action="show" id="${drawPrizeVoucherInstance?.owner?.id}">${drawPrizeVoucherInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawPrizeVoucherInstance?.availableBeginAt}">
				<li class="fieldcontain">
					<span id="availableBeginAt-label" class="property-label"><g:message code="drawPrizeVoucher.availableBeginAt.label" default="Available Begin At" /></span>
					
						<span class="property-value" aria-labelledby="availableBeginAt-label"><g:formatDate date="${drawPrizeVoucherInstance?.availableBeginAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawPrizeVoucherInstance?.fullSn}">
				<li class="fieldcontain">
					<span id="fullSn-label" class="property-label"><g:message code="drawPrizeVoucher.fullSn.label" default="Full Sn" /></span>
					
						<span class="property-value" aria-labelledby="fullSn-label"><g:fieldValue bean="${drawPrizeVoucherInstance}" field="fullSn"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawPrizeVoucherInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="drawPrizeVoucher.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${drawPrizeVoucherInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawPrizeVoucherInstance?.availableEndAt}">
				<li class="fieldcontain">
					<span id="availableEndAt-label" class="property-label"><g:message code="drawPrizeVoucher.availableEndAt.label" default="Available End At" /></span>
					
						<span class="property-value" aria-labelledby="availableEndAt-label"><g:formatDate date="${drawPrizeVoucherInstance?.availableEndAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawPrizeVoucherInstance?.batch}">
				<li class="fieldcontain">
					<span id="batch-label" class="property-label"><g:message code="drawPrizeVoucher.batch.label" default="Batch" /></span>
					
						<span class="property-value" aria-labelledby="batch-label"><g:link controller="voucherBatch" action="show" id="${drawPrizeVoucherInstance?.batch?.id}">${drawPrizeVoucherInstance?.batch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawPrizeVoucherInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="drawPrizeVoucher.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${drawPrizeVoucherInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawPrizeVoucherInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="drawPrizeVoucher.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${drawPrizeVoucherInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawPrizeVoucherInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="drawPrizeVoucher.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${drawPrizeVoucherInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawPrizeVoucherInstance?.ticket}">
				<li class="fieldcontain">
					<span id="ticket-label" class="property-label"><g:message code="drawPrizeVoucher.ticket.label" default="Ticket" /></span>
					
						<span class="property-value" aria-labelledby="ticket-label"><g:link controller="drawPrizeTicket" action="show" id="${drawPrizeVoucherInstance?.ticket?.id}">${drawPrizeVoucherInstance?.ticket?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${drawPrizeVoucherInstance?.id}" />
					<g:link class="edit" action="edit" id="${drawPrizeVoucherInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
