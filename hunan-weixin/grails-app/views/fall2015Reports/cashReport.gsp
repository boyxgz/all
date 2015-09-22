<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>充值金额报表</title>
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
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-fall2015Voucher" class="content scaffold-create">
			<h1>充值金额报表</h1>
			<g:form action="cashReport" >
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
								f.setHours(0)
								df = sdf.format(f)
							}
							def dt = params.dateTo
							if(!dt) {
								def t = new Date().clearTime()
								t.setHours(0)
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
					<g:submitButton name="create" class="search" value="查询" />
				</fieldset>
			</g:form>
			
			<table>
			   <thead>
			   
					<tr>
						<th>参与人数</th>
						
						<th>中奖人数</th>
						
						<th>充值总金额(元)</th>
						
						<th>中奖人充值总金额(元)</th>
						
					</tr>
				</thead>
			  <tbody>
			      <g:if test="${count }">
			        <tr>
			          <td>${count }</td>
			          <td>${luckyPerson }</td>
			          <td>${amount}</td>
			          <td>${allMount }</td>
			        </tr>
			        </g:if>
			  </tbody>
			</table>
			
		</div>
	</body>
</html>