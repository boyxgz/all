<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.surelution.wxmp.jx.Branch"%>
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
<link href="${resource(dir:'css/delivery-info.css')}" rel="stylesheet" type="text/css" />
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
	<div class="collect">
		<g:if test="${flash.message }">
		<p class="biaoti"><font color="red">${flash.message }</font></p>
		</g:if>
		<form id="frommsg" action="${createLink(controller:'fall2015', action:'saveDelivery') }" method="post">
			<p class="biaoti">收件人信息</p>
	    	<ul class="ul">
				<li>
					<span>所在地区</span>
					<div>
						<g:select class="cccc" name="branch" from="${Branch.list() }" optionKey="id" optionValue="name" value="${address?.branch?.id }"/>
					</div>
	           </li>
				<li>
	            	<span>详细地址</span>
	           		<div><textarea class="cccc" rows="1" name="address" cols="27" onscroll="this.rows++;" id="address" >${address?.address }</textarea></div>
	           </li>
	           <li><span>姓名</span><div><input class="cccc" id="linkMan" name="linkMan" type="text" value="${address?.linkMan }"></div></li>
	           <li style="border-bottom:none"><span>联系方式</span><div><input class="cccc" id="tel" name="tel" type="text" value="${address?.tel }"></div></li>
	        </ul>
        </form>
	</div>
	<p class="tc pt3"><button class="but-xa" onclick="_reg()">保存</button></p>
	<div class="collect">
		<p class="biaoti">
		${KeyedMessage.findByKey("fall2015-edit-delivery-tips").message }
</p>
	</div>
<script type="text/javascript">
var _reg = function(){
	var address = document.getElementById('address').value;
	var name = document.getElementById("linkMan").value;
	var phone = document.getElementById("tel").value;
	var cid = document.getElementById("branch").value;
	if(cid==""){
		alert("请完善所在地区!");
		return;
	}
	if(address==""){
		alert("请填写详细地址");
		return;
	}
	if(name==""||name.length<2){
		alert("请填写姓名信息!");
		return;
	}
	if(phone==""){
		alert("请输入联系方式!");
		return;
	}
	var patrn = /^[\d|\D]{0,}\d{7,11}[\d|\D]{0,}$/;
	if(!patrn.test(phone)){
		alert("联系方式错误");
		return;
	}
	document.getElementById("frommsg").submit();
};
</script>

</body></html>
