<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.surelution.wxmp.jx.LateSpring2015ChargingDrawPrizeTicket"%>
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<%@page import="grails.util.Holders"%>
<%@page import="com.surelution.whistle.core.Auth2Util.AuthScope"%>
<%@page import="com.surelution.whistle.core.Auth2Util"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width"/>
<title>中国石油湖南销售分公司</title>
<link href="${resource(dir:'css/spring-festival-2015.css')}" rel="stylesheet" type="text/css" />
<wx:registerJsapi queryString="lateSpring2015/showTicket?${request.queryString }" apiList="'onMenuShareAppMessage','onMenuShareTimeline'"/>
<script type="text/javascript">
var title = '${KeyedMessage.findByKey('late-spring-2015-share-title').message}';
var link = '${KeyedMessage.findByKey('article-url-late-spring-2015').message}';
var imgUrl = 'http://${Holders.config.app.web.path}/images/hongbao-icon.jpg';
wx.ready(function () {
	wx.onMenuShareTimeline({
	    title: title,
	    link: link,
	    imgUrl: imgUrl,
	    success: function () { 
	    },
	    cancel: function () {
	    }
	});

	wx.onMenuShareAppMessage({
	    title: title,
	    link: link,
	    imgUrl: imgUrl,
	    success: function () { 
	    },
	    cancel: function () {
	    }
	});
})
</script>
<script type="text/javascript">
function submitForm() {
	document.getElementById('saveForm').submit();
}
</script>
</head>
<body>

<div id="web_bg" style="position:absolute; width:100%; height:100%; z-index:-1"> 
<img style="position:fixed; max-width:800px;" src="${resource(dir:'images/bg-s-2015.jpg')}" height="100%" width="100%" /> 
</div>

<div class="content">
<h2>${KeyedMessage.findByKey("fall2015-save-receipt-succeed-title")?.message }</h2>
<g:if test="${flash.message }">
${flash.message }
</g:if>
<p class="textBox">
${KeyedMessage.findByKey("fall2015-save-receipt-succeed-desc")?.message }
</p>
<br/>
<br/>
<br/>
<a href="${createLink(controller:'fall2015', action:'draw', id:ticket.id) }"><span class="button  blue">点击抽奖</span></a>
</div>
<p class="textBox">
${KeyedMessage.findByKey("fall2015-edit-delivery-tips")?.message }
</p>
</body>
</html>
