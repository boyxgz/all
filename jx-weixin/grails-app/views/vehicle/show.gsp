
<%@ page import="com.surelution.wxmp.jx.Vehicle" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vehicle.label', default: 'Vehicle')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vehicle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vehicle" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vehicle">
			
				<g:if test="${vehicleInstance?.engineId}">
				<li class="fieldcontain">
					<span id="engineId-label" class="property-label"><g:message code="vehicle.engineId.label" default="Engine Id" /></span>
					
						<span class="property-value" aria-labelledby="engineId-label"><g:fieldValue bean="${vehicleInstance}" field="engineId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehicleInstance?.subscriber}">
				<li class="fieldcontain">
					<span id="subscriber-label" class="property-label"><g:message code="vehicle.subscriber.label" default="Subscriber" /></span>
					
						<span class="property-value" aria-labelledby="subscriber-label"><g:link controller="subscriber" action="show" id="${vehicleInstance?.subscriber?.id}">${vehicleInstance?.subscriber?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehicleInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="vehicle.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="vehicleType" action="show" id="${vehicleInstance?.type?.id}">${vehicleInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehicleInstance?.vId}">
				<li class="fieldcontain">
					<span id="vId-label" class="property-label"><g:message code="vehicle.vId.label" default="VI d" /></span>
					
						<span class="property-value" aria-labelledby="vId-label"><g:fieldValue bean="${vehicleInstance}" field="vId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehicleInstance?.vNo}">
				<li class="fieldcontain">
					<span id="vNo-label" class="property-label"><g:message code="vehicle.vNo.label" default="VN o" /></span>
					
						<span class="property-value" aria-labelledby="vNo-label"><g:fieldValue bean="${vehicleInstance}" field="vNo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${vehicleInstance?.id}" />
					<g:link class="edit" action="edit" id="${vehicleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
