
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.wxmp.jx.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-user" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
			<table>
				<thead>
					<tr>
						<th>中奖人</th>
						<th>奖品</th>
						<th>金额</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${pvs}" status="i" var="pv">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<g:set var="userInfo" value="${UserInfo.loadUserInfo(pv.owner.openId) }"></g:set>
						<td>
						<img src="${userInfo.headImgUrl }" width="100" height="100"/><br/>
						${userInfo.nickname }</td>
						<td>${pv.batch.name }</td>
						<td>${pv.amount }</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
