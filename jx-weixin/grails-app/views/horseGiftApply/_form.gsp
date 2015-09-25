<%@ page import="com.surelution.wxmp.jx.HorseGiftApply" %>



<div class="fieldcontain ${hasErrors(bean: horseGiftApplyInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="horseGiftApply.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.surelution.wxmp.jx.HorseGiftApply$ApplyStatus?.values()}" keys="${com.surelution.wxmp.jx.HorseGiftApply$ApplyStatus.values()*.name()}" required="" value="${horseGiftApplyInstance?.status?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: horseGiftApplyInstance, field: 'subscriber', 'error')} required">
	<label for="subscriber">
		<g:message code="horseGiftApply.subscriber.label" default="Subscriber" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subscriber" name="subscriber.id" from="${com.surelution.wxmp.jx.Subscriber.list()}" optionKey="id" required="" value="${horseGiftApplyInstance?.subscriber?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: horseGiftApplyInstance, field: 'uploading', 'error')} required">
	<label for="uploading">
		<g:message code="horseGiftApply.uploading.label" default="Uploading" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="uploading" name="uploading.id" from="${com.surelution.wxmp.jx.PictureUploading.list()}" optionKey="id" required="" value="${horseGiftApplyInstance?.uploading?.id}" class="many-to-one"/>
</div>

