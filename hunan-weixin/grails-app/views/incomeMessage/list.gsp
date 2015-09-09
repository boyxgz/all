
<%@ page import="com.surelution.wxmp.jx.IncomeMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'incomeMessage.label', default: 'IncomeMessage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-incomeMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-incomeMessage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="content" title="${message(code: 'incomeMessage.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="createTime" title="${message(code: 'incomeMessage.createTime.label', default: 'Create Time')}" />
					
						<g:sortableColumn property="fromUserName" title="${message(code: 'incomeMessage.fromUserName.label', default: 'From User Name')}" />
					
						<g:sortableColumn property="msgId" title="${message(code: 'incomeMessage.msgId.label', default: 'Msg Id')}" />
					
						<g:sortableColumn property="msgType" title="${message(code: 'incomeMessage.msgType.label', default: 'Msg Type')}" />
					
						<g:sortableColumn property="toUserName" title="${message(code: 'incomeMessage.toUserName.label', default: 'To User Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${incomeMessageInstanceList}" status="i" var="incomeMessageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${incomeMessageInstance.id}">${fieldValue(bean: incomeMessageInstance, field: "content")}</g:link></td>
					
						<td><g:formatDate date="${incomeMessageInstance.createAt }" format="yyyy-MM-dd HH:mm:ss"/></td>
					
						<td>${fieldValue(bean: incomeMessageInstance, field: "fromUserName")}</td>
					
						<td>${fieldValue(bean: incomeMessageInstance, field: "msgId")}</td>
					
						<td>${fieldValue(bean: incomeMessageInstance, field: "msgType")}</td>
					
						<td>${fieldValue(bean: incomeMessageInstance, field: "toUserName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${incomeMessageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
