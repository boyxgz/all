<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width"/>
<title>中国石油湖南销售分公司</title>
<link href="${resource(dir:'css/spring-festival-2015.css')}" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function submitForm() {
		<g:if test="${subscriberCard.id}">alert("您已经参与过本项抽奖，等待下次机会吧");</g:if>
		<g:else>document.getElementById('saveCardForm').submit();</g:else>
	}
</script>
</head>
<body>

<div id="web_bg" style="position:absolute; width:100%; height:100%; z-index:-1"> 
<img style="position:fixed; max-width:800px;" src="${resource(dir:'images/bg-s-2015.jpg')}" height="100%" width="100%" /> 
</div>

<div class="content">
<h2>请输入您的加油卡号进行抢红包：</h2>
<g:if test="${flash.message }">
${flash.message }
</g:if>
<g:form action="saveCard" name="saveCardForm">
<g:hiddenField name="id" value="${subscriberCard.subscriber.openId }"/>
<table width="90%" border="0" cellpadding="10" cellspacing="0" class="mytable">
  <tr>
    <td>卡号</td>
    <td><input name="cardNo" type="text" width="300px" height="30%" value="${subscriberCard.cardNo }"/></td>
  </tr>
</table>
<p>
<a href="javascript:submitForm()"><span class="button  blue">确认抽奖</span></a>	
</p>
</g:form>
<p class="textBox">
${KeyedMessage.findByKey("gascard_hongbao")?.message }
</p>
<p>
	<img style="max-width:300px;float:center;" src="${resource(dir:'images/showCard-ticket.jpg')}" height="40%" width="80%" /> 
</p>
</div>
</body>
</html>
