
<%@ page import="com.surelution.wxmp.jx.Fall2015Receipt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fall2015Receipt.label', default: 'Fall2015Receipt')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-fall2015Receipt" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-fall2015Receipt" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list fall2015Receipt">
			
				<g:if test="${fall2015ReceiptInstance?.rule}">
				<li class="fieldcontain">
					<span id="rule-label" class="property-label"><g:message code="fall2015Receipt.rule.label" default="Rule" /></span>
					
						<span class="property-value" aria-labelledby="rule-label"><g:link controller="fall2015PrizeRule" action="show" id="${fall2015ReceiptInstance?.rule?.id}">${fall2015ReceiptInstance?.rule?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015ReceiptInstance?.transNo}">
				<li class="fieldcontain">
					<span id="transNo-label" class="property-label"><g:message code="fall2015Receipt.transNo.label" default="Trans No" /></span>
					
						<span class="property-value" aria-labelledby="transNo-label"><g:fieldValue bean="${fall2015ReceiptInstance}" field="transNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015ReceiptInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="fall2015Receipt.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${fall2015ReceiptInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015ReceiptInstance?.cardNo}">
				<li class="fieldcontain">
					<span id="cardNo-label" class="property-label"><g:message code="fall2015Receipt.cardNo.label" default="Card No" /></span>
					
						<span class="property-value" aria-labelledby="cardNo-label"><g:fieldValue bean="${fall2015ReceiptInstance}" field="cardNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015ReceiptInstance?.cardType}">
				<li class="fieldcontain">
					<span id="cardType-label" class="property-label"><g:message code="fall2015Receipt.cardType.label" default="Card Type" /></span>
					
						<span class="property-value" aria-labelledby="cardType-label"><g:fieldValue bean="${fall2015ReceiptInstance}" field="cardType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015ReceiptInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="fall2015Receipt.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${fall2015ReceiptInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015ReceiptInstance?.receiptIndex}">
				<li class="fieldcontain">
					<span id="receiptIndex-label" class="property-label"><g:message code="fall2015Receipt.receiptIndex.label" default="Receipt Index" /></span>
					
						<span class="property-value" aria-labelledby="receiptIndex-label"><g:fieldValue bean="${fall2015ReceiptInstance}" field="receiptIndex"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015ReceiptInstance?.subscriber}">
				<li class="fieldcontain">
					<span id="subscriber-label" class="property-label"><g:message code="fall2015Receipt.subscriber.label" default="Subscriber" /></span>
					
						<span class="property-value" aria-labelledby="subscriber-label"><g:link controller="subscriber" action="show" id="${fall2015ReceiptInstance?.subscriber?.id}">${fall2015ReceiptInstance?.subscriber?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${fall2015ReceiptInstance?.id}" />
					<g:link class="edit" action="edit" id="${fall2015ReceiptInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
