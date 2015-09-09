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
<h2>我的抽奖券（点击券号进行抽奖）</h2>
<g:if test="${flash.message }">
${flash.message }
</g:if>
<g:set var="today" value="${new Date().clearTime() }"></g:set>
<g:if test="${tickets }">
<g:each in="${tickets }" var="ticket">
<p>
<g:if test="${ticket.drawAt }"><span class="button  blue"><del>已抽奖(抽奖码:${ticket.id })</del></span></g:if>
<g:elseif test="${ticket.dateCreated.clearTime() != today }"><span class="button  blue"><del>已过期(抽奖码:${ticket.id })</del></span></g:elseif>
<g:else>

<a href="${Auth2Util.buildRedirectUrl("http://"+Holders.config.app.web.path+"/lateSpring2015/draw", "${ticket.id}", AuthScope.BASE) }"><span class="button  blue">请抽奖(抽奖码:${ticket.id })</span></a>
</g:else>
</p>
<br/>
</g:each>
</g:if>
<g:else>
<br/><br/>
您暂无任何抽奖券
</g:else>
</div>
</body>
</html>
