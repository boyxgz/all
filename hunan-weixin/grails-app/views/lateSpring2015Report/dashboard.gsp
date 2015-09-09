
<%@ page import="com.surelution.wxmp.jx.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title>清明5.1活动情况</title>
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-user" class="content scaffold-list" style="overflow: auto;" role="main">
			<h1>清明5.1活动情况</h1>
			
			<table>
				<thead>
					<tr valign="middle">
						<th rowspan="2">日期</th>
						<th rowspan="2">扫码新增关注</th>
						<th rowspan="2">票据数</th>
						<th rowspan="2">生成抽奖码数目</th>
						<th rowspan="2">抽奖次数</th>
						<g:set value="${com.surelution.wxmp.jx.VoucherBatch.findAllByEventName('2015-late-spring') }" var="vbs"></g:set>
						<g:each in="${vbs }" var="vb">
						<th colspan="2">${vb.name }</th>
						</g:each>
					</tr>
					<tr>
						<g:each in="${vbs }" var="vb">
							<th>中奖</th>
							<th>兑奖</th>
						</g:each>
					</tr>
				</thead>
				<tbody>
				<g:each in="${entries}" status="i" var="entry">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:formatDate date="${entry.key }" format="yyyy-MM-dd"/></td>
						<g:set var="vo" value="${entry.value }"></g:set>
						<td>${vo.scanSubscribing }</td>
						<td>${vo.receiptCount }</td>
						<td>${vo.ticketCount }</td>
						<td>${vo.drawCount }</td>
						<g:each in="${vbs }" var="vb">
						<td>${vo.getVoucherByBatch(vb) }</td>
						<td>${vo.getPaymentByBatch(vb) }</td>
						</g:each>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
