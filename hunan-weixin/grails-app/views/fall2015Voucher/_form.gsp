<%@ page import="com.surelution.wxmp.jx.Fall2015Voucher" %>



<div class="fieldcontain ${hasErrors(bean: fall2015VoucherInstance, field: 'paiedAt', 'error')} ">
	<label for="paiedAt">
		<g:message code="fall2015Voucher.paiedAt.label" default="Paied At" />
		
	</label>
	<g:datePicker name="paiedAt" precision="day"  value="${fall2015VoucherInstance?.paiedAt}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015VoucherInstance, field: 'whoPaied', 'error')} ">
	<label for="whoPaied">
		<g:message code="fall2015Voucher.whoPaied.label" default="Who Paied" />
		
	</label>
	<g:select id="whoPaied" name="whoPaied.id" from="${com.surelution.wxmp.jx.User.list()}" optionKey="id" value="${fall2015VoucherInstance?.whoPaied?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015VoucherInstance, field: 'owner', 'error')} ">
	<label for="owner">
		<g:message code="fall2015Voucher.owner.label" default="Owner" />
		
	</label>
	<g:select id="owner" name="owner.id" from="${com.surelution.wxmp.jx.Subscriber.list()}" optionKey="id" value="${fall2015VoucherInstance?.owner?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015VoucherInstance, field: 'availableBeginAt', 'error')} ">
	<label for="availableBeginAt">
		<g:message code="fall2015Voucher.availableBeginAt.label" default="Available Begin At" />
		
	</label>
	<g:datePicker name="availableBeginAt" precision="day"  value="${fall2015VoucherInstance?.availableBeginAt}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015VoucherInstance, field: 'fullSn', 'error')} ">
	<label for="fullSn">
		<g:message code="fall2015Voucher.fullSn.label" default="Full Sn" />
		
	</label>
	<g:textField name="fullSn" value="${fall2015VoucherInstance?.fullSn}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015VoucherInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="fall2015Voucher.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: fall2015VoucherInstance, field: 'amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015VoucherInstance, field: 'availableEndAt', 'error')} required">
	<label for="availableEndAt">
		<g:message code="fall2015Voucher.availableEndAt.label" default="Available End At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="availableEndAt" precision="day"  value="${fall2015VoucherInstance?.availableEndAt}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015VoucherInstance, field: 'batch', 'error')} required">
	<label for="batch">
		<g:message code="fall2015Voucher.batch.label" default="Batch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="batch" name="batch.id" from="${com.surelution.wxmp.jx.VoucherBatch.list()}" optionKey="id" required="" value="${fall2015VoucherInstance?.batch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015VoucherInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="fall2015Voucher.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${fall2015VoucherInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015VoucherInstance, field: 'reviewStatus', 'error')} required">
	<label for="reviewStatus">
		<g:message code="fall2015Voucher.reviewStatus.label" default="Review Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="reviewStatus" from="${com.surelution.wxmp.jx.Fall2015Voucher$ReviewStatus?.values()}" keys="${com.surelution.wxmp.jx.Fall2015Voucher$ReviewStatus.values()*.name()}" required="" value="${fall2015VoucherInstance?.reviewStatus?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015VoucherInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="fall2015Voucher.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.surelution.wxmp.jx.Voucher$VoucherStatus?.values()}" keys="${com.surelution.wxmp.jx.Voucher$VoucherStatus.values()*.name()}" required="" value="${fall2015VoucherInstance?.status?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015VoucherInstance, field: 'ticket', 'error')} required">
	<label for="ticket">
		<g:message code="fall2015Voucher.ticket.label" default="Ticket" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ticket" name="ticket.id" from="${com.surelution.wxmp.jx.DrawPrizeTicket.list()}" optionKey="id" required="" value="${fall2015VoucherInstance?.ticket?.id}" class="many-to-one"/>
</div>

