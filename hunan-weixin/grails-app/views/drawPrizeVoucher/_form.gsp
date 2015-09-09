<%@ page import="com.surelution.wxmp.jx.DrawPrizeVoucher" %>



<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'paiedAt', 'error')} ">
	<label for="paiedAt">
		<g:message code="drawPrizeVoucher.paiedAt.label" default="Paied At" />
		
	</label>
	<g:datePicker name="paiedAt" precision="day"  value="${drawPrizeVoucherInstance?.paiedAt}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'whoPaied', 'error')} ">
	<label for="whoPaied">
		<g:message code="drawPrizeVoucher.whoPaied.label" default="Who Paied" />
		
	</label>
	<g:select id="whoPaied" name="whoPaied.id" from="${com.surelution.wxmp.jx.User.list()}" optionKey="id" value="${drawPrizeVoucherInstance?.whoPaied?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'owner', 'error')} ">
	<label for="owner">
		<g:message code="drawPrizeVoucher.owner.label" default="Owner" />
		
	</label>
	<g:select id="owner" name="owner.id" from="${com.surelution.wxmp.jx.Subscriber.list()}" optionKey="id" value="${drawPrizeVoucherInstance?.owner?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'availableBeginAt', 'error')} ">
	<label for="availableBeginAt">
		<g:message code="drawPrizeVoucher.availableBeginAt.label" default="Available Begin At" />
		
	</label>
	<g:datePicker name="availableBeginAt" precision="day"  value="${drawPrizeVoucherInstance?.availableBeginAt}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'fullSn', 'error')} ">
	<label for="fullSn">
		<g:message code="drawPrizeVoucher.fullSn.label" default="Full Sn" />
		
	</label>
	<g:textField name="fullSn" value="${drawPrizeVoucherInstance?.fullSn}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="drawPrizeVoucher.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: drawPrizeVoucherInstance, field: 'amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'availableEndAt', 'error')} required">
	<label for="availableEndAt">
		<g:message code="drawPrizeVoucher.availableEndAt.label" default="Available End At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="availableEndAt" precision="day"  value="${drawPrizeVoucherInstance?.availableEndAt}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'batch', 'error')} required">
	<label for="batch">
		<g:message code="drawPrizeVoucher.batch.label" default="Batch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="batch" name="batch.id" from="${com.surelution.wxmp.jx.VoucherBatch.list()}" optionKey="id" required="" value="${drawPrizeVoucherInstance?.batch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="drawPrizeVoucher.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${drawPrizeVoucherInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="drawPrizeVoucher.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.surelution.wxmp.jx.Voucher$VoucherStatus?.values()}" keys="${com.surelution.wxmp.jx.Voucher$VoucherStatus.values()*.name()}" required="" value="${drawPrizeVoucherInstance?.status?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'ticket', 'error')} required">
	<label for="ticket">
		<g:message code="drawPrizeVoucher.ticket.label" default="Ticket" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ticket" name="ticket.id" from="${com.surelution.wxmp.jx.DrawPrizeTicket.list()}" optionKey="id" required="" value="${drawPrizeVoucherInstance?.ticket?.id}" class="many-to-one"/>
</div>

