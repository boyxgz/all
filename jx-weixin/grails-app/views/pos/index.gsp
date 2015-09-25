
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.wxmp.jx.Prize" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>POS</title>
		<script type="text/javascript" src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
	</head>
	<body>
		<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:form action="index" controller="pos">
			<table>
				<tr>
					<td align="right">验证码：</td>
					<td><g:textField name="sn"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<g:submitButton name="create" class="save" value="查询" />
					</td>
				</tr>
			</table>
		</g:form>
	
	</body>
</html>
