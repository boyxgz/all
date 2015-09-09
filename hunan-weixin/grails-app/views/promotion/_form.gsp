<%@ page import="com.surelution.wxmp.jx.Promotion" %>



<div class="fieldcontain ${hasErrors(bean: promotionInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="promotion.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${promotionInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: promotionInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="promotion.content.label" default="Content" />
		
	</label>
	<richui:richTextEditor name="content" value="${promotionInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: promotionInstance, field: 'main', 'error')} ">
	<label for="main">
		<g:message code="promotion.main.label" default="Main" />
		
	</label>
	<g:checkBox name="main" value="${promotionInstance?.main}" />
</div>

<div class="fieldcontain ${hasErrors(bean: promotionInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="promotion.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${promotionInstance?.title}"/>
</div>

