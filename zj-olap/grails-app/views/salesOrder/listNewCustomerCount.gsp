
<%@ page import="com.surelution.zjolap.ExcelUpload"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>新客户数量</title>
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
    	        dateFormat: 'yy-mm-dd',
    	        firstDay: 1,
    	        isRTL: false,
    	        showButtonPanel: true,
    	        showMonthAfterYear: true
    	        };
    	    $.datepicker.setDefaults($.datepicker.regional['zh-cn']);
    	    
          $("#timeFrom").datepicker({dateFormat: 'yy-mm-dd'});
          $("#timeTo").datepicker({dateFormat: 'yy-mm-dd'});
  
        })

</script>
</head>
<body>
	<a href="#list-excelUpload" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<span class="menuButton"><a class="home"
			href="${createLink(uri: '/')}"><g:message
					code="default.home.label" /></a></span>
	</div>
	<div id="list-excelUpload" class="content scaffold-list" role="main">
		<h1>新客户数量</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>

		<g:form action="listNewCustomerCount">
			<fieldset class="form">
				<sec:ifAnyGranted roles="ROLE_ADMIN">

					<div class="fieldcontain ">
						<label for="branch"> <g:message
								code="salesOrder.branch.label" default="Branch" />
						</label>
						<g:select id="branch" name="branchId"
							from="${com.surelution.zjolap.Branch.list()}"
							noSelection="['0':'全部']" optionKey="id" optionValue="name"
							value="${params['branchId']}" class="many-to-one" />
					</div>
					
					
					
				</sec:ifAnyGranted>

				<div class="fieldcontain ">
							<label for="salingAt">
								<g:message code="newCustomer.date.label" default="time" />
							</label>
							<g:textField name="timeFrom" value="${params['timeFrom']}" />~
							<g:textField name="timeTo" value="${params['timeTo']}" />
				</div>
						
				<div class="fieldcontain  ">
					<label for="isBranch"> <g:message code="isBranch.label"
							default="isBranch" />
					</label>
					<g:checkBox name="isBranch" value="${params['isBranch']}" />
				     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label for="isMonth"> <g:message code="isMonth.label"
							default="isMonth" />
					</label>
					<g:checkBox name="isMonth" value="${params['isMonth']}" />
					
					
				</div>
				<fieldset class="buttons">
					<g:submitButton name="search" class="search"
						value="${message(code: 'default.button.search.label', default: 'Search')}" />
				</fieldset>
			</fieldset>
		</g:form>

		<table>
			<thead>
				<tr>
					<th>分公司</th>
					<th>时间</th>
					<th>数量</th>

				</tr>
			</thead>
			<tbody>
				<g:each in="${reesultList}" status="i" var="nc">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">


						<td>
							${nc?.branch}
						</td>
						<td>
							${nc?.year} <g:if test="${nc?.month} ">
								<g:formatNumber number="${nc?.month}" format="-00" />
							</g:if>
						</td>

						<td>
							${nc?.count}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="paginateButtons">
			<g:paginate total="${resultCount}" params="${params}" />
		</div>
	</div>
</body>
</html>
