<%@ page import="com.surelution.wxmp.jx.VoucherBatch" %>



<div class="fieldcontain ${hasErrors(bean: voucherBatchInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="voucherBatch.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: voucherBatchInstance, field: 'amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: voucherBatchInstance, field: 'countDaily', 'error')} required">
	<label for="countDaily">
		<g:message code="voucherBatch.countDaily.label" default="Count Daily" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="countDaily" type="number" value="${voucherBatchInstance.countDaily}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: voucherBatchInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="voucherBatch.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${voucherBatchInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voucherBatchInstance, field: 'eventName', 'error')} ">
	<label for="eventName">
		<g:message code="voucherBatch.eventName.label" default="Event Name" />
		
	</label>
	<g:textField name="eventName" value="${voucherBatchInstance?.eventName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voucherBatchInstance, field: 'key', 'error')} ">
	<label for="key">
		<g:message code="voucherBatch.key.label" default="Key" />
		
	</label>
	<g:textField name="key" value="${voucherBatchInstance?.key}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voucherBatchInstance, field: 'luckyNum', 'error')} ">
	<label for="luckyNum">
		<g:message code="voucherBatch.luckyNum.label" default="Lucky Num" />
		
	</label>
	<g:textField name="luckyNum" value="${voucherBatchInstance?.luckyNum}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voucherBatchInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="voucherBatch.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${voucherBatchInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voucherBatchInstance, field: 'priority', 'error')} required">
	<label for="priority">
		<g:message code="voucherBatch.priority.label" default="Priority" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="priority" type="number" value="${voucherBatchInstance.priority}" required=""/>
</div>

