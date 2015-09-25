
<%@ page import="com.surelution.wxmp.jx.ThirdpartTakingOn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'thirdpartTakingOn.label', default: 'ThirdpartTakingOn')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-thirdpartTakingOn" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-thirdpartTakingOn" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list thirdpartTakingOn">
			
				<g:if test="${thirdpartTakingOnInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="thirdpartTakingOn.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${thirdpartTakingOnInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${thirdpartTakingOnInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="thirdpartTakingOn.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${thirdpartTakingOnInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${thirdpartTakingOnInstance?.production}">
				<li class="fieldcontain">
					<span id="production-label" class="property-label"><g:message code="thirdpartTakingOn.production.label" default="Production" /></span>
					
						<span class="property-value" aria-labelledby="production-label"><g:fieldValue bean="${thirdpartTakingOnInstance}" field="production"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${thirdpartTakingOnInstance?.remark}">
				<li class="fieldcontain">
					<span id="remark-label" class="property-label"><g:message code="thirdpartTakingOn.remark.label" default="Remark" /></span>
					
						<span class="property-value" aria-labelledby="remark-label"><g:fieldValue bean="${thirdpartTakingOnInstance}" field="remark"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${thirdpartTakingOnInstance?.tel}">
				<li class="fieldcontain">
					<span id="tel-label" class="property-label"><g:message code="thirdpartTakingOn.tel.label" default="Tel" /></span>
					
						<span class="property-value" aria-labelledby="tel-label"><g:fieldValue bean="${thirdpartTakingOnInstance}" field="tel"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${thirdpartTakingOnInstance?.id}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
