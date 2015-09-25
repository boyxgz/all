
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<%@ page import="com.surelution.wxmp.jx.PrizeAwarding" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'prizeAwarding.label', default: 'PrizeAwarding')}" />
		<title>中国石油嘉兴公司</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link href="${resource(dir:'css/bootstrap.min.css')}" rel="stylesheet" media="screen">
		<script type="text/javascript" src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
	</head>
	<body>
		<br>
		<font size="+2"><b>嘉兴车展</b></font><br><br>
		${KeyedMessage.findByKey("CarExhibitionMessage1").message }<br/>
		<img alt="展位" src="${resource(dir:'app-images/')}carExhibition1.jpg"><br/>
		${KeyedMessage.findByKey("CarExhibitionMessage2").message }<br/>
		<img alt="优惠" src="${resource(dir:'app-images/')}carExhibition2.jpg">
	</body>
</html>
