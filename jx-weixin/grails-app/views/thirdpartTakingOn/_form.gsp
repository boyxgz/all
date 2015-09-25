<%@ page import="com.surelution.wxmp.jx.ThirdpartTakingOn" %>



<div class="fieldcontain ${hasErrors(bean: thirdpartTakingOnInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="thirdpartTakingOn.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${thirdpartTakingOnInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: thirdpartTakingOnInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="thirdpartTakingOn.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${thirdpartTakingOnInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: thirdpartTakingOnInstance, field: 'production', 'error')} ">
	<label for="production">
		<g:message code="thirdpartTakingOn.production.label" default="Production" />
		
	</label>
	<g:textField name="production" value="${thirdpartTakingOnInstance?.production}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: thirdpartTakingOnInstance, field: 'remark', 'error')} ">
	<label for="remark">
		<g:message code="thirdpartTakingOn.remark.label" default="Remark" />
		
	</label>
	<g:textField name="remark" value="${thirdpartTakingOnInstance?.remark}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: thirdpartTakingOnInstance, field: 'tel', 'error')} ">
	<label for="tel">
		<g:message code="thirdpartTakingOn.tel.label" default="Tel" />
		
	</label>
	<g:textField name="tel" value="${thirdpartTakingOnInstance?.tel}"/>
</div>

