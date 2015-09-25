<%@ page import="com.surelution.wxmp.jx.VoucherBatch" %>



<div class="fieldcontain ${hasErrors(bean: voucherBatchInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="voucherBatch.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${voucherBatchInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voucherBatchInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="voucherBatch.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${voucherBatchInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voucherBatchInstance, field: 'production', 'error')} ">
	<label for="production">
		<g:message code="voucherBatch.production.label" default="Production" />
		
	</label>
	<g:textField name="production" value="${voucherBatchInstance?.production}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voucherBatchInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="voucherBatch.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: voucherBatchInstance, field: 'price')}" required=""/>
</div>

