<%@ page import="com.surelution.wxmp.jx.Vehicle" %>



<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'engineId', 'error')} ">
	<label for="engineId">
		<g:message code="vehicle.engineId.label" default="Engine Id" />
		
	</label>
	<g:textField name="engineId" value="${vehicleInstance?.engineId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'subscriber', 'error')} required">
	<label for="subscriber">
		<g:message code="vehicle.subscriber.label" default="Subscriber" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subscriber" name="subscriber.id" from="${com.surelution.wxmp.jx.Subscriber.list()}" optionKey="id" required="" value="${vehicleInstance?.subscriber?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="vehicle.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${com.surelution.wxmp.jx.VehicleType.list()}" optionKey="id" required="" value="${vehicleInstance?.type?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'vId', 'error')} ">
	<label for="vId">
		<g:message code="vehicle.vId.label" default="VI d" />
		
	</label>
	<g:textField name="vId" value="${vehicleInstance?.vId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'vNo', 'error')} ">
	<label for="vNo">
		<g:message code="vehicle.vNo.label" default="VN o" />
		
	</label>
	<g:textField name="vNo" value="${vehicleInstance?.vNo}"/>
</div>

