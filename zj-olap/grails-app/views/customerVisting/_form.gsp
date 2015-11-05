<%@page import="com.surelution.zjolap.Sales"%>
<%@page import="org.h2.command.ddl.CreateLinkedTable"%>
<%@ page import="com.surelution.zjolap.CustomerVisting" %>
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
    	    
          $("#vistingAt").datepicker({dateFormat: 'yy-mm-dd'});
  
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

<div class="fieldcontain ${hasErrors(bean: customerVistingInstance, field: 'customer', 'error')} required">
	<label for="customer">
		<g:message code="customerVisting.customer.label" default="Customer" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField name="customer.id"/>
	<g:textField id="comauto" name="comauto" style="width: 300px;"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerVistingInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="customerVisting.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${com.surelution.zjolap.CustomerVistingType.list()}" optionKey="id" optionValue="name" required="" value="${customerVistingInstance?.type?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerVistingInstance, field: 'sales', 'error')} required">
	<label for="sales">
		<g:message code="customerVisting.sales.label" default="Sales" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sales" name="sales.id" from="${sales?sales:Sales.list()}" optionKey="id" optionValue="${{ (it.branch?it.branch.name:"") + "->" + it.name} }" required="" value="${customerVistingInstance?.sales?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerVistingInstance, field: 'vistingAt', 'error')} required">
	<label for="vistingAt">
		<g:message code="customerVisting.vistingAt.label" default="Visting At" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="vistingAt" precision="day"  value="${customerVistingInstance?.vistingAt}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: customerVistingInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="customerVisting.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" value="${customerVistingInstance?.description}"/>
</div>

