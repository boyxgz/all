<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.surelution.wxmp.jx.SubscriberReceipt"%>
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width"/>
<title>中国石油湖南销售分公司</title>
<link href="${resource(dir:'css/spring-festival-2015.css')}" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function submitForm() {
		<g:if test="${!voucher}">alert("您没有关注红包，或关注红包已使用，无法参与抽奖，等待下次机会吧");</g:if>
		<g:else>document.getElementById('saveForm').submit();</g:else>
	}
</script>
</head>
<body>

<div id="web_bg" style="position:absolute; width:100%; height:100%; z-index:-1"> 
<img style="position:fixed; max-width:800px;" src="${resource(dir:'images/bg-s-2015.jpg')}" height="100%" width="100%" /> 
</div>
<div class="content">
<h2>恭喜您，抽中了${voucher.batch.name }，奖券号码是${voucher.fullSn }</h2>

<p><img src="${resource(dir:'images/with-prize.png')}" style="width:40%;" /></p>
 
<p>
<a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc1f365333e44a020&redirect_uri=http%3A%2F%2Fhunan.sh-hansi.com%2FwxPortal%2FmyVouchers&response_type=code&scope=snsapi_base#wechat_redirect"><span class="button  blue">查看中奖信息</span></a>	
</p>
<h4 class="share_tips">您可以点击按钮“查看中奖信息”，或进入公众号，点击菜单“我的奖券”，查看自己所有的中奖信息</h4>
<p class="textBox">
<b>活动规则及说明：</b><br/>
${KeyedMessage.findByKey("2015-spring-festival-event-tips")?.message }
</p>
</div>
</body>
</html>
