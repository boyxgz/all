
<%@page import="com.surelution.wxmp.jx.Fall2015DrawPrizeTicket"%>
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.wxmp.jx.Fall2015Voucher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fall2015Voucher.label', default: 'Fall2015Voucher')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-fall2015Voucher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-fall2015Voucher" class="content scaffold-create">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th>上传日期</th>
						
						<th>卡类型</th>
						
						<th>等级</th>
						
						<th>参与人数</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${receipts}" status="i" var="result">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${result[0].format("yyyy-MM-dd")}</td>
					
						<td>${result[1]}</td>
					
						<td>${result[2]}</td>
					
						<td>${result[3]}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			
			
			<table>
				<thead>
					<tr>
					
						<th>中奖日期</th>
						
						<th>审核状态</th>
						
						<th>奖品类型</th>
						
						<th>参与人数</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vouchers}" status="i" var="result">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${result[0].format("yyyy-MM-dd")}</td>
					
						<td>${result[1]}</td>
					
						<td>${result[2].name}</td>
					
						<td>${result[3]}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
