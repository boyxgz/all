
<%@ page import="com.surelution.wxmp.jx.Wiki" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wiki.label', default: 'Wiki')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-wiki" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-wiki" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list wiki">
			
				<g:if test="${wikiInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="wiki.active.label" default="Active" /></span>
					
						<span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${wikiInstance?.active}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${wikiInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="wiki.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${wikiInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wikiInstance?.createAt}">
				<li class="fieldcontain">
					<span id="createAt-label" class="property-label"><g:message code="wiki.createAt.label" default="Create At" /></span>
					
						<span class="property-value" aria-labelledby="createAt-label"><g:formatDate date="${wikiInstance?.createAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${wikiInstance?.index}">
				<li class="fieldcontain">
					<span id="index-label" class="property-label"><g:message code="wiki.index.label" default="Index" /></span>
					
						<span class="property-value" aria-labelledby="index-label"><g:fieldValue bean="${wikiInstance}" field="index"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wikiInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="wiki.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${wikiInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${wikiInstance?.id}" />
					<g:link class="edit" action="edit" id="${wikiInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
