<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.surelution.whistle.core.Auth2Util.AuthScope"%>
<%@page import="grails.util.Holders"%>
<%@page import="com.surelution.whistle.core.Auth2Util"%>
<%@page import="com.surelution.wxmp.jx.LateSpring2015ReceiptFuelCharging"%>
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width"/>
<title>中国石油湖南销售分公司</title>
<link href="${resource(dir:'css/spring-festival-2015.css')}" rel="stylesheet" type="text/css" />
<wx:registerJsapi apiList="'hideMenuItems'" queryString="consumingPrize/choseTicket${request.queryString }"/>
<script type="text/javascript">
	wx.ready(function () {
		wx.hideOptionMenu();
	})
</script>
</head>
<body>

<div class="content">
<h2>${KeyedMessage.findByKey("LATE-SPRING-2015-EVENT-SAVE-ERROR")?.message }</h2>
<g:if test="${flash.message }">
${flash.message }
</g:if>
<br/>
<p>
	<img style="float:center;" src="${resource(dir:'images/question.gif')}" height="200" width="200" /> 
</p>
<br/>
<p>
<a href="${Auth2Util.buildRedirectUrl("http://${Holders.config.app.web.path}/lateSpring2015/index", null, AuthScope.BASE)}"><span class="button  blue">返回</span></a>	
</p>
</div>

</body>
</html>
