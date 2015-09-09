<%@ page import="com.surelution.wxmp.jx.Fall2015PrizeRule" %>



<div class="fieldcontain ${hasErrors(bean: fall2015PrizeRuleInstance, field: 'cardType', 'error')} required">
	<label for="cardType">
		<g:message code="fall2015PrizeRule.cardType.label" default="Card Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="cardType" from="${com.surelution.wxmp.jx.Fall2015Receipt$CardType?.values()}" keys="${com.surelution.wxmp.jx.Fall2015Receipt$CardType.values()*.name()}" required="" value="${fall2015PrizeRuleInstance?.cardType?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015PrizeRuleInstance, field: 'from', 'error')} required">
	<label for="from">
		<g:message code="fall2015PrizeRule.from.label" default="From" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="from" type="number" value="${fall2015PrizeRuleInstance.from}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015PrizeRuleInstance, field: 'noLimited', 'error')} ">
	<label for="noLimited">
		<g:message code="fall2015PrizeRule.noLimited.label" default="No Limited" />
		
	</label>
	<g:checkBox name="noLimited" value="${fall2015PrizeRuleInstance?.noLimited}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015PrizeRuleInstance, field: 'to', 'error')} required">
	<label for="to">
		<g:message code="fall2015PrizeRule.to.label" default="To" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="to" type="number" value="${fall2015PrizeRuleInstance.to}" required=""/>
</div>

