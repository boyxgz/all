<%@page import="com.surelution.zjolap.Branch"%>
<%@ page import="com.surelution.zjolap.ThidrFactor" %>


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
    	    
          $("#influncedAt").datepicker({dateFormat: 'yy-mm-dd'});
  
        })
</script>

<div class="fieldcontain ${hasErrors(bean: thidrFactorInstance, field: 'branch', 'error')} ">
	<label for="branch">
		<g:message code="thidrFactor.branch.label" default="Branch" />
		
	</label>
	<g:select name="branch.id" noSelection="['': '全省']" default="none" from="${Branch.list() }" optionKey="id" optionValue="name" value="${thidrFactorInstance?.branch}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: thidrFactorInstance, field: 'influncedAt', 'error')} required">
	<label for="influncedAt">
		<g:message code="thidrFactor.influncedAt.label" default="Influnced At" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="influncedAt" value="${thidrFactorInstance?.influncedAt?.format("yyyy-MM-dd")}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: thidrFactorInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="thidrFactor.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${com.surelution.zjolap.ThidrFactorType.list()}" optionKey="id" optionValue="name" required="" value="${thidrFactorInstance?.type?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: thidrFactorInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="thidrFactor.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" value="${thidrFactorInstance?.description}"/>
</div>
