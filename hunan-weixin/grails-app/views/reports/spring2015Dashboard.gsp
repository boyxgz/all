
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
			<g:form action="spring2015Dashboard" >
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
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.search.label', default: '查询')}" />
				</fieldset>
			</g:form>
		</div>
		<br/>
		<div id="list-voucher">
			邀请关注人数：${inviting }<br/>
			参与抽奖人数：${drawPrizeCount }<br/>
			<table>
			     <thead>
					<tr>
						 <th>奖项</th>
						 <th>金额</th>
						 <th>中奖人数</th>
						 <th>兑奖人数</th>
					</tr>
				</thead>
				<g:each in="${prizeInfo}" var="pi">
					<tr>
						<td>${pi[2].name }</td>
						<td><g:formatNumber number="${pi[2].amount }"/></td>
						<td>${pi[0] }</td>
						<td>${pi[1] }</td>
					</tr>
				</g:each>
				
			</table>
			
		</div>
	</body>
</html>
