
<%@ page import="com.surelution.wxmp.jx.RegisterPrize" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registerPrize.label', default: 'RegisterPrize')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-registerPrize" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-registerPrize" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list registerPrize">
			
				<g:if test="${registerPrizeInstance?.awardedBy}">
				<li class="fieldcontain">
					<span id="awardedBy-label" class="property-label"><g:message code="registerPrize.awardedBy.label" default="Awarded By" /></span>
					
						<span class="property-value" aria-labelledby="awardedBy-label"><g:link controller="user" action="show" id="${registerPrizeInstance?.awardedBy?.id}">${registerPrizeInstance?.awardedBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${registerPrizeInstance?.awardedAt}">
				<li class="fieldcontain">
					<span id="awardedAt-label" class="property-label"><g:message code="registerPrize.awardedAt.label" default="Awarded At" /></span>
					
						<span class="property-value" aria-labelledby="awardedAt-label"><g:link controller="user" action="show" id="${registerPrizeInstance?.awardedAt?.id}">${registerPrizeInstance?.awardedAt?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${registerPrizeInstance?.subscriber}">
				<li class="fieldcontain">
					<span id="subscriber-label" class="property-label"><g:message code="registerPrize.subscriber.label" default="Subscriber" /></span>
					
						<span class="property-value" aria-labelledby="subscriber-label"><g:link controller="subscriber" action="show" id="${registerPrizeInstance?.subscriber?.id}">${registerPrizeInstance?.subscriber?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${registerPrizeInstance?.createAt}">
				<li class="fieldcontain">
					<span id="createAt-label" class="property-label"><g:message code="registerPrize.createAt.label" default="Create At" /></span>
					
						<span class="property-value" aria-labelledby="createAt-label"><g:formatDate date="${registerPrizeInstance?.createAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${registerPrizeInstance?.prize}">
				<li class="fieldcontain">
					<span id="prize-label" class="property-label"><g:message code="registerPrize.prize.label" default="Prize" /></span>
					
						<span class="property-value" aria-labelledby="prize-label"><g:link controller="prize" action="show" id="${registerPrizeInstance?.prize?.id}">${registerPrizeInstance?.prize?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${registerPrizeInstance?.id}" />
					<g:link class="edit" action="edit" id="${registerPrizeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
