<%@ page import="com.surelution.wxmp.jx.AwardingStatus" %>



<div class="fieldcontain ${hasErrors(bean: awardingStatusInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="awardingStatus.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${awardingStatusInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: awardingStatusInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="awardingStatus.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${awardingStatusInstance?.title}"/>
</div>

