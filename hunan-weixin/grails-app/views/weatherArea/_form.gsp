<%@ page import="com.surelution.wxmp.jx.WeatherArea" %>



<div class="fieldcontain ${hasErrors(bean: weatherAreaInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="weatherArea.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch" name="branch.id" from="${com.surelution.wxmp.jx.Branch.list()}" optionKey="id" optionValue="name" required="" value="${weatherAreaInstance?.branch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: weatherAreaInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="weatherArea.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${weatherAreaInstance?.code}"/>
</div>

