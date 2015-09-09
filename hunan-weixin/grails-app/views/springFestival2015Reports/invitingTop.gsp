
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@page import="com.surelution.wxmp.jx.ChangshaSubscribingGift.GiftChannel"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reports.label', default: 'Voucher')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<link href="${resource(dir:'css/jquery.datetimepicker.css')}" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${resource(file:'js/jquery-1.9.1.min.js') }"></script>
		<script type="text/javascript" src="${resource(file:'js/jquery.datetimepicker.js') }"></script>
		<script type="text/javascript">
			$( document ).ready(function() {
				$('#dateTo').datetimepicker({
					dayOfWeekStart : 1,
					lang:'ch',
					format:'Y-m-d H:i'
					});
				$('#dateTo').datetimepicker({step:10});
			});
		</script>
	</head>
	<body>
		<a href="#list-voucher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-voucher">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${voucherInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${voucherInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="invitingTop" >
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: voucherInstance, field: 'activedAt', 'error')} ">
						<label for="dateFrom">
							结束时间
						</label>
						<%
							def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm")
							def dt = params.dateTo
							if(!dt) {
								def t = new Date().clearTime()
								t.setHours(16)
								dt = sdf.format(t)
							}
						 %>
						 <g:textField name="dateTo" value="${dt}"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.search.label', default: '查询')}" />
				</fieldset>
			</g:form>
		</div>
		<br/>
		<div id="list-voucher">
			<table>
			     <thead>
					<tr>
						 <th>排名</th>
						 <th>客户ID</th>
						 <th>客户</th>
						 <th>推荐人数</th>
					</tr>
				</thead>
				<g:each in="${topList}" var="tl" status="index">
					<tr>
					<g:set var="subscriber" value="${tl[0] }"/>
					<g:set var="userInfo" value="${UserInfo.loadUserInfo(subscriber.openId) }"/>
						<td>${index + 1 }</td>
						<td>${subscriber.id }</td>
						<td><img alt="" src="${userInfo.headImgUrl }" width="100" height="100"><br/>${userInfo.nickname }</td>
						<td>${tl[1] }</td>
					</tr>
				</g:each>
				
			</table>
			
		</div>
	</body>
</html>
