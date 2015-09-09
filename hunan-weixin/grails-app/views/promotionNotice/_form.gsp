<%@ page import="com.surelution.wxmp.jx.PromotionNotice" %>



<div class="fieldcontain ${hasErrors(bean: promotionNoticeInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="promotionNotice.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch" name="branch.id" from="${com.surelution.wxmp.jx.Branch.list()}" optionKey="id" optionValue="name" required="" value="${promotionNoticeInstance?.branch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: promotionNoticeInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="promotionNotice.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${promotionNoticeInstance?.content}"/>
</div>

