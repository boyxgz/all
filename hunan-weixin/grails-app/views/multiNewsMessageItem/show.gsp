
<%@ page import="com.surelution.wxmp.jx.MultiNewsMessageItem" %>
<%@ page import="com.surelution.wxmp.jx.MultiNewsMessageItemBranch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'multiNewsMessageItem.label', default: 'MultiNewsMessageItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-multiNewsMessageItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-multiNewsMessageItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list multiNewsMessageItem">
			
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="multiNewsMessageItem.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${multiNewsMessageItemInstance}" field="title"/></span>
					
				</li>
			
				<li class="fieldcontain">
					<span id="firstNews-label" class="property-label"><g:message code="multiNewsMessageItem.firstNews.label" default="First News" /></span>
					
						<span class="property-value" aria-labelledby="firstNews-label"><g:formatBoolean boolean="${multiNewsMessageItemInstance?.firstNews}" /></span>
					
				</li>
			
				<g:if test="${multiNewsMessageItemInstance?.message}">
				<li class="fieldcontain">
					<span id="message-label" class="property-label"><g:message code="multiNewsMessageItem.message.label" default="Message" /></span>
					
						<span class="property-value" aria-labelledby="message-label"><g:link controller="multiNewsMessage" action="show" id="${multiNewsMessageItemInstance?.message?.id}">${multiNewsMessageItemInstance?.message?.menuKey}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${multiNewsMessageItemInstance?.pictureUrl}">
				<li class="fieldcontain">
					<span id="pictureUrl-label" class="property-label"><g:message code="multiNewsMessageItem.pictureUrl.label" default="Picture Url" /></span>
					
						<span class="property-value" aria-labelledby="pictureUrl-label">
						<img alt="" src="${multiNewsMessageItemInstance.pictureUrl}">
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${multiNewsMessageItemInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="multiNewsMessageItem.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label">
						<a href="${multiNewsMessageItemInstance.url}" target="_blank">查看内容</a>
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${multiNewsMessageItemInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="multiNewsMessageItem.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${multiNewsMessageItemInstance}" field="description"/></span>
					
				</li>
				</g:if>
				<li class="fieldcontain">
					<span id="globalMessage-label" class="property-label"><g:message code="multiNewsMessageItem.globalMessage.label" default="Global Message" /></span>
						<span class="property-value" aria-labelledby="globalMessage-label"><g:formatBoolean boolean="${multiNewsMessageItemInstance.globalMessage}"/></span>
					
				</li>
				
				<g:if test="${!multiNewsMessageItemInstance?.globalMessage}">
				<g:each in="${MultiNewsMessageItemBranch.findAllByItem(multiNewsMessageItemInstance)}" var="mnmib">
				<li class="fieldcontain">
					<span class="property-value">${mnmib.branch.name}</span>
				</li>
				</g:each>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${multiNewsMessageItemInstance?.id}" />
					<g:link class="edit" action="edit" id="${multiNewsMessageItemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
