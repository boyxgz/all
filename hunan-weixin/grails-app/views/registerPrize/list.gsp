
<%@ page import="com.surelution.wxmp.jx.RegisterPrize" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registerPrize.list.label', default: 'RegisterPrize')}" />
		<title><g:message code="registerPrize.list.label" /></title>
		<g:javascript library="jquery"/>
		<g:javascript library="jquery-ui"/>
		<jqui:resources theme="darkness" />
		<script type="text/javascript">
		$(document).ready(function () {
        	$.datepicker.regional[ "zh_CN" ] = { closeText: "关闭", prevText: "&#x3c;上月", nextText: "下月&#x3e;", currentText: "今天", monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"], monthNamesShort: ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"], dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"], dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"], dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"], weekHeader: "周", dateFormat: "yy-mm-dd", firstDay: 1, isRTL: !1, showMonthAfterYear: !0, yearSuffix: "年" }
	        $.datepicker.setDefaults( $.datepicker.regional[ "zh_CN" ] );
			$( "#awardedAtFrom" ).datepicker({dateFormat: 'yy-mm-dd'});
			$( "#awardedAtTo" ).datepicker({dateFormat: 'yy-mm-dd'});
		});
		</script>
	</head>
	<body>
		<a href="#list-registerPrize" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-registerPrize">
			<h1><g:message code="registerPrize.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${registerPrizeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${registerPrizeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="list" >
				<fieldset class="form">
				
				<div class="fieldcontain">
					<label for="awardedAtFrom">
						<g:message code="registerPrize.awardedAtFrom.label" default="兑奖时间" />
						
					</label>
					<g:textField name="awardedAtFrom" value="${params.awardedAtFrom }"/>
					--
					<g:textField name="awardedAtTo" value="${params.awardedAtTo }"/>
				</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="search" value="查询" />
				</fieldset>
			</g:form>
		</div>
		<div id="list-registerPrize">
			<h1><g:message code="registerPrize.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="registerPrize.awardedBy.label" default="兑奖人" /></th>
					
						<g:sortableColumn property="awardedAt" title="${message(code: 'registerPrize.awardedAt.label', default: 'Awarded At')}" />
					
						<th><g:message code="registerPrize.gasStation.label" default="兑奖站" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${registerPrizeInstanceList}" status="i" var="registerPrizeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${registerPrizeInstance.id}">${registerPrizeInstance.awardedBy?.username}</g:link></td>
					
						<td><g:formatDate date="${registerPrizeInstance.awardedAt}" format="yyyy-MM-dd HH:mm"/></td>
					
						<!-- ${registerPrizeInstance.subscriber.openId} -->
					
						<td>${registerPrizeInstance.gasStation?.district?.branch?.shortName}&gt;&gt;${registerPrizeInstance.gasStation?.district?.name}&gt;&gt;${registerPrizeInstance.gasStation?.shortName}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${registerPrizeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
