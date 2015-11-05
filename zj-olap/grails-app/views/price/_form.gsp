<%@ page import="com.surelution.zjolap.Price" %>



<div class="fieldcontain ${hasErrors(bean: priceInstance, field: 'from', 'error')} required">
	<label for="from">
		<g:message code="price.from.label" default="From" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="from" precision="day"  value="${priceInstance?.from}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: priceInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="price.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" type="number" value="${fieldValue(bean: priceInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: priceInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="price.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${com.surelution.zjolap.GasType.list()}" optionKey="id" optionValue="name" required="" value="${priceInstance?.type?.id}" class="many-to-one"/>
</div>

