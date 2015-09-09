
<%@page import="org.apache.jasper.compiler.Node.ParamAction"%>
<%@page import="com.surelution.wxmp.jx.Branch"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.surelution.wxmp.jx.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title>清明5.1活动情况</title>
		<link href="${resource(dir:'css/jquery.datetimepicker.css')}" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${resource(file:'js/jquery.datetimepicker.js') }"></script>
		<script type="text/javascript">
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
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-voucher">
			<h1>清明5.1活动情况</h1>
			<g:form action="dashboardByStation" >
				<fieldset class="form">
					<div class="fieldcontain">
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
					<div class="fieldcontain">
						<label for="dateTo">
							<g:message code="voucher.paidAt.dateTo.label" default="结束时间" />
							
						</label>
						<g:textField name="dateTo" value="${dt}"/>
					</div>
					<div class="fieldcontain">
						<label for=branchId>
							分公司
						</label>
						<g:select name="branchId" from="${Branch.list()}" optionKey="id" optionValue="name" value="${params.branchId }"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.search.label', default: '查询')}" />
				</fieldset>
			</g:form>
		</div>
		<div id="list-user" class="content scaffold-list" style="overflow: auto;" role="main">
			
			<table>
				<thead>
					<tr>
						<th rowspan="2">日期</th>
						<th rowspan="2">扫码新增关注</th>
						<g:set value="${com.surelution.wxmp.jx.VoucherBatch.findAllByEventName('2015-late-spring') }" var="vbs"></g:set>
						<th colspan="${vbs.size() }">兑奖</th>
					</tr>
					<tr>
						<g:each in="${vbs }" var="vb">
							<th>${vb.name }</th>
						</g:each>
					</tr>
				</thead>
				<tbody>
				<g:each in="${entries}" status="i" var="entry">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${entry.key.name }</td>
						<g:set var="vo" value="${entry.value }"></g:set>
						<td>${vo.scanSubscribing }</td>
						<g:each in="${vbs }" var="vb">
						<td>${vo.getPaymentByBatch(vb) }</td>
						</g:each>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
