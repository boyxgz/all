
<%@ page import="com.surelution.wxmp.jx.WeatherItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'weatherItem.label', default: 'WeatherItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-weatherItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-weatherItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="weatherItem.weather.label" default="Weather" /></th>
					
						<th><g:message code="weatherItem.branch.label" default="Branch" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'weatherItem.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="img1" title="${message(code: 'weatherItem.img1.label', default: 'Img1')}" />
					
						<g:sortableColumn property="img2" title="${message(code: 'weatherItem.img2.label', default: 'Img2')}" />
					
						<g:sortableColumn property="temp1" title="${message(code: 'weatherItem.temp1.label', default: 'Temp1')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${weatherItemInstanceList}" status="i" var="weatherItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${weatherItemInstance.id}">${fieldValue(bean: weatherItemInstance, field: "weather")}</g:link></td>
					
						<td>${fieldValue(bean: weatherItemInstance, field: "branch")}</td>
					
						<td>${fieldValue(bean: weatherItemInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: weatherItemInstance, field: "img1")}</td>
					
						<td>${fieldValue(bean: weatherItemInstance, field: "img2")}</td>
					
						<td>${fieldValue(bean: weatherItemInstance, field: "temp1")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${weatherItemInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
