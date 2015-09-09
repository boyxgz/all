<%@ page import="com.surelution.wxmp.jx.RegisterPrize" %>



<div class="fieldcontain ${hasErrors(bean: registerPrizeInstance, field: 'awardedBy', 'error')} ">
	<label for="awardedBy">
		<g:message code="registerPrize.awardedBy.label" default="Awarded By" />
		
	</label>
	<g:select id="awardedBy" name="awardedBy.id" from="${com.surelution.wxmp.jx.User.list()}" optionKey="id" value="${registerPrizeInstance?.awardedBy?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: registerPrizeInstance, field: 'awardedAt', 'error')} ">
	<label for="awardedAt">
		<g:message code="registerPrize.awardedAt.label" default="Awarded At" />
		
	</label>
	<g:select id="awardedAt" name="awardedAt.id" from="${com.surelution.wxmp.jx.User.list()}" optionKey="id" value="${registerPrizeInstance?.awardedAt?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: registerPrizeInstance, field: 'subscriber', 'error')} required">
	<label for="subscriber">
		<g:message code="registerPrize.subscriber.label" default="Subscriber" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subscriber" name="subscriber.id" from="${com.surelution.wxmp.jx.Subscriber.list()}" optionKey="id" required="" value="${registerPrizeInstance?.subscriber?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: registerPrizeInstance, field: 'createAt', 'error')} required">
	<label for="createAt">
		<g:message code="registerPrize.createAt.label" default="Create At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createAt" precision="day"  value="${registerPrizeInstance?.createAt}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: registerPrizeInstance, field: 'prize', 'error')} required">
	<label for="prize">
		<g:message code="registerPrize.prize.label" default="Prize" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prize" name="prize.id" from="${com.surelution.wxmp.jx.Prize.list()}" optionKey="id" required="" value="${registerPrizeInstance?.prize?.id}" class="many-to-one"/>
</div>

