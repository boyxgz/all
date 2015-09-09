
<%@ page import="com.surelution.wxmp.jx.Subscribing" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subscribing.label', default: 'Subscribing')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subscribing" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-subscribing" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subscribing">
			
				<g:if test="${subscribingInstance?.comeFrom}">
				<li class="fieldcontain">
					<span id="comeFrom-label" class="property-label"><g:message code="subscribing.comeFrom.label" default="Come From" /></span>
					
						<span class="property-value" aria-labelledby="comeFrom-label"><g:fieldValue bean="${subscribingInstance}" field="comeFrom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscribingInstance?.subscriber}">
				<li class="fieldcontain">
					<span id="subscriber-label" class="property-label"><g:message code="subscribing.subscriber.label" default="Subscriber" /></span>
					
						<span class="property-value" aria-labelledby="subscriber-label"><g:link controller="subscriber" action="show" id="${subscribingInstance?.subscriber?.id}">${subscribingInstance?.subscriber?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscribingInstance?.subscribingAt}">
				<li class="fieldcontain">
					<span id="subscribingAt-label" class="property-label"><g:message code="subscribing.subscribingAt.label" default="Subscribing At" /></span>
					
						<span class="property-value" aria-labelledby="subscribingAt-label"><g:formatDate date="${subscribingInstance?.subscribingAt}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${subscribingInstance?.id}" />
					<g:link class="edit" action="edit" id="${subscribingInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
