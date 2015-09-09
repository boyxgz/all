
<%@ page import="com.surelution.wxmp.jx.SubscribingFrom" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subscribingFrom.label', default: 'SubscribingFrom')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subscribingFrom" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-subscribingFrom" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subscribingFrom">
			
				<g:if test="${subscribingFromInstance?.comeFrom}">
				<li class="fieldcontain">
					<span id="comeFrom-label" class="property-label"><g:message code="subscribingFrom.comeFrom.label" default="Come From" /></span>
					
						<span class="property-value" aria-labelledby="comeFrom-label"><g:fieldValue bean="${subscribingFromInstance}" field="comeFrom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscribingFromInstance?.gasStation}">
				<li class="fieldcontain">
					<span id="gasStation-label" class="property-label"><g:message code="subscribingFrom.gasStation.label" default="Gas Station" /></span>
					
						<span class="property-value" aria-labelledby="gasStation-label"><g:link controller="gasStation" action="show" id="${subscribingFromInstance?.gasStation?.id}">${subscribingFromInstance?.gasStation?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscribingFromInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="subscribingFrom.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:link controller="branch" action="show" id="${subscribingFromInstance?.branch?.id}">${subscribingFromInstance?.branch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscribingFromInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="subscribingFrom.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${subscribingFromInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscribingFromInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="subscribingFrom.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${subscribingFromInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${subscribingFromInstance?.id}" />
					<g:link class="edit" action="edit" id="${subscribingFromInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
