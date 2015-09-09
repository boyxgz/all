<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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

<div id="web_bg" style="position:absolute; width:100%; height:100%; z-index:-1"> 
<img style="position:fixed; max-width:800px;" src="${resource(dir:'images/bg-s-2015.jpg')}" height="100%" width="100%" /> 
</div>

<div class="content">
<h2>${KeyedMessage.findByKey("2015-chose-ticket")?.message }</h2>

<p>
<a href="${createLink(action:'showCard', id:openId) }"><span class="button  blue">输入加油卡号</span></a>	
</p>
<p>
<a href="${createLink(action:'showReceipt', id:openId) }"><span class="button  blue">输入小票号码</span></a>
</p>
<p>
<a href="${createLink(action:'showInvoice', id:openId) }"><span class="button  blue">输入发票号码</span></a>	
</p>
<p>
<a href="${createLink(action:'showVoucher', id:openId) }"><span class="button  blue">使用两元红包</span></a>	
</p>
<p>
<a href="${createLink(action:'showInvitation', id:openId) }"><span class="button  blue">我已推荐2位好友</span></a>	
</p>
<p class="textBox">
<b>${KeyedMessage.findByKey("2015-chose-ticket-title")?.message }</b><br/>
${KeyedMessage.findByKey("2015-chose-ticket-desc")?.message }
</p>
</div>
</body>
</html>
