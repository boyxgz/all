<%@ page import="com.surelution.wxmp.jx.WeatherItem" %>



<div class="fieldcontain ${hasErrors(bean: weatherItemInstance, field: 'weather', 'error')} required">
	<label for="weather">
		<g:message code="weatherItem.weather.label" default="Weather" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="weather" name="weather.id" from="${com.surelution.wxmp.jx.Weather.list()}" optionKey="id" required="" value="${weatherItemInstance?.weather?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: weatherItemInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="weatherItem.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch" name="branch.id" from="${com.surelution.wxmp.jx.Branch.list()}" optionKey="id" required="" value="${weatherItemInstance?.branch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: weatherItemInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="weatherItem.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${weatherItemInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: weatherItemInstance, field: 'img1', 'error')} ">
	<label for="img1">
		<g:message code="weatherItem.img1.label" default="Img1" />
		
	</label>
	<g:textField name="img1" value="${weatherItemInstance?.img1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: weatherItemInstance, field: 'img2', 'error')} ">
	<label for="img2">
		<g:message code="weatherItem.img2.label" default="Img2" />
		
	</label>
	<g:textField name="img2" value="${weatherItemInstance?.img2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: weatherItemInstance, field: 'temp1', 'error')} ">
	<label for="temp1">
		<g:message code="weatherItem.temp1.label" default="Temp1" />
		
	</label>
	<g:textField name="temp1" value="${weatherItemInstance?.temp1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: weatherItemInstance, field: 'temp2', 'error')} ">
	<label for="temp2">
		<g:message code="weatherItem.temp2.label" default="Temp2" />
		
	</label>
	<g:textField name="temp2" value="${weatherItemInstance?.temp2}"/>
</div>

