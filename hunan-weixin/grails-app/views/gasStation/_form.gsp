<%@ page import="com.surelution.wxmp.jx.GasStation" %>



<div class="fieldcontain ${hasErrors(bean: gasStationInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="gasStation.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${gasStationInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: gasStationInstance, field: 'district', 'error')} required">
	<label for="district">
		<g:message code="gasStation.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="district" name="district.id" from="${com.surelution.wxmp.jx.District.list()}" optionKey="id" optionValue="name" required="" value="${gasStationInstance?.district?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gasStationInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="gasStation.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${gasStationInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gasStationInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="gasStation.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${gasStationInstance?.address}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: gasStationInstance, field: 'linkMan', 'error')} ">
	<label for="linkMan">
		<g:message code="gasStation.linkMan.label" default="Link Man" />
		
	</label>
	<g:textField name="linkMan" value="${gasStationInstance?.linkMan}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gasStationInstance, field: 'tel', 'error')} ">
	<label for="tel">
		<g:message code="gasStation.tel.label" default="Tel" />
		
	</label>
	<g:textField name="tel" value="${gasStationInstance?.tel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gasStationInstance, field: 'latitude', 'error')} required">
	<label for="latitude">
		<g:message code="gasStation.latitude.label" default="Latitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="latitude" value="${gasStationInstance.latitude}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: gasStationInstance, field: 'longitude', 'error')} required">
	<label for="longitude">
		<g:message code="gasStation.longitude.label" default="Longitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="longitude" value="${gasStationInstance.longitude}" required=""/>
</div>

