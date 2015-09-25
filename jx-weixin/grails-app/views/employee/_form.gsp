<%@ page import="com.surelution.wxmp.jx.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'certified', 'error')} ">
	<label for="certified">
		<g:message code="employee.certified.label" default="Certified" />
		
	</label>
	<g:checkBox name="certified" value="${employeeInstance?.certified}" />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="employee.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${employeeInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'codeExpiredAt', 'error')} required">
	<label for="codeExpiredAt">
		<g:message code="employee.codeExpiredAt.label" default="Code Expired At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="codeExpiredAt" precision="day"  value="${employeeInstance?.codeExpiredAt}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="employee.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${employeeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'subscriber', 'error')} required">
	<label for="subscriber">
		<g:message code="employee.subscriber.label" default="Subscriber" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subscriber" name="subscriber.id" from="${com.surelution.wxmp.jx.Subscriber.list()}" optionKey="id" required="" value="${employeeInstance?.subscriber?.id}" class="many-to-one"/>
</div>

