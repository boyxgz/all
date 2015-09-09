<%@ page import="com.surelution.wxmp.jx.MultiNewsMessageItem" %>
<%@ page import="com.surelution.wxmp.jx.Branch" %>
<%@ page import="com.surelution.wxmp.jx.MultiNewsMessageItemBranch" %>

<script type="text/javascript" charset="utf-8">
	function ckeditorFileBrowserItemSelected(path) {
		//${request.remoteHost}
		document.getElementById("pictureUrl").value='http://${request.remoteHost}' + path;
		//alert(path);
	}
</script>

<div class="fieldcontain ${hasErrors(bean: multiNewsMessageItemInstance, field: 'firstNews', 'error')} ">
	<label for="firstNews">
		<g:message code="multiNewsMessageItem.firstNews.label" default="First News" />
		
	</label>
	<g:checkBox name="firstNews" value="${multiNewsMessageItemInstance?.firstNews}" />
</div>

<div class="fieldcontain ${hasErrors(bean: multiNewsMessageItemInstance, field: 'message', 'error')} required">
	<label for="message">
		<g:message code="multiNewsMessageItem.message.label" default="Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="message" name="message.id" from="${com.surelution.wxmp.jx.MultiNewsMessage.list()}" optionKey="id" optionValue="menuKey" required="" value="${multiNewsMessageItemInstance?.message?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: multiNewsMessageItemInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="multiNewsMessageItem.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${multiNewsMessageItemInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: multiNewsMessageItemInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="multiNewsMessageItem.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" value="${multiNewsMessageItemInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: multiNewsMessageItemInstance, field: 'pictureUrl', 'error')} ">
	<label for="pictureUrl">
		<g:message code="multiNewsMessageItem.pictureUrl.label" default="Picture Url" />
		
	</label>
	<g:textField name="pictureUrl" value="${multiNewsMessageItemInstance?.pictureUrl}"/>
	<ckeditor:fileBrowser fileBrowser="ofm" target="_blank" userSpace='userone'>选择文件</ckeditor:fileBrowser>
</div>

<div class="fieldcontain ${hasErrors(bean: multiNewsMessageItemInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="multiNewsMessageItem.url.label" default="Url" />
		
	</label>
	<g:textField name="url" value="${multiNewsMessageItemInstance?.url}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: multiNewsMessageItemInstance, field: 'globalMessage', 'error')} ">
	<label for="url">
		<g:message code="multiNewsMessageItem.globalMessage.label" default="Global Message" />
		
	</label>
	<g:checkBox name="globalMessage" value="${multiNewsMessageItemInstance?.globalMessage}"/>
</div>







<div class="fieldcontain ${hasErrors(bean: multiNewsMessageItemInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="multiNewsMessageItem.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${multiNewsMessageItemInstance?.active}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: multiNewsMessageItemInstance, field: 'createdAt', 'error')} ">
	<label for="createdAt">
		<g:message code="multiNewsMessageItem.createdAt.label" default="createdAt" />
		
	</label>
	<g:textField name="createdAt" value="${multiNewsMessageItemInstance?.createdAt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: multiNewsMessageItemInstance, field: 'expiredAt', 'error')} ">
	<label for="expiredAt">
		<g:message code="multiNewsMessageItem.expiredAt.label" default="expiredAt" />
		
	</label>
	<g:textField name="expiredAt" value="${multiNewsMessageItemInstance?.expiredAt}"/>
</div>









<div class="fieldcontain">
	<label for="url">
		<g:message code="branch.name.label" default="Branch" />
		
	</label><br/>
	<g:if test="${multiNewsMessageItemInstance.id}">
		<g:set var="selectedBranchIds" value="${MultiNewsMessageItemBranch.findAllByItem(multiNewsMessageItemInstance).collect{it.branch.id}}"/>
	</g:if>
	<g:else>
		<g:set var="selectedBranchIds" value="${null }"/>
	</g:else>
	<g:each in="${Branch.list() }" var="branch">
		<label for="itemBranch-${branch.id }">
		${branch.name }
	</label>
	<g:checkBox id="itemBranch-${branch.id }" name="itemBranch" value="${branch.id }" checked="${selectedBranchIds?.contains(branch.id)}"/>
	</g:each>
</div>

