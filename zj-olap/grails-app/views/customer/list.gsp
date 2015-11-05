
<%@ page import="com.surelution.zjolap.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<r:require module="jquery-ui"/>
<script type="text/javascript" src="${resource(file:'js/jquery.stickytableheaders.js') }"></script>
	<script type="text/javascript">
	        $(document).ready(function()
	        {
	          $("table").stickyTableHeaders({ scrollableArea: $(".scaffold-list")[0]});
	        })
	     </script>
	</head>
	<body>
		<a href="#list-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}" target='_blank'><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="create" action="create" target='_blank'><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			<span class="menuButton"><g:link class="excel" action="downloadExcel">下载excel</g:link></span>
		</div>
		<div id="list-customer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<form action="list">
			   <fieldset class="form">
					<label for="branch">
							<g:message code="customer.name.label" default="Branch" />
					</label>
					<g:textField name="customerName" value="${params.customerName}"/>
				</fieldset>
				<fieldset class="buttons">
						<g:submitButton name="search" class="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
				</fieldset>
			</form>
			<table>
				<thead>
					<tr>
						<%--<g:sortableColumn property="id" title="${message(code: 'customer.id.label', default: 'Id')}" params="${params}"/>
					
						--%><g:sortableColumn property="name" title="${message(code: 'customer.name.label', default: 'Name')}" params="${params}"/>
						
						<g:sortableColumn property="tel" title="${message(code: 'customer.tel.label', default: 'tel')}" params="${params}"/>
					   <g:sortableColumn property="customerType" title="${message(code: 'customer.customerType.label', default: 'customerType')}" params="${params}"/>
					    <g:sortableColumn property="branch" title="提报分公司" params="${params}"/>
					     <th>
					    	警告
					    </th>
					    
					     
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerInstanceList}" status="i" var="customerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" target='_blank' id="${customerInstance.customer.id}">${fieldValue(bean: customerInstance.customer, field: "name")}</g:link></td>
						
						<td>${fieldValue(bean: customerInstance.customer, field: "tel")}</td>
						
						<td>${customerInstance.customer?.customerType.name}</td>
						
						<td>${customerInstance.branch?.name}</td>
						
						<td>
							<g:link controller="warningRuleToBranchCustomer"  action="listByCustomer"  params='[customerId:"${customerInstance.customer.id}"]'>警告设置</g:link>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="paginateButtons">
				<g:paginate total="${customerInstanceTotal}"  params="${params}"/>
			</div>
		</div>
	</body>
</html>
