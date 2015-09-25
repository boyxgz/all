<%@ page import="com.surelution.wxmp.jx.IncomeMessage" %>



<div class="fieldcontain ${hasErrors(bean: incomeMessageInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="incomeMessage.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${incomeMessageInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incomeMessageInstance, field: 'createTime', 'error')} required">
	<label for="createTime">
		<g:message code="incomeMessage.createTime.label" default="Create Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createTime" type="number" value="${incomeMessageInstance.createTime}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: incomeMessageInstance, field: 'fromUserName', 'error')} ">
	<label for="fromUserName">
		<g:message code="incomeMessage.fromUserName.label" default="From User Name" />
		
	</label>
	<g:textField name="fromUserName" value="${incomeMessageInstance?.fromUserName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incomeMessageInstance, field: 'msgId', 'error')} ">
	<label for="msgId">
		<g:message code="incomeMessage.msgId.label" default="Msg Id" />
		
	</label>
	<g:textField name="msgId" value="${incomeMessageInstance?.msgId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incomeMessageInstance, field: 'msgType', 'error')} ">
	<label for="msgType">
		<g:message code="incomeMessage.msgType.label" default="Msg Type" />
		
	</label>
	<g:textField name="msgType" value="${incomeMessageInstance?.msgType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incomeMessageInstance, field: 'toUserName', 'error')} ">
	<label for="toUserName">
		<g:message code="incomeMessage.toUserName.label" default="To User Name" />
		
	</label>
	<g:textField name="toUserName" value="${incomeMessageInstance?.toUserName}"/>
</div>

