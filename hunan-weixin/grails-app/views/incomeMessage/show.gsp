
<%@ page import="com.surelution.wxmp.jx.IncomeMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'incomeMessage.label', default: 'IncomeMessage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-incomeMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-incomeMessage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list incomeMessage">
			
				<g:if test="${incomeMessageInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="incomeMessage.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${incomeMessageInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incomeMessageInstance?.createTime}">
				<li class="fieldcontain">
					<span id="createTime-label" class="property-label"><g:message code="incomeMessage.createTime.label" default="Create Time" /></span>
					
						<span class="property-value" aria-labelledby="createTime-label"><g:fieldValue bean="${incomeMessageInstance}" field="createTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incomeMessageInstance?.fromUserName}">
				<li class="fieldcontain">
					<span id="fromUserName-label" class="property-label"><g:message code="incomeMessage.fromUserName.label" default="From User Name" /></span>
					
						<span class="property-value" aria-labelledby="fromUserName-label"><g:fieldValue bean="${incomeMessageInstance}" field="fromUserName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incomeMessageInstance?.msgId}">
				<li class="fieldcontain">
					<span id="msgId-label" class="property-label"><g:message code="incomeMessage.msgId.label" default="Msg Id" /></span>
					
						<span class="property-value" aria-labelledby="msgId-label"><g:fieldValue bean="${incomeMessageInstance}" field="msgId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incomeMessageInstance?.msgType}">
				<li class="fieldcontain">
					<span id="msgType-label" class="property-label"><g:message code="incomeMessage.msgType.label" default="Msg Type" /></span>
					
						<span class="property-value" aria-labelledby="msgType-label"><g:fieldValue bean="${incomeMessageInstance}" field="msgType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incomeMessageInstance?.toUserName}">
				<li class="fieldcontain">
					<span id="toUserName-label" class="property-label"><g:message code="incomeMessage.toUserName.label" default="To User Name" /></span>
					
						<span class="property-value" aria-labelledby="toUserName-label"><g:fieldValue bean="${incomeMessageInstance}" field="toUserName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${incomeMessageInstance?.id}" />
					<g:link class="edit" action="edit" id="${incomeMessageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
