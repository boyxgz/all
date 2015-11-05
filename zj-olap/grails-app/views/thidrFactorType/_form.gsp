<%@ page import="com.surelution.zjolap.ThidrFactorType" %>



<div class="fieldcontain ${hasErrors(bean: thidrFactorTypeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="thidrFactorType.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${thidrFactorTypeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: thidrFactorTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="thidrFactorType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${thidrFactorTypeInstance?.description}"/>
</div>

