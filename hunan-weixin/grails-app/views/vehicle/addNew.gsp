
<%@ page import="com.surelution.wxmp.jx.VehicleType" %>
<!DOCTYPE html>
<html>
	<head>
		<title>中国石油嘉兴公司</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link href="${resource(dir:'css/bootstrap.min.css')}" rel="stylesheet" media="screen">
		<script type="text/javascript" src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
	</head>
	<body>
		<br>
		<font size="+2"><b>设置车辆信息</b></font><br><br>
		<form action="addNew">
			车辆类型：<g:select name="type" from="${VehicleType.list() }" optionKey="id" optionValue="title"/><br>
			号牌号码：<g:textField name="vNo"/><br>
			车辆识别代号：<g:textField name="vId"/><br>
			发动机号：<g:textField name="engineId"/><br>
			<g:hiddenField name="subscriber.id" value="${params.sid }"/>
			<g:submitButton name="submit" value="设置"/>
		</form>
	</body>
</html>
