<%@ page import="com.surelution.wxmp.jx.ReadingTracking" %>



<div class="fieldcontain ${hasErrors(bean: readingTrackingInstance, field: 'article', 'error')} required">
	<label for="article">
		<g:message code="readingTracking.article.label" default="Article" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="article" name="article.id" from="${com.surelution.wxmp.jx.TrackableArticle.list()}" optionKey="id" required="" value="${readingTrackingInstance?.article?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: readingTrackingInstance, field: 'readAt', 'error')} required">
	<label for="readAt">
		<g:message code="readingTracking.readAt.label" default="Read At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="readAt" precision="day"  value="${readingTrackingInstance?.readAt}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: readingTrackingInstance, field: 'readerOpenId', 'error')} ">
	<label for="readerOpenId">
		<g:message code="readingTracking.readerOpenId.label" default="Reader Open Id" />
		
	</label>
	<g:textField name="readerOpenId" value="${readingTrackingInstance?.readerOpenId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: readingTrackingInstance, field: 'sharerOpenId', 'error')} ">
	<label for="sharerOpenId">
		<g:message code="readingTracking.sharerOpenId.label" default="Sharer Open Id" />
		
	</label>
	<g:textField name="sharerOpenId" value="${readingTrackingInstance?.sharerOpenId}"/>
</div>

