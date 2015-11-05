<%@page import="com.surelution.zjolap.SalesFullTime"%>
<%@ page import="com.surelution.zjolap.Sales" %>


 <sec:ifAnyGranted roles="ROLE_ADMIN">
<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="sales.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch" name="branch.id" from="${com.surelution.zjolap.Branch.list()}" optionKey="id" optionValue="name" required="" value="${salesInstance?.branch?.id}" class="many-to-one"/>
</div>
</sec:ifAnyGranted>
<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="sales.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${salesInstance?.name}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'fullTime', 'error')} ">
	<label for="fullTime">
		<g:message code="sales.fullTime.label" default="Full Time" />
		
	</label>
	<g:select name="fullTime.id" from="${SalesFullTime.list() }" optionKey="id" optionValue="name" value="${salesInstance.fullTime?.id }"/>
</div>

