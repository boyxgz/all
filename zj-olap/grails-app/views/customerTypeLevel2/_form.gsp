<%@ page import="com.surelution.zjolap.CustomerTypeLevel2" %>



<div class="fieldcontain ${hasErrors(bean: customerTypeLevel2Instance, field: 'level1', 'error')} required">
	<label for="level1">
		<g:message code="customerType.label" default="Level1" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="level1" name="level1.id" from="${com.surelution.zjolap.CustomerType.getListForUpdate()}" optionKey="id" required="" optionValue="name" value="${customerTypeLevel2Instance?.level1?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerTypeLevel2Instance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="customerTypeLevel2.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${customerTypeLevel2Instance?.name}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: customerTypeLevel2Instance, field: 'isHasChild', 'error')} ">
	<label for="isHasChild">
		<g:message code="isHasChild.label" default="isHasChild" />
		
	</label>
	<g:checkBox name="isHasChild" value="${customerTypeLevel2Instance?.isHasChild}" />
</div>



