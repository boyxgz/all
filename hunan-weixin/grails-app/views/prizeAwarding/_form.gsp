<%@ page import="com.surelution.wxmp.jx.PrizeAwarding" %>



<div class="fieldcontain ${hasErrors(bean: prizeAwardingInstance, field: 'awardedBy', 'error')} ">
	<label for="awardedBy">
		<g:message code="prizeAwarding.awardedBy.label" default="Awarded By" />
		
	</label>
	<g:textField name="awardedBy" value="${prizeAwardingInstance?.awardedBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prizeAwardingInstance, field: 'awardingAt', 'error')} required">
	<label for="awardingAt">
		<g:message code="prizeAwarding.awardingAt.label" default="Awarding At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="awardingAt" precision="day"  value="${prizeAwardingInstance?.awardingAt}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: prizeAwardingInstance, field: 'prize', 'error')} required">
	<label for="prize">
		<g:message code="prizeAwarding.prize.label" default="Prize" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prize" name="prize.id" from="${com.surelution.wxmp.jx.Prize.list()}" optionKey="id" required="" value="${prizeAwardingInstance?.prize?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prizeAwardingInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="prizeAwarding.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="status" name="status.id" from="${com.surelution.wxmp.jx.AwardingStatus.list()}" optionKey="id" required="" value="${prizeAwardingInstance?.status?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prizeAwardingInstance, field: 'subscriber', 'error')} required">
	<label for="subscriber">
		<g:message code="prizeAwarding.subscriber.label" default="Subscriber" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subscriber" name="subscriber.id" from="${com.surelution.wxmp.jx.Subscriber.list()}" optionKey="id" required="" value="${prizeAwardingInstance?.subscriber?.id}" class="many-to-one"/>
</div>

