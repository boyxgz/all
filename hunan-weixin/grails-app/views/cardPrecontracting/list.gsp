
<%@ page import="com.surelution.wxmp.jx.CardPrecontracting" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cardPrecontracting.label', default: 'CardPrecontracting')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cardPrecontracting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-cardPrecontracting" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dateOfFetch" title="${message(code: 'cardPrecontracting.dateOfFetch.label', default: 'Date Of Fetch')}" />
					
						<g:sortableColumn property="precontractingDate" title="${message(code: 'cardPrecontracting.precontractingDate.label', default: 'Precontracting Date')}" />
					
						<g:sortableColumn property="remark" title="${message(code: 'cardPrecontracting.remark.label', default: 'Remark')}" />
					
						<th><g:message code="cardPrecontracting.stationOfFetch.label" default="Station Of Fetch" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cardPrecontractingInstanceList}" status="i" var="cardPrecontractingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cardPrecontractingInstance.id}"><g:formatDate date="${cardPrecontractingInstance.dateOfFetch}" format="yyyy-MM-dd"/></g:link></td>
					
						<td><g:formatDate date="${cardPrecontractingInstance.precontractingDate}" format="yyyy-MM-dd"/></td>
					
						<td>${fieldValue(bean: cardPrecontractingInstance, field: "remark")}</td>
					
						<td>${cardPrecontractingInstance.stationOfFetch.district.branch.name}&gt;&gt;${cardPrecontractingInstance.stationOfFetch.district.name}&gt;&gt;${cardPrecontractingInstance.stationOfFetch.name}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cardPrecontractingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
