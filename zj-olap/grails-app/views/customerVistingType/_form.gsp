<%@ page import="com.surelution.zjolap.CustomerVistingType" %>



<div class="fieldcontain ${hasErrors(bean: customerVistingTypeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="customerVistingType.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${customerVistingTypeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerVistingTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="customerVistingType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${customerVistingTypeInstance?.description}"/>
</div>

