<%@ page import="com.surelution.wxmp.jx.Wiki" %>



<div class="fieldcontain ${hasErrors(bean: wikiInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="wiki.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${wikiInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: wikiInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="wiki.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${wikiInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wikiInstance, field: 'createAt', 'error')} required">
	<label for="createAt">
		<g:message code="wiki.createAt.label" default="Create At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createAt" precision="day"  value="${wikiInstance?.createAt}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: wikiInstance, field: 'index', 'error')} required">
	<label for="index">
		<g:message code="wiki.index.label" default="Index" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="index" type="number" value="${wikiInstance.index}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: wikiInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="wiki.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${wikiInstance?.title}"/>
</div>

