<%@ page import="com.surelution.zjolap.BranchGroup" %>



<div class="fieldcontain ${hasErrors(bean: branchGroupInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="branchGroup.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${branchGroupInstance?.name}"/>
</div>

