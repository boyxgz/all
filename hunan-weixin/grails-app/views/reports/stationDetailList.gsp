
<%@page import="com.surelution.wxmp.jx.ChangshaSubscribingGift.GiftChannel"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reports.label', default: 'Voucher')}" />
		<title>加油站兑奖明细表</title>
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
			<g:form action="stationDetailList" >
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
					<input type="button" class="print" value="打印" onclick="printReport()">
				</fieldset>
			</g:form>
		</div>
		<div id="list-voucher">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<th>加油站</th>
						<th>兑奖日期</th>
						<th>红包编码</th>
						<th>金额</th>
						<th>兑奖方式</th>
						<th>兑奖金额</th>
						<th>消费金额</th>
					</tr>
				</thead>
				<tbody>
				<g:if test="${payments}">
					<g:each in="${payments}" status="i" var="payment">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td>${payment.paiedBy.username}</td>
							
							<td><g:formatDate date="${payment.dateCreated}" format="yyyy-MM-dd HH:mm"/></td>
						
							<td>${payment.voucher.fullSn}</td>
						
							<td>${payment.voucher.amount}</td>
						
							<td>${payment.channel.name}</td>
						
							<td>${payment.amountByVoucher}</td>
						
							<td>${payment.totalAmount}</td>
						
						</tr>
					</g:each>
					<tr class="even">
						<td>总金额：</td>
						<td colspan="5"><font color="blue"><g:formatNumber number="${payments.sum(){it.amountByVoucher} }" format="#,###.##"/></font></td>
					</tr>
				</g:if>
				</tbody>
			</table>
		</div>
	</body>
</html>
