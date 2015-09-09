
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.surelution.wxmp.jx.DrawPrizeVoucher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'drawPrizeVoucher.label', default: 'DrawPrizeVoucher')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<link href="${resource(dir:'css/jquery.datetimepicker.css')}" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${resource(file:'js/jquery-1.9.1.min.js') }"></script>
		<script type="text/javascript" src="${resource(file:'js/jquery.datetimepicker.js') }"></script>
		<script type="text/javascript">
			$( document ).ready(function() {
				$('#paiedAtFrom').datetimepicker({
					dayOfWeekStart : 1,
					lang:'ch',
					format:'Y-m-d H:i'
					});
				$('#paiedAtFrom').datetimepicker({step:10});
			});
			$( document ).ready(function() {
				$('#paiedAtTo').datetimepicker({
					dayOfWeekStart : 1,
					lang:'ch',
					format:'Y-m-d H:i'
					});
				$('#paiedAtTo').datetimepicker({step:10});
			});
		</script>
	</head>
	<body>
		<a href="#list-drawPrizeVoucher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		
		
		
		<div id="list-drawPrizeVoucher" class="content scaffold-list" role="main">
		<g:form action="list" >
				<fieldset class="form">
					
					
<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'paiedAt', 'error')} ">
	<label for="paiedAt">
		<g:message code="drawPrizeVoucher.paiedAt.label" default="Paied At" />
		
	</label>
	<%
		def df = params.paiedAtFrom
		def dt = params.paiedAtTo
	 %>
	 <g:textField name="paiedAtFrom" value="${df}"/>~<g:textField name="paiedAtTo" value="${dt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'whoPaied', 'error')} ">
	<label for="whoPaied">
		<g:message code="drawPrizeVoucher.whoPaied.label" default="Who Paied" />
		
	</label>
	<g:textField id="whoPaied" name="whoPaied" value="${params.whoPaied}" />
</div>

<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'fullSn', 'error')} ">
	<label for="fullSn">
		<g:message code="drawPrizeVoucher.fullSn.label" default="Full Sn" />
	</label>
	<g:textField name="fullSn" value="${params?.fullSn}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'batch', 'error')} required">
	<label for="batch">
		<g:message code="drawPrizeVoucher.batch.label" default="Batch" />
	</label>
	<g:select id="batch" name="batch.id" from="${com.surelution.wxmp.jx.VoucherBatch.list()}" optionKey="id" optionValue="name" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: drawPrizeVoucherInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="drawPrizeVoucher.status.label" default="Status" />
	</label>
	<g:select name="status" from="${com.surelution.wxmp.jx.Voucher$VoucherStatus?.values()}" keys="${com.surelution.wxmp.jx.Voucher$VoucherStatus.values()*.name()}"  noSelection="['': '']" />
</div>
					
					
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="搜索" />
				</fieldset>
			</g:form>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="drawPrizeVoucher.owner.label" default="Owner" /></th>
					
						<g:sortableColumn property="fullSn" title="${message(code: 'drawPrizeVoucher.fullSn.label', default: 'Full Sn')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'drawPrizeVoucher.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="fullSn" title="${message(code: 'drawPrizeVoucher.ticket.label', default: 'Ticket')}" />
					
						<g:sortableColumn property="fullSn" title="${message(code: 'drawPrizeVoucher.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="paiedAt" title="${message(code: 'drawPrizeVoucher.paiedAt.label', default: 'Paied At')}" />
					
						<th><g:message code="drawPrizeVoucher.whoPaied.label" default="Who Paied" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${drawPrizeVoucherInstanceList}" status="i" var="drawPrizeVoucherInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<%
						def ui = UserInfo.loadUserInfo(drawPrizeVoucherInstance?.owner?.openId)
					 %>
						<td>
						<g:if test="${ui.subscribe }"><img src="${ui.headImgUrl }" width="100" height="100"/>${ui.nickname}</g:if>
						<g:else>用户已取消关注</g:else>
						</td>
					
						<td>${drawPrizeVoucherInstance.fullSn.substring(0, 8)}****</td>
					
						<td>${fieldValue(bean: drawPrizeVoucherInstance, field: "amount")}</td>
					
						<td>${drawPrizeVoucherInstance.ticket.remark}</td>
					
						<td>${fieldValue(bean: drawPrizeVoucherInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: drawPrizeVoucherInstance, field: "paiedAt")}</td>
					
						<td>${drawPrizeVoucherInstance.whoPaied?.username}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${drawPrizeVoucherInstanceTotal}" params="${params }"/>
			</div>
		</div>
	</body>
</html>
