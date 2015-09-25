
<%@ page import="com.surelution.wxmp.jx.ReadingTracking" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'readingTracking.label', default: 'ReadingTracking')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-readingTracking" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-readingTracking" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="readingTracking.article.label" default="Article" /></th>
					
						<g:sortableColumn property="readAt" title="${message(code: 'readingTracking.readAt.label', default: 'Read At')}" />
					
						<g:sortableColumn property="readerOpenId" title="${message(code: 'readingTracking.readerOpenId.label', default: 'Reader Open Id')}" />
					
						<g:sortableColumn property="sharerOpenId" title="${message(code: 'readingTracking.sharerOpenId.label', default: 'Sharer Open Id')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${readingTrackingInstanceList}" status="i" var="readingTrackingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${readingTrackingInstance.id}">${fieldValue(bean: readingTrackingInstance, field: "article.id")}</g:link></td>
					
						<td><g:formatDate date="${readingTrackingInstance.readAt}" /></td>
					
						<td>${fieldValue(bean: readingTrackingInstance, field: "readerOpenId")}</td>
					
						<td>${fieldValue(bean: readingTrackingInstance, field: "sharerOpenId")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${readingTrackingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
