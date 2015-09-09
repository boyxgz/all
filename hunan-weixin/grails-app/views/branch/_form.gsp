<%@ page import="com.surelution.wxmp.jx.Branch" %>



<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="branch.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${branchInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="branch.address.label" default="Address" />
		
	</label>
	<g:textArea name="address" value="${branchInstance?.address}"/>
</div>

