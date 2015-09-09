
<%@ page import="com.surelution.wxmp.jx.Fall2015PrizeRule" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fall2015PrizeRule.label', default: 'Fall2015PrizeRule')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-fall2015PrizeRule" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-fall2015PrizeRule" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list fall2015PrizeRule">
			
				<g:if test="${fall2015PrizeRuleInstance?.cardType}">
				<li class="fieldcontain">
					<span id="cardType-label" class="property-label"><g:message code="fall2015PrizeRule.cardType.label" default="Card Type" /></span>
					
						<span class="property-value" aria-labelledby="cardType-label"><g:fieldValue bean="${fall2015PrizeRuleInstance}" field="cardType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015PrizeRuleInstance?.from}">
				<li class="fieldcontain">
					<span id="from-label" class="property-label"><g:message code="fall2015PrizeRule.from.label" default="From" /></span>
					
						<span class="property-value" aria-labelledby="from-label"><g:fieldValue bean="${fall2015PrizeRuleInstance}" field="from"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015PrizeRuleInstance?.noLimited}">
				<li class="fieldcontain">
					<span id="noLimited-label" class="property-label"><g:message code="fall2015PrizeRule.noLimited.label" default="No Limited" /></span>
					
						<span class="property-value" aria-labelledby="noLimited-label"><g:formatBoolean boolean="${fall2015PrizeRuleInstance?.noLimited}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015PrizeRuleInstance?.to}">
				<li class="fieldcontain">
					<span id="to-label" class="property-label"><g:message code="fall2015PrizeRule.to.label" default="To" /></span>
					
						<span class="property-value" aria-labelledby="to-label"><g:fieldValue bean="${fall2015PrizeRuleInstance}" field="to"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${fall2015PrizeRuleInstance?.id}" />
					<g:link class="edit" action="edit" id="${fall2015PrizeRuleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
