
<%@ page import="com.surelution.zjolap.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
		</div>
		<div id="list-customer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<form action="listDaysSalesOrderWarning">
			   <fieldset class="form">
			   <sec:ifAnyGranted roles="ROLE_ADMIN">
						<div class="fieldcontain  ">
							<label for="branch">
								<g:message code="salesOrder.branch.label" default="Branch" />
							</label>
							<g:select id="branch" name="branchId" from="${com.surelution.zjolap.Branch.list()}"  optionKey="id" optionValue="name" value="${params['branchId']}" class="many-to-one"/>
						</div>
				</sec:ifAnyGranted>
				<div class="fieldcontain  ">
							<label for="branch">
								<g:message code="customer.name.label" default="Branch" />
							</label>
							<g:textField name="customerName" value="${params.customerName}"/>
						</div>
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
					   
					    <th>
					    	${message(code: 'customer.customerType.label', default: 'customerType')}
					    </th>
					     <th>
					      	 油品类型
					    </th>
					     <th>
					       	油品品号
					    </th>
					    <th>
					    	警告天数
					    </th>
					    <th>
					    	上次采购时间
					    </th>
					     
					</tr>
				</thead>
				<tbody>
				<g:each in="${baseStockWarningInstanceList}" status="i" var="wrcb">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
						<td>${wrcb?.customerBranch?.customer?.name}</td>
						
						<td>${wrcb?.customerBranch?.customer?.tel}</td>
						
						<td>${wrcb?.customerBranch?.customer?.customerType?.name}</td>
						
						<td>${wrcb?.rule?.gasType?.category?.name}</td>
						
						<td>${wrcb?.rule?.gasType?.name}</td>
						
						<td>${wrcb?.warningQty}</td>
						
						<td>
						<g:if test="${wrcb?.lastDate}">
					   		 <g:formatDate format="yyyy-MM-dd" date="${wrcb?.lastDate}"/>
					    </g:if>
					    <g:else>
					    	尚未采购
					    </g:else>
						 </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="paginateButtons">
				<g:paginate total="${baseStockWarningInstanceTotal}"  params="${params}"/>
			</div>
		</div>
	</body>
</html>