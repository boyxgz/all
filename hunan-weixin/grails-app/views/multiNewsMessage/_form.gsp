<%@ page import="com.surelution.wxmp.jx.MultiNewsMessage" %>



<div class="fieldcontain ${hasErrors(bean: multiNewsMessageInstance, field: 'inputMessage', 'error')} ">
	<label for="inputMessage">
		<g:message code="multiNewsMessage.inputMessage.label" default="Input Message" />
		
	</label>
	<g:textField name="inputMessage" value="${multiNewsMessageInstance?.inputMessage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: multiNewsMessageInstance, field: 'menuKey', 'error')} ">
	<label for="menuKey">
		<g:message code="multiNewsMessage.menuKey.label" default="Menu Key" />
		
	</label>
	<g:textField name="menuKey" value="${multiNewsMessageInstance?.menuKey}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: multiNewsMessageInstance, field: 'keepHistory', 'error')} ">
	<label for="keepHistory">
		<g:message code="multiNewsMessage.keepHistory.label" default="keepHistory" />
		
	</label>
	<g:checkBox name="keepHistory" value="${multiNewsMessageInstance?.keepHistory}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: multiNewsMessageInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="multiNewsMessage.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" value="${multiNewsMessageInstance?.description}"/>
</div>

