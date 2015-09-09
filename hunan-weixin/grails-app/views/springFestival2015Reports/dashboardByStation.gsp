
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.surelution.wxmp.jx.Branch"%>
<%@ page import="com.surelution.wxmp.jx.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
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
		<div id="list-user" class="content scaffold-list" role="main">
			
			<g:form action="dashboardByStation" >
				<fieldset class="form">
					<div class="fieldcontain">
						<label for="role">
							分公司
						</label>
						<g:select name="branchId" from="${Branch.list()}" optionKey="id" optionValue="name" value="${params.branchId }"/>
					</div>
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
				</fieldset>
				
				<fieldset class="buttons">
					<g:submitButton name="dashboardByStation" class="save" value="查询" />
				</fieldset>
			</g:form>
			
			<table>
				<thead>
					<tr>
						<th>单位</th>
						<th>扫码新增关注</th>
						<th>2元</th>
						<th>6元</th>
						<th>66元</th>
						<th>168元</th>
						<th>1688元</th>
						
						
						<th>1999元</th>
						<th>888元</th>
						<th>666元</th>
						<th>66元</th>
						<th>6元</th>
						
						
						<th>1999元</th>
						<th>666元</th>
						<th>200元</th>
						<th>66元</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vos}" status="i" var="vo">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${vo[0].name }</td>
						<td>${vo[1].scanSubscribing?vo[1].scanSubscribing:0 }</td>
						<td>${vo[1].payment2 }</td>
						<td>${vo[1].payment6 }</td>
						<td>${vo[1].payment66 }</td>
						<td>${vo[1].payment168 }</td>
						<td>${vo[1].payment1688 }</td>
						
						
						<td>${vo[1].paymento1999 }</td>
						<td>${vo[1].paymento888 }</td>
						<td>${vo[1].paymento666 }</td>
						<td>${vo[1].paymento66 }</td>
						<td>${vo[1].paymento6 }</td>
						
						
						<td>${vo[1].paymentTop1999 }</td>
						<td>${vo[1].paymentTop666 }</td>
						<td>${vo[1].paymentTop200 }</td>
						<td>${vo[1].paymentTop66 }</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
