
<%@ page import="com.surelution.wxmp.jx.PrizeAwarding" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prizeAwarding.label', default: 'PrizeAwarding')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-prizeAwarding" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-prizeAwarding" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list prizeAwarding">
			
				<g:if test="${prizeAwardingInstance?.awardedBy}">
				<li class="fieldcontain">
					<span id="awardedBy-label" class="property-label"><g:message code="prizeAwarding.awardedBy.label" default="Awarded By" /></span>
					
						<span class="property-value" aria-labelledby="awardedBy-label"><g:fieldValue bean="${prizeAwardingInstance}" field="awardedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prizeAwardingInstance?.awardingAt}">
				<li class="fieldcontain">
					<span id="awardingAt-label" class="property-label"><g:message code="prizeAwarding.awardingAt.label" default="Awarding At" /></span>
					
						<span class="property-value" aria-labelledby="awardingAt-label"><g:formatDate date="${prizeAwardingInstance?.awardingAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${prizeAwardingInstance?.prize}">
				<li class="fieldcontain">
					<span id="prize-label" class="property-label"><g:message code="prizeAwarding.prize.label" default="Prize" /></span>
					
						<span class="property-value" aria-labelledby="prize-label"><g:link controller="prize" action="show" id="${prizeAwardingInstance?.prize?.id}">${prizeAwardingInstance?.prize?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prizeAwardingInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="prizeAwarding.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:link controller="awardingStatus" action="show" id="${prizeAwardingInstance?.status?.id}">${prizeAwardingInstance?.status?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prizeAwardingInstance?.subscriber}">
				<li class="fieldcontain">
					<span id="subscriber-label" class="property-label"><g:message code="prizeAwarding.subscriber.label" default="Subscriber" /></span>
					
						<span class="property-value" aria-labelledby="subscriber-label"><g:link controller="subscriber" action="show" id="${prizeAwardingInstance?.subscriber?.id}">${prizeAwardingInstance?.subscriber?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${prizeAwardingInstance?.id}" />
					<g:link class="edit" action="edit" id="${prizeAwardingInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
