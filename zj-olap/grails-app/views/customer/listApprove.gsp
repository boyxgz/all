
<%@ page import="com.surelution.zjolap.Customer"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'customer.label', default: 'Customer')}" />
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
	<a href="#list-customer" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<span class="menuButton"><a class="home" target='_blank'
			href="${createLink(uri: '/')}"><g:message
					code="default.home.label" /></a></span> 
	</div>
	<div id="list-customer" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<form action="listApprove">
			<fieldset class="form">
				<label for="branch"> <g:message code="customer.name.label"
						default="Branch" />
				</label>
				<g:textField name="customerName" value="${params.customerName}" />
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="search" class="search"
					value="${message(code: 'default.button.search.label', default: 'Search')}" />
			</fieldset>
		</form>
		<div  style="width:1000px;height:480px;overflow:scroll;">
		<table style="width:100%">
			<thead>
				<tr>
					<g:sortableColumn property="name"
						title="${message(code: 'customer.name.label', default: 'Name')}"
						params="${params}" />

					<g:sortableColumn property="tel"
						title="${message(code: 'customer.tel.label', default: 'tel')}"
						params="${params}" />

					<th>
						${message(code: 'customer.customerType.label', default: 'customerType')}
					</th>
					<!-- 
					  <th>增加的公司</th>
					   -->
					<th>提交公司</th>
					<th>提交时间</th>
					<th>状态</th>
					<th>省公司操作原因</th>
					 <sec:ifAnyGranted roles="ROLE_ADMIN">
					<th style="width: 300px">审批</th>
					</sec:ifAnyGranted>
				</tr>
			</thead>
			<tbody>
				<g:each in="${customerInstanceList}" status="i"
					var="customerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
						    <g:link action="show" target='_blank' id="${customerInstance.id}">
							${fieldValue(bean: customerInstance, field: "name")}
							</g:link>
						</td>

						<td>
							${fieldValue(bean: customerInstance, field: "tel")}
						</td>

						<td>
							${customerInstance?.customerType?.name}
						</td>

						<!-- 
						<td>${customerInstance?.addByBranch?.name}</td>
						 -->
			
						<td>
							${customerInstance?.updateByBranch?.name}
						</td>
			
						<td>
						<g:formatDate date="${customerInstance?.dateCreated}" format="yyyy-MM-dd"/>
						</td>
						
						<td>
							${customerInstance?.statusName}
						</td>

						<td>
							${customerInstance?.reason}
						</td>

						
						<td>
						 <sec:ifAnyGranted roles="ROLE_ADMIN">
						    <g:if test="${customerInstance?.status !='DISABLE' && customerInstance?.status !='ADDD'}">
						    <g:form action="saveApprove" method="post">
						       <g:hiddenField name="id" value="${customerInstance.id}"/>
						       <g:actionSubmit action="saveApprove" value="同意"/>
						       <g:actionSubmit action="saveDisApprove" value="驳回"/>
						       原因：<g:textField name="reason" value="${customerInstance.reason}"/>
						    </g:form>
							
							</g:if>
								</sec:ifAnyGranted>
							
							</td>
						
					</tr>
				</g:each>
			</tbody>
		</table>
		</div>
		<div class="paginateButtons">
			<g:paginate total="${customerInstanceTotal}" params="${params}" />
		</div>
	</div>
</body>
</html>
