<%@ page import="com.surelution.wxmp.jx.SubscriberCommentReplyUser" %>



<div class="fieldcontain ${hasErrors(bean: subscriberCommentReplyUserInstance, field: 'branch', 'error')}">
	<label for="branch">
		<g:message code="subscriberCommentReplyUser.branch.label" default="Branch" />
	</label>
	<g:select id="branch" name="branch.id" from="${com.surelution.wxmp.jx.Branch.list()}" optionKey="id" noSelection="['':'']" required="" value="${subscriberCommentReplyUserInstance?.branch?.id}" optionValue="name" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subscriberCommentReplyUserInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="subscriberCommentReplyUser.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.surelution.wxmp.jx.User.list()}" optionKey="id" required="" value="${subscriberCommentReplyUserInstance?.user?.id}" optionValue="username" class="many-to-one"/>
</div>

