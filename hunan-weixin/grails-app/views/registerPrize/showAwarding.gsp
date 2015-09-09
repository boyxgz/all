
<%@ page import="com.surelution.wxmp.jx.RegisterPrize" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>兑奖</title>
	</head>
	<body>
		<a href="#list-registerPrize" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-registerPrize" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<th><g:message code="registerPrize.awardedAt.label" default="Awarded At" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${prizes}" status="i" var="registerPrizeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${formatDate(date:registerPrizeInstance.awardedAt, format:"yyyy-MM-dd HH:mm") }</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
		<div>
			<g:form action="verifyAwarding">
				验证码：<g:textField name="verifyCode" id="verifyCode"/><br>
				<g:submitButton name="btnVerify" value="验证"/>
			</g:form>
		</div>
	</body>
</html>
