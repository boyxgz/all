<%@ page import="com.surelution.wxmp.jx.Voucher" %>



<div class="fieldcontain ${hasErrors(bean: voucherInstance, field: 'sn', 'error')} ">
	<label for="sn">
		<g:message code="voucher.sn.label" default="Sn" />
		
	</label>
	<g:textField name="sn" value="${voucherInstance?.sn}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voucherInstance, field: 'cashier', 'error')} ">
	<label for="cashier">
		<g:message code="voucher.cashier.label" default="Cashier" />
		
	</label>
	<g:select id="cashier" name="cashier.id" from="${com.surelution.wxmp.jx.User.list()}" optionKey="id" value="${voucherInstance?.cashier?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voucherInstance, field: 'paidAt', 'error')} ">
	<label for="paidAt">
		<g:message code="voucher.paidAt.label" default="Paid At" />
		
	</label>
	<g:datePicker name="paidAt" precision="day"  value="${voucherInstance?.paidAt}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: voucherInstance, field: 'batch', 'error')} required">
	<label for="batch">
		<g:message code="voucher.batch.label" default="Batch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="batch" name="batch.id" from="${com.surelution.wxmp.jx.VoucherBatch.list()}" optionKey="id" required="" value="${voucherInstance?.batch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voucherInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="voucher.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.surelution.wxmp.jx.Voucher$VoucherStatus?.values()}" keys="${com.surelution.wxmp.jx.Voucher$VoucherStatus.values()*.name()}" required="" value="${voucherInstance?.status?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voucherInstance, field: 'subscriber', 'error')} required">
	<label for="subscriber">
		<g:message code="voucher.subscriber.label" default="Subscriber" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subscriber" name="subscriber.id" from="${com.surelution.wxmp.jx.Subscriber.list()}" optionKey="id" required="" value="${voucherInstance?.subscriber?.id}" class="many-to-one"/>
</div>

