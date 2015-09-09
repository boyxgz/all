
<%@ page import="com.surelution.wxmp.jx.VoucherBatch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'voucherBatch.label', default: 'VoucherBatch')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-voucherBatch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-voucherBatch" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list voucherBatch">
			
				<g:if test="${voucherBatchInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="voucherBatch.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${voucherBatchInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voucherBatchInstance?.countDaily}">
				<li class="fieldcontain">
					<span id="countDaily-label" class="property-label"><g:message code="voucherBatch.countDaily.label" default="Count Daily" /></span>
					
						<span class="property-value" aria-labelledby="countDaily-label"><g:fieldValue bean="${voucherBatchInstance}" field="countDaily"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voucherBatchInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="voucherBatch.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${voucherBatchInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voucherBatchInstance?.eventName}">
				<li class="fieldcontain">
					<span id="eventName-label" class="property-label"><g:message code="voucherBatch.eventName.label" default="Event Name" /></span>
					
						<span class="property-value" aria-labelledby="eventName-label"><g:fieldValue bean="${voucherBatchInstance}" field="eventName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voucherBatchInstance?.key}">
				<li class="fieldcontain">
					<span id="key-label" class="property-label"><g:message code="voucherBatch.key.label" default="Key" /></span>
					
						<span class="property-value" aria-labelledby="key-label"><g:fieldValue bean="${voucherBatchInstance}" field="key"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voucherBatchInstance?.luckyNum}">
				<li class="fieldcontain">
					<span id="luckyNum-label" class="property-label"><g:message code="voucherBatch.luckyNum.label" default="Lucky Num" /></span>
					
						<span class="property-value" aria-labelledby="luckyNum-label"><g:fieldValue bean="${voucherBatchInstance}" field="luckyNum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voucherBatchInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="voucherBatch.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${voucherBatchInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voucherBatchInstance?.priority}">
				<li class="fieldcontain">
					<span id="priority-label" class="property-label"><g:message code="voucherBatch.priority.label" default="Priority" /></span>
					
						<span class="property-value" aria-labelledby="priority-label"><g:fieldValue bean="${voucherBatchInstance}" field="priority"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${voucherBatchInstance?.id}" />
					<g:link class="edit" action="edit" id="${voucherBatchInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
