<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="grails.util.Holders"%>
<%@page import="com.surelution.whistle.core.Auth2Util.AuthScope"%>
<%@page import="com.surelution.whistle.core.Auth2Util"%>
<%@page import="com.surelution.wxmp.jx.SubscriberReceipt"%>
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width"/>
<title>中国石油湖南销售分公司</title>
<link href="${resource(dir:'css/spring-festival-2015.css')}" rel="stylesheet" type="text/css" />
<wx:registerJsapi queryString="lateSpring2015/draw?${request.queryString }" apiList="'onMenuShareAppMessage','onMenuShareTimeline'"/>
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
</head>
<body>

<div id="web_bg" style="position:absolute; width:100%; height:100%; z-index:-1"> 
<img style="position:fixed; max-width:800px;" src="${resource(dir:'images/bg-s-2015.jpg')}" height="100%" width="100%" /> 
</div>
<div class="content">
<h2>恭喜您，抽中了${voucher.batch.name }，奖券号码是${voucher.fullSn }，请妥善保存此号码，用来查询奖品配送进度</h2>

<p>
<a href='${createLink(controller:'fall2015', action:'index') }'><span class="button  blue">填写配送信息</span></a>	
</p>
<p class="textBox">
<b>${KeyedMessage.findByKey("FALL-2015-EVENT-title")?.message }</b><br/>
${KeyedMessage.findByKey("FALL-2015-EVENT-desc")?.message }
</p>

</div>
</body>
</html>
