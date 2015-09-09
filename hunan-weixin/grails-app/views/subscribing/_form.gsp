<%@ page import="com.surelution.wxmp.jx.Subscribing" %>



<div class="fieldcontain ${hasErrors(bean: subscribingInstance, field: 'comeFrom', 'error')} ">
	<label for="comeFrom">
		<g:message code="subscribing.comeFrom.label" default="Come From" />
		
	</label>
	<g:textField name="comeFrom" value="${subscribingInstance?.comeFrom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subscribingInstance, field: 'subscriber', 'error')} required">
	<label for="subscriber">
		<g:message code="subscribing.subscriber.label" default="Subscriber" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subscriber" name="subscriber.id" from="${com.surelution.wxmp.jx.Subscriber.list()}" optionKey="id" required="" value="${subscribingInstance?.subscriber?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subscribingInstance, field: 'subscribingAt', 'error')} required">
	<label for="subscribingAt">
		<g:message code="subscribing.subscribingAt.label" default="Subscribing At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="subscribingAt" precision="day"  value="${subscribingInstance?.subscribingAt}"  />
</div>

