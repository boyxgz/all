<%@ page import="com.surelution.wxmp.jx.TrackableArticle" %>



<div class="fieldcontain ${hasErrors(bean: trackableArticleInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="trackableArticle.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${trackableArticleInstance?.content}"/>
</div>

