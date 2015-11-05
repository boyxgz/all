
<%@page import="com.surelution.zjolap.Sales"%>
<%@ page import="com.surelution.zjolap.CustomerVisting" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customerVisting.label', default: 'CustomerVisting')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
  <link rel="stylesheet" href="${resource(file:'css/jquery-ui.css') }">
  <script src="${resource(file:'js/jquery-1.11.3.min.js') }"></script>
  <script src="${resource(file:'js/jquery-ui.min.js') }"></script>
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
    	    
          $("#vistingAtFrom").datepicker({dateFormat: 'yy-mm-dd'});
          $("#vistingAtTo").datepicker({dateFormat: 'yy-mm-dd'});
  
        })
        
        
        $(document).ready(function() {
			 $("#comauto").autocomplete({
			  source: function(request, response){
			   $.ajax({
			    url: "${createLink(controller:'customerVisting', action:'coustomerlist')}", // remote datasource
			    data: request,
			    success: function(data){
			     response(data); // set the response
			    },
			    error: function(){ // handle server errors
			     $.jGrowl("Unable to retrieve Companies", {
			      theme: 'ui-state-error ui-corner-all'   
			     });
			    }
			   });
			  },
			  minLength: 2, // triggered only after minimum 2 characters have been entered.
			  select: function(event, ui) { // event handler when user selects a company from the list.
			   $("#customer\\.id").val(ui.item.id); // update the hidden field.
			  }
			 });
			});
        
</script>
	</head>
	<body>
		<a href="#list-customerVisting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-customerVisting" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			
			<g:form action="list" >
				<fieldset class="form">
					
<div>
	<label for="customer">
		<g:message code="customerVisting.customer.label" default="Customer" />
	</label>
	<g:hiddenField name="customer.id"/>
	<g:textField id="comauto" name="comauto" style="width: 300px;"/>
</div>

<div>
	<label for="sales">
		<g:message code="customerVisting.sales.label" default="Sales" />
	</label>
	<g:select id="sales" name="sales.id" from="${sales?sales:Sales.list()}" noSelection="['':'']" optionKey="id" optionValue="${{ (it.branch?it.branch.name:"") + "->" + it.name} }" value="${customerVistingInstance?.sales?.id}"/>
</div>

<div>
	<label for="vistingAt">
		<g:message code="customerVisting.vistingAt.label" default="Visting At" />
	</label>
	<g:textField name="vistingAtFrom" value="${params?.vistingAtFrom}"  />~
	<g:textField name="vistingAtTo" value="${params?.vistingAtTo}"  />
</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="search" class="search" value="查询" />
				</fieldset>
			</g:form>
			
			<table>
				<thead>
					<tr>
					
						<th><g:message code="customerVisting.customer.label" default="Customer" /></th>
					
						<th><g:message code="customerVisting.sales.label" default="Sales" /></th>
					
						<th><g:message code="customerVisting.type.label" default="Type" /></th>
					
						<g:sortableColumn property="vistingAt" title="${message(code: 'customerVisting.vistingAt.label', default: 'Visting At')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'customerVisting.description.label', default: 'Description')}" />
					
						<th><g:message code="customerVisting.operator.label" default="Operator" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerVistingInstanceList}" status="i" var="customerVistingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${customerVistingInstance?.customer?.name}</td>
					
						<td>${customerVistingInstance.sales?.branch?.name}-&gt;${customerVistingInstance.sales.name}</td>
					
						<td>${customerVistingInstance.type.name}</td>
					
						<td><g:formatDate date="${customerVistingInstance.vistingAt}" /></td>
					
						<td>${fieldValue(bean: customerVistingInstance, field: "description")}</td>
					
						<td>${customerVistingInstance.operator?.username}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${customerVistingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
