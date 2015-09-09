<%@ page import="com.surelution.wxmp.jx.Fall2015Receipt" %>



<div class="fieldcontain ${hasErrors(bean: fall2015ReceiptInstance, field: 'rule', 'error')} required">
	<label for="rule">
		<g:message code="fall2015Receipt.rule.label" default="Rule" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="rule" name="rule.id" from="${com.surelution.wxmp.jx.Fall2015PrizeRule.list()}" optionKey="id" required="" value="${fall2015ReceiptInstance?.rule?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015ReceiptInstance, field: 'transNo', 'error')} ">
	<label for="transNo">
		<g:message code="fall2015Receipt.transNo.label" default="Trans No" />
		
	</label>
	<g:textField name="transNo" value="${fall2015ReceiptInstance?.transNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015ReceiptInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="fall2015Receipt.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: fall2015ReceiptInstance, field: 'amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015ReceiptInstance, field: 'cardNo', 'error')} ">
	<label for="cardNo">
		<g:message code="fall2015Receipt.cardNo.label" default="Card No" />
		
	</label>
	<g:textField name="cardNo" value="${fall2015ReceiptInstance?.cardNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015ReceiptInstance, field: 'cardType', 'error')} required">
	<label for="cardType">
		<g:message code="fall2015Receipt.cardType.label" default="Card Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="cardType" from="${com.surelution.wxmp.jx.Fall2015Receipt$CardType?.values()}" keys="${com.surelution.wxmp.jx.Fall2015Receipt$CardType.values()*.name()}" required="" value="${fall2015ReceiptInstance?.cardType?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015ReceiptInstance, field: 'receiptIndex', 'error')} required">
	<label for="receiptIndex">
		<g:message code="fall2015Receipt.receiptIndex.label" default="Receipt Index" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="receiptIndex" type="number" value="${fall2015ReceiptInstance.receiptIndex}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: fall2015ReceiptInstance, field: 'subscriber', 'error')} required">
	<label for="subscriber">
		<g:message code="fall2015Receipt.subscriber.label" default="Subscriber" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subscriber" name="subscriber.id" from="${com.surelution.wxmp.jx.Subscriber.list()}" optionKey="id" required="" value="${fall2015ReceiptInstance?.subscriber?.id}" class="many-to-one"/>
</div>

