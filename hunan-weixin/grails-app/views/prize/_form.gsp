<%@ page import="com.surelution.wxmp.jx.Prize" %>



<div class="fieldcontain ${hasErrors(bean: prizeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="prize.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${prizeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prizeInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="prize.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${prizeInstance.amount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: prizeInstance, field: 'empty', 'error')} ">
	<label for="empty">
		<g:message code="prize.empty.label" default="Empty" />
		
	</label>
	<g:checkBox name="empty" value="${prizeInstance?.empty}" />
</div>

<div class="fieldcontain ${hasErrors(bean: prizeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="prize.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${prizeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prizeInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="prize.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: prizeInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: prizeInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="prize.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="code" value="${fieldValue(bean: prizeInstance, field: 'code')}" required=""/>
</div>

