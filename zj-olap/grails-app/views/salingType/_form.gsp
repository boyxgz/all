<%@ page import="com.surelution.zjolap.SalingType" %>



<div class="fieldcontain ${hasErrors(bean: salingTypeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="salingType.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${salingTypeInstance?.name}"/>
</div>

