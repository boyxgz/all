<%@ page import="com.surelution.wxmp.jx.Token" %>



<div class="fieldcontain ${hasErrors(bean: tokenInstance, field: 'sn', 'error')} ">
	<label for="sn">
		<g:message code="token.sn.label" default="Sn" />
		
	</label>
	<g:textField name="sn" value="${tokenInstance?.sn}"/>
</div>

