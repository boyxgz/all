<%@ page import="com.surelution.wxmp.jx.WheelPrize" %>



<div class="fieldcontain ${hasErrors(bean: wheelPrizeInstance, field: 'seq', 'error')} required">
	<label for="seq">
		<g:message code="wheelPrize.seq.label" default="Seq" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="seq" type="number" value="${wheelPrizeInstance.seq}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: wheelPrizeInstance, field: 'prize', 'error')} required">
	<label for="prize">
		<g:message code="wheelPrize.prize.label" default="Prize" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prize" name="prize.id" from="${com.surelution.wxmp.jx.Prize.list()}" optionKey="id" optionValue="name" noSelection="['':'']" value="${wheelPrizeInstance?.prize?.id}" class="many-to-one"/>
</div>

