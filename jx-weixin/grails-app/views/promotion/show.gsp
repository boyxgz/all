
<%@ page import="com.surelution.wxmp.jx.Promotion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'promotion.label', default: 'Promotion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-promotion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-promotion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list promotion">
			
				<g:if test="${promotionInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="promotion.active.label" default="Active" /></span>
					
						<span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${promotionInstance?.active}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${promotionInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="promotion.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${promotionInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${promotionInstance?.main}">
				<li class="fieldcontain">
					<span id="main-label" class="property-label"><g:message code="promotion.main.label" default="Main" /></span>
					
						<span class="property-value" aria-labelledby="main-label"><g:formatBoolean boolean="${promotionInstance?.main}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${promotionInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="promotion.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${promotionInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${promotionInstance?.id}" />
					<g:link class="edit" action="edit" id="${promotionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
