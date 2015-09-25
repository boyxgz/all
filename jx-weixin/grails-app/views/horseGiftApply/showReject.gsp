
<%@ page import="com.surelution.wxmp.jx.HorseGiftApply" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'horseGiftApply.label', default: 'HorseGiftApply')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-horseGiftApply" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-horseGiftApply" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list horseGiftApply">
			
				<g:if test="${horseGiftApplyInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="horseGiftApply.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${horseGiftApplyInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${horseGiftApplyInstance?.subscriber}">
				<li class="fieldcontain">
					<span id="subscriber-label" class="property-label"><g:message code="horseGiftApply.subscriber.label" default="Subscriber" /></span>
					
						<span class="property-value" aria-labelledby="subscriber-label">${horseGiftApplyInstance?.subscriber?.id}</span>
					
				</li>
				</g:if>
			
				<g:if test="${horseGiftApplyInstance?.uploading}">
				<li class="fieldcontain">
					<span id="uploading-label" class="property-label"><g:message code="horseGiftApply.uploading.label" default="Uploading" /></span>
					
						<span class="property-value" aria-labelledby="uploading-label"><img src='${horseGiftApplyInstance?.uploading?.pictureUrl}'/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: horseGiftApplyInstance, field: 'replyInfo', 'error')} required">
						<label for="replyInfo">
							<g:message code="horseGiftApply.replyInfo.label" default="Reply Info" />
							<span class="required-indicator">*</span>
						</label>
						<g:textArea name="replyInfo"></g:textArea>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${horseGiftApplyInstance?.id}" />
					<g:actionSubmit class="delete" action="rejected" value="${message(code: 'default.button.reject.label', default: 'Rejected')}" onclick="return confirm('${message(code: 'default.button.reject.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
