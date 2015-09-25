
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.wxmp.jx.KeyedMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'keyedMessage.label', default: 'KeyedMessage')}" />
		<title>喊一声报表</title>
	</head>
	<body>
		<a href="#list-keyedMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-keyedMessage" class="content scaffold-list" role="main">
			<h1>喊一声报表</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
					
						<th width="110">头像</th>
						<th>昵称</th>
						<th>有效票数</th>
						<th>存疑票数</th>
						<th>用户编号</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${votingCount}" status="i" var="vc">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<%
						UserInfo userInfo = UserInfo.loadUserInfo(vc[1].openId)
					 %>
						
						<td><img src="${userInfo.headImgUrl }" width="100" height="100"/></td>
						
						<td>${userInfo.nickname}</td>
					
						<td>${vc[2]}</td>
					
						<td>${vc[0] - vc[2]}</td>
					
						<td>${vc[1].id}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${total}" />
			</div>
		</div>
	</body>
</html>
