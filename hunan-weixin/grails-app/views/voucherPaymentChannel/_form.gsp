<%@ page import="com.surelution.wxmp.jx.VoucherPaymentChannel" %>



<div class="fieldcontain ${hasErrors(bean: voucherPaymentChannelInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="voucherPaymentChannel.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${voucherPaymentChannelInstance?.name}"/>
</div>

