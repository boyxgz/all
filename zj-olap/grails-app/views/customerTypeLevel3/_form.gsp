<%@ page import="com.surelution.zjolap.CustomerTypeLevel3" %>



<div class="fieldcontain ${hasErrors(bean: customerTypeLevel3Instance, field: 'level2', 'error')} required">
	<label for="level2">
		<g:message code="customerTypeLevel2.label" default="Level2" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="level2" name="level2.id" from="${com.surelution.zjolap.CustomerTypeLevel2.getListForUpdate()}" optionValue="${{it.level1.name + '>>' + it.name}}" optionKey="id" required="" value="${customerTypeLevel3Instance?.level2?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerTypeLevel3Instance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="customerTypeLevel3.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${customerTypeLevel3Instance?.name}"/>
</div>

