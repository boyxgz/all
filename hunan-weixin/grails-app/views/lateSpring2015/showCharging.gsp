<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="grails.util.Holders"%>
<%@page import="com.surelution.wxmp.jx.LateSpring2015ReceiptFuelCharging.FuelType"%>
<%@page import="com.surelution.wxmp.jx.SubscriberReceipt"%>
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width"/>
<title>中国石油湖南销售分公司</title>
<link href="${resource(dir:'css/spring-festival-2015.css')}" rel="stylesheet" type="text/css" />
<wx:registerJsapi queryString="lateSpring2015/${charging.type==FuelType.GAS?"gasCharging":"dieselCharging" }/${charging.subscriber.openId }" apiList="'onMenuShareAppMessage','onMenuShareTimeline'"/>
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
<h2>请输入您的${charging.type }消费小票</h2>
<g:if test="${flash.message }">
${flash.message }
</g:if>
<g:form action="saveCharging" name="saveForm">
<g:hiddenField name="id" value="${charging.subscriber.openId }"/>
<g:hiddenField name="type" value="${charging.type.name() }"/>
<table width="90%" border="0" cellpadding="10" cellspacing="0" class="mytable">
   <tr>
    <td>站名</td>
    <td><input id="station" name="stationName" type="text" width="300px" height=30% value=""/></td>
  </tr>
  <tr>
    <td>交易号</td>
    <td><input id="change" name="receiptNo" type="text" width="300px" height=30% value=""/></td>
  </tr>
  <tr>
    <td>金额</td>
    <td><input id="amount" name="amount" type="text" width="300px" height=30% value=""/></td>
  </tr>
</table>
</g:form>
<p>
<a href="javascript:submitForm()"><span class="button  blue">生成抽奖码</span></a>	
</p>
<p class="textBox">
<g:if test="${charging.type==FuelType.GAS}">${KeyedMessage.findByKey("LATE-SPRING-2015-EVENT-GAS-DESCRIPTION")?.message }</g:if>
<g:else>${KeyedMessage.findByKey("LATE-SPRING-2015-EVENT-DIESEL-DESCRIPTION")?.message }</g:else>

</p>
<p>
	<img style="float:center;" src="${resource(dir:'images/showReceipt-ticket.gif')}" height="40%" width="100%" /> 
</p>
</div>
</body>
</html>
