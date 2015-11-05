<%@ page import="com.surelution.zjolap.Branch" %>



<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="branch.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${branchInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branchGroup', 'error')} ">
	<label for="branchGroup">
		<g:message code="branch.branchGroup.label" default="Branch Group" />
		
	</label>
	<g:select id="branchGroup" name="branchGroup.id" from="${com.surelution.zjolap.BranchGroup.list()}" optionKey="id" optionValue="name" value="${branchInstance?.branchGroup?.id}" class="many-to-one" />
</div>

