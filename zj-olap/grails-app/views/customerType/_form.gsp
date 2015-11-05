<%@ page import="com.surelution.zjolap.CustomerType" %>


<div class="fieldcontain ${hasErrors(bean: customerTypeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="customerType.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${customerTypeInstance?.name}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: customerTypeInstance, field: 'isHasChild', 'error')} ">
	<label for="isHasChild">
		<g:message code="isHasChild.label" default="isHasChild" />
		
	</label>
	<g:checkBox name="isHasChild" value="${customerTypeInstance?.isHasChild}" />
</div>