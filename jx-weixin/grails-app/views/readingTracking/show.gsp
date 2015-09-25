
<%@ page import="com.surelution.wxmp.jx.ReadingTracking" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'readingTracking.label', default: 'ReadingTracking')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-readingTracking" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-readingTracking" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list readingTracking">
			
				<g:if test="${readingTrackingInstance?.article}">
				<li class="fieldcontain">
					<span id="article-label" class="property-label"><g:message code="readingTracking.article.label" default="Article" /></span>
					
						<span class="property-value" aria-labelledby="article-label"><g:link controller="trackableArticle" action="show" id="${readingTrackingInstance?.article?.id}">${readingTrackingInstance?.article?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${readingTrackingInstance?.readAt}">
				<li class="fieldcontain">
					<span id="readAt-label" class="property-label"><g:message code="readingTracking.readAt.label" default="Read At" /></span>
					
						<span class="property-value" aria-labelledby="readAt-label"><g:formatDate date="${readingTrackingInstance?.readAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${readingTrackingInstance?.readerOpenId}">
				<li class="fieldcontain">
					<span id="readerOpenId-label" class="property-label"><g:message code="readingTracking.readerOpenId.label" default="Reader Open Id" /></span>
					
						<span class="property-value" aria-labelledby="readerOpenId-label"><g:fieldValue bean="${readingTrackingInstance}" field="readerOpenId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${readingTrackingInstance?.sharerOpenId}">
				<li class="fieldcontain">
					<span id="sharerOpenId-label" class="property-label"><g:message code="readingTracking.sharerOpenId.label" default="Sharer Open Id" /></span>
					
						<span class="property-value" aria-labelledby="sharerOpenId-label"><g:fieldValue bean="${readingTrackingInstance}" field="sharerOpenId"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${readingTrackingInstance?.id}" />
					<g:link class="edit" action="edit" id="${readingTrackingInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
