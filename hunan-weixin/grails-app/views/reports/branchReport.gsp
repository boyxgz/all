
<%@ page import="com.surelution.wxmp.jx.vo.SubscribingsReport" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'branch.label', default: 'Branch')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-branch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-branch" class="content scaffold-list" role="main">
			<h1>订阅数</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div><%--
			     <form action="reportSubscribing">
				公司：<g:select id="branch" name="branchId" noSelection="${['':''] }" from="${com.surelution.wxmp.petrozj.Branch.findAllByParentIsNotNull()}" optionKey="id" optionValue="name" required="" value="${params.branchId}" />
				  <g:actionSubmit value="查询"/>
				</form>
			--%></div>
			<table>
			     <thead>
					<tr>
						 <th>公司</th>
						 <th>昨日订阅数</th>
						 <th>订阅人数</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${reportsResult}" status="i" var="sub">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<th>${sub.branch?.name}</th>
							<td>${fieldValue(bean: sub, field: "yestodayCount")}</td>
							<td>${fieldValue(bean: sub, field: "count")}</td>
						
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<%--<g:paginate total="${subscribingsReportCount}" />
			--%></div>
		</div>
	</body>
</html>
