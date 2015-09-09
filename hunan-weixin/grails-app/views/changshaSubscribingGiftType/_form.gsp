<%@ page import="com.surelution.wxmp.jx.ChangshaSubscribingGiftType" %>



<div class="fieldcontain ${hasErrors(bean: changshaSubscribingGiftTypeInstance, field: 'key', 'error')} ">
	<label for="key">
		<g:message code="changshaSubscribingGiftType.key.label" default="Key" />
		
	</label>
	<g:textField name="key" value="${changshaSubscribingGiftTypeInstance?.key}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changshaSubscribingGiftTypeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="changshaSubscribingGiftType.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${changshaSubscribingGiftTypeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changshaSubscribingGiftTypeInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="changshaSubscribingGiftType.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: changshaSubscribingGiftTypeInstance, field: 'price')}" required=""/>
</div>

