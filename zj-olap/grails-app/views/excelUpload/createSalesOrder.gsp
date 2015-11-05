<%@ page import="com.surelution.zjolap.ExcelUpload" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'excelUpload.label', default: 'ExcelUpload')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<r:require module="jquery-ui"/>
		
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
	        	        dateFormat: 'yy-mm',
	        	        firstDay: 1,
	        	        isRTL: false,
	        	        showButtonPanel: true,
	        	        showMonthAfterYear: true
	        	        };
	        	    $.datepicker.setDefaults($.datepicker.regional['zh-cn']);

	          $("#excelMonth").datepicker({dateFormat: 'yy-mm'});
	      
	         

				
	        
	        })
	        </script>
	</head>
	<body>
		<a href="#create-excelUpload" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<sec:ifAnyGranted roles="ROLE_ADMIN">
			<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
			</sec:ifAnyGranted>
		</div>
		<div id="create-excelUpload" class="content scaffold-create" role="main">
			<h1><g:message code="default.createSalesOrder.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${excelUploadInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${excelUploadInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:each in="${excelMessages }" var="excelMessage">
				<p style="color: red">${excelMessage.row + 1 }行${excelMessage.column }列${excelMessage.message }</p>
			</g:each>
			<g:uploadForm action="saveSalesOrder">
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: excelUploadInstance, field: 'uploadedAt', 'error')} required">
						<label for="uploadedAt">
							<g:message code="excelUpload.file.label" default="File name" />
							<span class="required-indicator">*</span>
						</label>
						<input type="file" name="excelFile"/>
					</div>
					
					<div >
						<label for="excelMonth">
							结算月
							<g:textField name="excelMonth" value="${params.month}"/>
						</label>
					</div>
				</fieldset>
				
				
				
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:uploadForm>
		</div>
	</body>
</html>
