
<!DOCTYPE html>
<%@page import="com.surelution.wxmp.jx.ChangshaSubscribingGift"%>
<html>
	<head>
		<meta name="layout" content="main">
		<title>POS</title>
	</head>
	<body>
		<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:form action="index" controller="pos">
			<table>
				<tr>
					<td align="right">兑奖编号：</td>
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
