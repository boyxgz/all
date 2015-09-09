
<%@ page import="com.surelution.wxmp.jx.DynArticle" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dynArticle.label', default: 'DynArticle')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-dynArticle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<h1><g:message code="default.list.label" args="[entityName]" /></h1>
		<div id="list-dynArticle" class="content scaffold-list" role="main" style="overflow: scroll;">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'dynArticle.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="content" title="${message(code: 'dynArticle.content.label', default: 'Content')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dynArticleInstanceList}" status="i" var="dynArticleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dynArticleInstance.id}">${fieldValue(bean: dynArticleInstance, field: "code")}</g:link></td>
					
						<td>${dynArticleInstance?.content}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dynArticleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
