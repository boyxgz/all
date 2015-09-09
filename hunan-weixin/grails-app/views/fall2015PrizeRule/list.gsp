
<%@ page import="com.surelution.wxmp.jx.Fall2015PrizeRule" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fall2015PrizeRule.label', default: 'Fall2015PrizeRule')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-fall2015PrizeRule" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-fall2015PrizeRule" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cardType" title="${message(code: 'fall2015PrizeRule.cardType.label', default: 'Card Type')}" />
					
						<g:sortableColumn property="from" title="${message(code: 'fall2015PrizeRule.from.label', default: 'From')}" />
					
						<g:sortableColumn property="noLimited" title="${message(code: 'fall2015PrizeRule.noLimited.label', default: 'No Limited')}" />
					
						<g:sortableColumn property="to" title="${message(code: 'fall2015PrizeRule.to.label', default: 'To')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fall2015PrizeRuleInstanceList}" status="i" var="fall2015PrizeRuleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${fall2015PrizeRuleInstance.id}">${fieldValue(bean: fall2015PrizeRuleInstance, field: "cardType")}</g:link></td>
					
						<td>${fieldValue(bean: fall2015PrizeRuleInstance, field: "from")}</td>
					
						<td><g:formatBoolean boolean="${fall2015PrizeRuleInstance.noLimited}" /></td>
					
						<td>${fieldValue(bean: fall2015PrizeRuleInstance, field: "to")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fall2015PrizeRuleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
