
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.surelution.wxmp.jx.SubscriberAddress"%>
<%@page import="com.surelution.wxmp.jx.Fall2015DrawPrizeTicket"%>
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.wxmp.jx.Fall2015Voucher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fall2015Voucher.label', default: 'Fall2015Voucher')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<link href="${resource(dir:'css/jquery.datetimepicker.css')}" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${resource(file:'js/jquery-1.9.1.min.js') }"></script>
		<script type="text/javascript" src="${resource(file:'js/jquery.PrintArea.js') }"></script>
		<script type="text/javascript" src="${resource(file:'js/jquery.datetimepicker.js') }"></script>
		<script type="text/javascript">
			function printReport() {
				$("#list-voucher").printArea();
			}

			$( document ).ready(function() {
				$('#dateFrom').datetimepicker({
					dayOfWeekStart : 1,
					lang:'ch',
					format:'Y-m-d H:i'
					});
				$('#dateFrom').datetimepicker({step:10});
			});
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
		<a href="#list-fall2015Voucher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-fall2015Voucher" class="content scaffold-create">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${fall2015VoucherInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${fall2015VoucherInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:form action="addressList" >
				<fieldset class="form">
				
					<div class="fieldcontain ${hasErrors(bean: voucherInstance, field: 'activedAt', 'error')} ">
						<label for="dateFrom">
							<g:message code="voucher.paidAt.dateFrom.label" default="开始时间" />
							
						</label>
						<%
							def df = params.dateFrom
							def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm")
							if(!df) {
								def f = new Date().clearTime()
								f.setDate(f.getDate() - 1)
								f.setHours(16)
								df = sdf.format(f)
							}
							def dt = params.dateTo
							if(!dt) {
								def t = new Date().clearTime()
								t.setHours(16)
								dt = sdf.format(t)
							}
						 %>
						 <g:textField name="dateFrom" value="${df}"/>
					</div>
					<div class="fieldcontain ${hasErrors(bean: voucherInstance, field: 'activedAt', 'error')} ">
						<label for="dateTo">
							<g:message code="voucher.paidAt.dateTo.label" default="结束时间" />
							
						</label>
						<g:textField name="dateTo" value="${dt}"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="search" value="查询" />
				</fieldset>
			</g:form>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="fall2015Voucher.owner.label" default="Owner" /></th>
					
						<th>编号</th>
						
						<th>礼品类型</th>
						
						<th>姓名</th>
						
						<th>电话</th>
						
						<th>地区</th>
						
						<th>地址</th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${vouchers}" status="i" var="fall2015VoucherInstance">
				<g:set var="ui" value="${UserInfo.loadUserInfo(fall2015VoucherInstance.owner.openId) }"/>
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<g:set var="address" value="${SubscriberAddress.findBySubscriber(fall2015VoucherInstance.owner) }"/>
					
						<td>${ui.nickname }</td>
					
						<td>${fieldValue(bean: fall2015VoucherInstance, field: "fullSn")}</td>
					
						<td>${fall2015VoucherInstance.batch.name}</td>
						<td>${address.linkMan }</td>
						<td>${address.tel }</td>
						
						<td>${address.branch.name }</td>
						<td>${address.address }</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
