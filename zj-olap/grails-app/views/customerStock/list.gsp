
<%@ page import="com.surelution.zjolap.CustomerStock" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customerStock.label', default: 'CustomerStock')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		
		<r:require module="jquery-ui"/>
		<script type="text/javascript" src="${resource(file:'js/jquery.stickytableheaders.js') }"></script>
		<script type="text/javascript">
	        $(document).ready(function()
	        {

	        	$.datepicker.regional['zh-cn'] = {
	        	        closeText: '关闭',
	        	        prevText: '&#x3C;上月',
	        	        nextText: '下月&#x3E;',
	        	        currentText: '今天',
	        	        changeMonth: true,
	        	        changeYear: true,
	        	        monthNames: ['一月','二月','三月','四月','五月','六月',
	        	        '七月','八月','九月','十月','十一月','十二月'],
	        	        monthNamesShort: ['一月','二月','三月','四月','五月','六月',
	        	        '七月','八月','九月','十月','十一月','十二月'],
	        	        dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
	        	        dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
	        	        dayNamesMin: ['日','一','二','三','四','五','六'],
	        	        weekHeader: '周',
	        	        dateFormat: 'yy-mm-dd',
	        	        firstDay: 1,
	        	        isRTL: false,
	        	        showButtonPanel: true,
	        	        showMonthAfterYear: true
	        	        };
	        	    $.datepicker.setDefaults($.datepicker.regional['zh-cn']);

	          $("#dateBegin").datepicker({dateFormat: 'yy-mm-dd'});
	          $("#dateEnd").datepicker({dateFormat: 'yy-mm-dd'});

	          $("table").stickyTableHeaders({ scrollableArea: $(".scaffold-list")[0]});
	        })
	     </script>
	</head>
	<body>
		<a href="#list-customerStock" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div id="list-customerStock" class="content scaffold-list" role="main">
		<g:form action="list" >
					<fieldset class="form">
					    <sec:ifAnyGranted roles="ROLE_ADMIN">
					    
						<div class="fieldcontain  ">
							<label for="branch">
								<g:message code="salesOrder.branch.label" default="Branch" />
							</label>
							<g:select id="branch" name="branchId" from="${com.surelution.zjolap.Branch.list()}" noSelection="['':'']" optionKey="id" optionValue="name" value="${params['branchId']}" class="many-to-one"/>
						</div>
						</sec:ifAnyGranted>
						
						
						<div class="fieldcontain">
							<label for="salingAt">
								<g:message code="customerStock.cdate.label" default="Date" />
							</label>
							<g:textField name="dateBegin" value="${params.dateBegin}" />~
							<g:textField name="dateEnd" value="${params.dateEnd}" />
						</div>
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="search" class="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
						<g:submitButton name="downExcelFile" class="search" value="excel导出"/>
					</fieldset>
					</g:form>
			<sec:ifAnyGranted roles="ROLE_ADMIN">		
				<h2>${branchStr}</h2>	
			</sec:ifAnyGranted>
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="branch" title="${message(code: 'customerStock.branch.label', default: 'Branch')}"  params="${params}"/>
						<g:sortableColumn property="customer" title="${message(code: 'customerStock.customer.label', default: 'Customer')}"  params="${params}"/>
						<g:sortableColumn property="customerType" title="${message(code: 'salesOrder.customerType.label', default: '客户性质')}"  params="${params}"/>
						<g:sortableColumn property="customerType" title="${message(code: 'salesOrder.customerTypelevel2.label', default: '机构用户分类')}"  params="${params}"/>
						<g:sortableColumn property="customerType" title="${message(code: 'salesOrder.customerTypelevel3.label', default: '工业分类')}"  params="${params}"/>
						<g:sortableColumn property="cdate" title="${message(code: 'customerStock.cdate.label', default: 'Date')}"  params="${params}"/>
						<g:sortableColumn property="category" title="${message(code: 'customerStock.category.label', default: 'Gas Type')}"  params="${params}"/>
						<g:sortableColumn property="gasType" title="${message(code: 'customerStock.gasType.label', default: 'Gas Type')}"  params="${params}"/>
						<g:sortableColumn property="stockQty" title="${message(code: 'customerStock.stockQty.label', default: 'Stock Qty')}"  params="${params}"/>
						<g:sortableColumn property="status" title="${message(code: 'customerStock.status.label', default: 'Status')}"  params="${params}"/>
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerStockInstanceList}" status="i" var="customerStockInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${customerStockInstance.id}">${customerStockInstance?.customerBranch?.branch?.name}</g:link></td>
						
						<td>${customerStockInstance?.customerBranch?.customer?.name}</td>
						<td>${customerStockInstance?.customerBranch?.customer?.customerType?.level2?.level1?.name}</td>
						<td>${customerStockInstance?.customerBranch?.customer?.customerType?.level2?.displayName}</td>
						<td>${customerStockInstance?.customerBranch?.customer?.customerType?.displayName}</td>
						<td><g:formatDate format="yyyy-MM-dd" date="${customerStockInstance?.date?.date}"/></td>
					
						<td>${customerStockInstance.gasType?.category?.name}</td>
						<td>${customerStockInstance.gasType.name}</td>
					
						<td>${fieldValue(bean: customerStockInstance, field: "stockQty")}</td>
						
						<td>${fieldValue(bean: customerStockInstance, field: "statusName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="paginateButtons" id="paginateButtons">
				<g:paginate total="${customerStockInstanceTotal}"  params="${params}"/>
			</div>
		</div>
	</body>
</html>
