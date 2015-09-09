
<%@ page import="com.surelution.wxmp.jx.GasStation" %>
<!DOCTYPE html>
<html>
	<head>
		<title>油站信息</title>
	</head>
	<body>
	${gasStation.name }<br/>
	<img src="${resource(dir:'dynImage/station/')}${gasStation.id }"/>
	</body>
</html>
