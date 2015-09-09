<%@ page import="com.surelution.wxmp.jx.District" %>



<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="district.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch" name="branch.id" from="${com.surelution.wxmp.jx.Branch.list()}" optionKey="id" optionValue="name" required="" value="${districtInstance?.branch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="district.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${districtInstance?.name}"/>
</div>

