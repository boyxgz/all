<%@ page import="com.surelution.wxmp.jx.DynArticle" %>



<div class="fieldcontain ${hasErrors(bean: dynArticleInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="dynArticle.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${dynArticleInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dynArticleInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="dynArticle.content.label" default="Content" />
		
	</label>
	
	<ckeditor:editor name="content" height="400px" width="80%">
		${dynArticleInstance?.content}
	</ckeditor:editor>
</div>

