<%@ page import="com.surelution.wxmp.jx.CardPrecontracting" %>



<div class="fieldcontain ${hasErrors(bean: cardPrecontractingInstance, field: 'dateOfFetch', 'error')} required">
	<label for="dateOfFetch">
		<g:message code="cardPrecontracting.dateOfFetch.label" default="Date Of Fetch" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfFetch" precision="day"  value="${cardPrecontractingInstance?.dateOfFetch}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: cardPrecontractingInstance, field: 'precontractingDate', 'error')} required">
	<label for="precontractingDate">
		<g:message code="cardPrecontracting.precontractingDate.label" default="Precontracting Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="precontractingDate" precision="day"  value="${cardPrecontractingInstance?.precontractingDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: cardPrecontractingInstance, field: 'remark', 'error')} ">
	<label for="remark">
		<g:message code="cardPrecontracting.remark.label" default="Remark" />
		
	</label>
	<g:textField name="remark" value="${cardPrecontractingInstance?.remark}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cardPrecontractingInstance, field: 'stationOfFetch', 'error')} required">
	<label for="stationOfFetch">
		<g:message code="cardPrecontracting.stationOfFetch.label" default="Station Of Fetch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stationOfFetch" name="stationOfFetch.id" from="${com.surelution.wxmp.jx.GasStation.list()}" optionKey="id" required="" value="${cardPrecontractingInstance?.stationOfFetch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cardPrecontractingInstance, field: 'subscriber', 'error')} required">
	<label for="subscriber">
		<g:message code="cardPrecontracting.subscriber.label" default="Subscriber" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subscriber" name="subscriber.id" from="${com.surelution.wxmp.jx.Subscriber.list()}" optionKey="id" required="" value="${cardPrecontractingInstance?.subscriber?.id}" class="many-to-one"/>
</div>

