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

<g:form name="saveForm" action="saveVoucher">
<g:hiddenField name="id" value="${subscriber.openId }"/>
<g:hiddenField name="voucherId" value="${voucher?.id }"/>
</g:form>

<div class="content">
<g:if test="${voucher}">
<h2>确认使用关注红包，参与抽奖!</h2>
</g:if>
<g:else>
<h2>您没有关注红包，或关注红包已使用，无法参与抽奖!</h2>
</g:else>
<p><img src="${resource(dir:'images/hongbao-2.png')}" style="width:40%;" /></p>

<p>
<a href="javascript:submitForm()"><span class="button  blue">确认抽奖</span></a>	
</p>
<h4 class="share_alert">点击“确认抽奖”，将使用2元关注红包参与抽奖。</h4>

</div>
</body>
</html>
