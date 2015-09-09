<%@ page import="com.surelution.wxmp.jx.SubscriberCommentAssignment" %>



<div class="fieldcontain ${hasErrors(bean: subscriberCommentAssignmentInstance, field: 'closed', 'error')} ">
	<label for="closed">
		<g:message code="subscriberCommentAssignment.closed.label" default="Closed" />
		
	</label>
	<g:checkBox name="closed" value="${subscriberCommentAssignmentInstance?.closed}" />
</div>

<div class="fieldcontain ${hasErrors(bean: subscriberCommentAssignmentInstance, field: 'comment', 'error')} required">
	<label for="comment">
		<g:message code="subscriberCommentAssignment.comment.label" default="Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="comment" name="comment.id" from="${com.surelution.wxmp.jx.SubscriberComment.list()}" optionKey="id" required="" value="${subscriberCommentAssignmentInstance?.comment?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subscriberCommentAssignmentInstance, field: 'tips', 'error')} ">
	<label for="tips">
		<g:message code="subscriberCommentAssignment.tips.label" default="Tips" />
		
	</label>
	<g:textField name="tips" value="${subscriberCommentAssignmentInstance?.tips}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subscriberCommentAssignmentInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="subscriberCommentAssignment.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.surelution.wxmp.jx.User.list()}" optionKey="id" required="" value="${subscriberCommentAssignmentInstance?.user?.id}" class="many-to-one"/>
</div>

