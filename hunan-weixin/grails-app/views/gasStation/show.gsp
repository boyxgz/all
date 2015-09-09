
<%@ page import="com.surelution.wxmp.jx.GasStation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gasStation.label', default: 'GasStation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-gasStation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-gasStation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list gasStation">
			
				<g:if test="${gasStationInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="gasStation.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${gasStationInstance}" field="name"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${gasStationInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="gasStation.active.label" default="Active" /></span>
					
						<span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${gasStationInstance?.active}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${gasStationInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="gasStation.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${gasStationInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gasStationInstance?.district}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="gasStation.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label">${gasStationInstance?.district?.name}</span>
					
				</li>
				</g:if>
			
				
				<g:if test="${gasStationInstance?.linkMan}">
				<li class="fieldcontain">
					<span id="linkMan-label" class="property-label"><g:message code="gasStation.linkMan.label" default="Link Man" /></span>
					
						<span class="property-value" aria-labelledby="linkMan-label"><g:fieldValue bean="${gasStationInstance}" field="linkMan"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${gasStationInstance?.tel}">
				<li class="fieldcontain">
					<span id="tel-label" class="property-label"><g:message code="gasStation.tel.label" default="Tel" /></span>
					
						<span class="property-value" aria-labelledby="tel-label"><g:fieldValue bean="${gasStationInstance}" field="tel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gasStationInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="gasStation.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label">${gasStationInstance?.latitude}</span>
					
				</li>
				</g:if>
			
				<g:if test="${gasStationInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="gasStation.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label">${gasStationInstance?.longitude}</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gasStationInstance?.id}" />
					<g:link class="edit" action="edit" id="${gasStationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
