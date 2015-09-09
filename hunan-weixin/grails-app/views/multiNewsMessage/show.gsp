
<%@ page import="com.surelution.wxmp.jx.MultiNewsMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'multiNewsMessage.label', default: 'MultiNewsMessage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-multiNewsMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-multiNewsMessage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list multiNewsMessage">
			
				<g:if test="${multiNewsMessageInstance?.inputMessage}">
				<li class="fieldcontain">
					<span id="inputMessage-label" class="property-label"><g:message code="multiNewsMessage.inputMessage.label" default="Input Message" /></span>
					
						<span class="property-value" aria-labelledby="inputMessage-label"><g:fieldValue bean="${multiNewsMessageInstance}" field="inputMessage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${multiNewsMessageInstance?.menuKey}">
				<li class="fieldcontain">
					<span id="menuKey-label" class="property-label"><g:message code="multiNewsMessage.menuKey.label" default="Menu Key" /></span>
					
						<span class="property-value" aria-labelledby="menuKey-label"><g:fieldValue bean="${multiNewsMessageInstance}" field="menuKey"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${multiNewsMessageInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="multiNewsMessage.description.label" default="description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${multiNewsMessageInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${multiNewsMessageInstance?.keepHistory}">
				<li class="fieldcontain">
					<span id="keepHistory-label" class="property-label"><g:message code="multiNewsMessage.keepHistory.label" default="keepHistory" /></span>
					
						<span class="property-value" aria-labelledby="keepHistory-label"><g:fieldValue bean="${multiNewsMessageInstance}" field="keepHistory"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${multiNewsMessageInstance?.id}" />
					<g:link class="edit" action="edit" id="${multiNewsMessageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
