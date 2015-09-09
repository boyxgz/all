
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.wxmp.jx.SubscriberCommentAssignment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subscriberCommentAssignment.label', default: 'SubscriberCommentAssignment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subscriberCommentAssignment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-subscriberCommentAssignment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
				<g:form action="list" >
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: gasStationInstance, field: 'district', 'error')} required">
						<label for="district">
							消息状态
						</label>
							<g:select id="closedId" name="closedId" value="${closedId }" from="${['未处理', '已处理','全部']}" class="many-to-one"/>
							<g:submitButton name="create" class="search" value="查询" />
					</div>
				</fieldset>
					
				</g:form>
				${closedId }消息列表
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tips" title="${message(code: 'subscriberCommentAssignment.subscriber.label', default: 'Subscriber')}" />
					
						<g:sortableColumn property="closed" title="${message(code: 'subscriberCommentAssignment.closed.label', default: 'Closed')}" />
					
						<g:sortableColumn property="tips" title="${message(code: 'subscriberCommentAssignment.tips.label', default: 'Tips')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subscriberCommentAssignmentInstanceList}" status="i" var="subscriberCommentAssignmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>
						<g:set var="userinfo" value="${UserInfo.loadUserInfo(subscriberCommentAssignmentInstance.subscriber.openId)}"/><%-- --%>
						<g:link action="show" id="${subscriberCommentAssignmentInstance.id}">${userinfo?.nickname  }
						<img alt="" src="${userinfo?.headImgUrl}" height="60" width="60">
						</g:link>
						</td>
					
						<td><g:formatBoolean boolean="${subscriberCommentAssignmentInstance.closed }"/></td>
					
						<td>${fieldValue(bean: subscriberCommentAssignmentInstance, field: "tips")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
