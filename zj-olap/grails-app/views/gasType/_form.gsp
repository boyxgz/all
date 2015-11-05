<%@ page import="com.surelution.zjolap.GasType" %>



<div class="fieldcontain ${hasErrors(bean: gasTypeInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="gasType.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.surelution.zjolap.Category.list()}" optionKey="id" optionValue="name" required="" value="${gasTypeInstance?.category?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gasTypeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="gasType.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${gasTypeInstance?.name}"/>
</div>

