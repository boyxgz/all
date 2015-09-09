
<%@ page import="com.surelution.wxmp.jx.WeatherItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'weatherItem.label', default: 'WeatherItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-weatherItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-weatherItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list weatherItem">
			
				<g:if test="${weatherItemInstance?.weather}">
				<li class="fieldcontain">
					<span id="weather-label" class="property-label"><g:message code="weatherItem.weather.label" default="Weather" /></span>
					
						<span class="property-value" aria-labelledby="weather-label"><g:link controller="weather" action="show" id="${weatherItemInstance?.weather?.id}">${weatherItemInstance?.weather?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${weatherItemInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="weatherItem.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:link controller="branch" action="show" id="${weatherItemInstance?.branch?.id}">${weatherItemInstance?.branch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${weatherItemInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="weatherItem.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${weatherItemInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${weatherItemInstance?.img1}">
				<li class="fieldcontain">
					<span id="img1-label" class="property-label"><g:message code="weatherItem.img1.label" default="Img1" /></span>
					
						<span class="property-value" aria-labelledby="img1-label"><g:fieldValue bean="${weatherItemInstance}" field="img1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${weatherItemInstance?.img2}">
				<li class="fieldcontain">
					<span id="img2-label" class="property-label"><g:message code="weatherItem.img2.label" default="Img2" /></span>
					
						<span class="property-value" aria-labelledby="img2-label"><g:fieldValue bean="${weatherItemInstance}" field="img2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${weatherItemInstance?.temp1}">
				<li class="fieldcontain">
					<span id="temp1-label" class="property-label"><g:message code="weatherItem.temp1.label" default="Temp1" /></span>
					
						<span class="property-value" aria-labelledby="temp1-label"><g:fieldValue bean="${weatherItemInstance}" field="temp1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${weatherItemInstance?.temp2}">
				<li class="fieldcontain">
					<span id="temp2-label" class="property-label"><g:message code="weatherItem.temp2.label" default="Temp2" /></span>
					
						<span class="property-value" aria-labelledby="temp2-label"><g:fieldValue bean="${weatherItemInstance}" field="temp2"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${weatherItemInstance?.id}" />
					<g:link class="edit" action="edit" id="${weatherItemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
