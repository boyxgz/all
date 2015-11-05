
<%@ page import="com.surelution.zjolap.WarningRuleToBranchCustomer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'warningRuleToBranchCustomer.label', default: 'WarningRuleToBranchCustomer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-warningRuleToBranchCustomer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div id="list-warningRuleToBranchCustomer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="warningRuleToBranchCustomer.branch.label" default="Branch" /></th>
						<th><g:message code="warningRuleToBranchCustomer.customer.label" default="Customer" /></th>
						  <th>
					      	 油品类型
					    </th>
					     <th>
					       	油品品号
					    </th>
						<th><g:message code="warningRuleToBranchCustomer.rule.label" default="Rule" /></th>
						<th><g:message code="warningRuleToBranchCustomer.value.label" default="Rule" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${warningRuleToBranchCustomerInstanceList}" status="i" var="warningRuleToBranchCustomerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${warningRuleToBranchCustomerInstance.id}">${warningRuleToBranchCustomerInstance?.customerBranch?.branch?.name}</g:link></td>
						<td>${warningRuleToBranchCustomerInstance?.customerBranch?.customer?.name}</td>
						<td>${warningRuleToBranchCustomerInstance?.rule?.gasType?.category?.name}</td>
						<td>${warningRuleToBranchCustomerInstance?.rule?.gasType?.name}</td>
						<td>${warningRuleToBranchCustomerInstance?.rule?.typeName}</td>
						<td>${warningRuleToBranchCustomerInstance?.rule?.value}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="paginateButtons" id="paginateButtons">
				<g:paginate total="${warningRuleToBranchCustomerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
