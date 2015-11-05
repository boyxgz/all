<%@page import="com.surelution.zjolap.Branch"%>
<%@ page import="com.surelution.zjolap.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userBranch, field: 'branch', 'error')} ">
	<label for="branchId">
		<g:message code="userBranch.branch.label" default="Branch" />
		
	</label>
	<g:select id="branchId" name="branch.id" from="${Branch.list() }" optionKey="id" optionValue="name" value="${userInstance?.branch?.id }"/>
</div>

