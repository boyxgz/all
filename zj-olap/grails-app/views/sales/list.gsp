
<%@page import="com.surelution.zjolap.SalesFullTime"%>
<%@ page import="com.surelution.zjolap.Sales" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sales.label', default: 'Sales')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sales" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			<span class="menuButton"><g:link class="excel" action="downloadExcel">下载excel</g:link></span>
		</div>
		
		<div id="create-salesOrder" class="scaffold-create" role="main">
		  <sec:ifAnyGranted roles="ROLE_ADMIN">
				<g:form action="list" >
						<fieldset class="form">
							<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'branch', 'error')} ">
								<label for="branch">
									<g:message code="salesOrder.branch.label" default="Branch" />
								</label>
								<g:select id="branch" name="branch.id" from="${com.surelution.zjolap.Branch.list()}" noSelection="['':'']" optionKey="id" optionValue="name" value="${params['branch.id']}" class="many-to-one"/>
							</div>
							<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'fullTime', 'error')} ">
								<label for="fullTime">
									<g:message code="salesOrder.fullTime.label" default="Full Time" />
								</label>
								<g:select name="fullTime.id" from="${SalesFullTime.list() }" optionKey="id" optionValue="name" noSelection="['':'全部']" value="${params['fullTime.id']}"/>
							</div>
	
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="search" class="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
						</fieldset>
						</g:form>
					
				</sec:ifAnyGranted>
					 
		</div>
		
		<div id="list-sales" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr><%--
						<g:sortableColumn property="id" title="${message(code: 'sales.id.label', default: 'Id')}" />
					
						--%>
						
						<g:sortableColumn property="name" title="${message(code: 'sales.name.label', default: 'Name')}" params="${params }"/>
						<th><g:message code="sales.branch.label" default="Branch" /></th>
						<th><g:message code="sales.fullTime.label" default="Full Time" /></th>

					</tr>
				</thead>
				<tbody>
				<g:each in="${salesInstanceList}" status="i" var="salesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<%--<td>${fieldValue(bean: salesInstance, field: "id")}</td>

						--%>
						
						<td><g:link action="show" id="${salesInstance.id}" target="_blank">${fieldValue(bean: salesInstance, field: "name")}</g:link></td>
						<td>${salesInstance?.branch?.name}</td>
						<td>${salesInstance.fullTime?.name}</td>
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="paginateButtons">
				<g:paginate total="${salesInstanceTotal}" params="${params }"/>
			</div>
		</div>
	</body>
</html>
