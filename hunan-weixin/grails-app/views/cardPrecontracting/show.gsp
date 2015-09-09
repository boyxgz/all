
<%@ page import="com.surelution.wxmp.jx.CardPrecontracting" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cardPrecontracting.label', default: 'CardPrecontracting')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cardPrecontracting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cardPrecontracting" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cardPrecontracting">
			
				<g:if test="${cardPrecontractingInstance?.dateOfFetch}">
				<li class="fieldcontain">
					<span id="dateOfFetch-label" class="property-label"><g:message code="cardPrecontracting.dateOfFetch.label" default="Date Of Fetch" /></span>
					
						<span class="property-value" aria-labelledby="dateOfFetch-label"><g:formatDate date="${cardPrecontractingInstance?.dateOfFetch}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardPrecontractingInstance?.precontractingDate}">
				<li class="fieldcontain">
					<span id="precontractingDate-label" class="property-label"><g:message code="cardPrecontracting.precontractingDate.label" default="Precontracting Date" /></span>
					
						<span class="property-value" aria-labelledby="precontractingDate-label"><g:formatDate date="${cardPrecontractingInstance?.precontractingDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardPrecontractingInstance?.remark}">
				<li class="fieldcontain">
					<span id="remark-label" class="property-label"><g:message code="cardPrecontracting.remark.label" default="Remark" /></span>
					
						<span class="property-value" aria-labelledby="remark-label"><g:fieldValue bean="${cardPrecontractingInstance}" field="remark"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardPrecontractingInstance?.stationOfFetch}">
				<li class="fieldcontain">
					<span id="stationOfFetch-label" class="property-label"><g:message code="cardPrecontracting.stationOfFetch.label" default="Station Of Fetch" /></span>
					
						${cardPrecontractingInstance?.stationOfFetch.district.branch.name}&gt;&gt;${cardPrecontractingInstance?.stationOfFetch.district.name}&gt;&gt;${cardPrecontractingInstance?.stationOfFetch.name}
					
				</li>
				</g:if>
			
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cardPrecontractingInstance?.id}" />
					<g:link class="edit" action="edit" id="${cardPrecontractingInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
