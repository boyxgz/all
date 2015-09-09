<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@page import="com.surelution.wxmp.jx.ChangshaSubscribingGift.GiftChannel"%>
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>推荐有礼</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=yes">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="format-detection" content="telephone=no">
	<meta http-equiv="cleartype" content="on">
	<link type="text/css" rel="stylesheet" href="${resource(dir: 'css/weixin-mobile.css')}" />
</head>
<body>

	<div>
	<!-- 
	<div class="topimgAdWarp">
	<img class="btndown" src="${resource(dir:'images/golden-egg.jpg')}" style="width:290px;" /></div>
	 -->
<div class="x-label-inner">
	<div class="x-label">
		<ul class="label-ul">
			<li class="tishi">我的奖品</li>
			<li class="tishi-line">&nbsp;</li><li>
				<span style="font-size: 14px;color:#000000;">
					<b>通过点击右上角“...”按钮</b>，选择把本页发给您的朋友，或者，分享到朋友圈，如果您的朋友加入，您将获得额外的刮刮卡抽奖机会！<br/><br/><br/>
				</span></li>
			<g:if test="${opens && opens.size() > 0 }">
			<li>您的已经刮开的奖券</li>
			<g:each in="${opens }" var="o">
				<li>
					<span style="font-size: 14px;color:#000000;">
						兑奖码：${o.sn }，奖品：${o.type.name }，备注：
						<g:if test="${o.channel == GiftChannel.SUBSCRIBING }">本人关注抽奖</g:if>
						<g:elseif test="${o.channel == GiftChannel.INVITING }">
						推荐${UserInfo.loadUserInfo(o.guest?.openId)?.nickname}关注
						</g:elseif>
					</span>
				</li>
			</g:each>
			</g:if>
			<g:else>
				<li>您尚无任何已经刮开的奖券</li>
			</g:else>
			<li>&nbsp;</li>
			<g:if test="${waitingOpen && waitingOpen.size() > 0 }">
			<li>您的还有没刮开的奖券（触摸如下列表，前往刮奖）</li>
			<g:each in="${waitingOpen }" var="o">
				<li>
					<span style="font-size: 14px;color:#000000;">
					<g:link controller="invitation" action="swipe" id="${o.id }">
						<font color="blue">兑奖码：${o.sn }，备注：
						<g:if test="${o.channel == GiftChannel.SUBSCRIBING }">本人关注抽奖</g:if>
						<g:elseif test="${o.channel == GiftChannel.INVITING }">
						推荐${UserInfo.loadUserInfo(o.guest?.openId)?.nickname}关注
						</g:elseif>
						</font>
					</g:link>
					</span>
				</li>
			</g:each>
			</g:if>
			<g:else>
				<li>您尚无任何没刮开的奖券</li>
			</g:else>
			<li>&nbsp;</li>
			<g:if test="${paids && paids.size() > 0 }">
			<li>您的已兑付（或木有中奖）的奖券</li>
			<g:each in="${paids }" var="o">
				<li>
					<span style="font-size: 14px;color:#000000;">
						兑奖码：${o.sn }，备注：
						<g:if test="${o.channel == GiftChannel.SUBSCRIBING }">本人关注抽奖</g:if>
						<g:elseif test="${o.channel == GiftChannel.INVITING }">
						推荐${UserInfo.loadUserInfo(o.guest?.openId)?.nickname}关注
						</g:elseif>
					</span>
				</li>
			</g:each>
			</g:if>
			<g:else>
				<li>您尚无任何已兑付（或木有中奖）的奖券</li>
			</g:else>
			<li>&nbsp;</li>
		</ul>
	</div>
</div>


</body>
	<script type="text/javascript">
	function shareTimeline() {
        WeixinJSBridge.invoke('shareTimeline',{
            "img_url": "${resource(dir:'images', file:'gifts.jpg', absolute:true)}",
            "img_width": "200",
            "img_height": "200",
            "link": "${url }",
            "desc": "${KeyedMessage.findByKey("invitation-message-desc")?.message}",
            "title": '${KeyedMessage.findByKey("invitation-message-title")?.message}'
        }, function(res) {
               //_report('timeline', res.err_msg);
        });
    }
	function shareFriend() {
        WeixinJSBridge.invoke('sendAppMessage',{
            "img_url": "${resource(dir:'images', file:'gifts.jpg', absolute:true)}",
            "img_width": "200",
            "img_height": "200",
            "link": "${url }",
            "desc": "${KeyedMessage.findByKey("invitation-message-desc")?.message}",
            "title": '${KeyedMessage.findByKey("invitation-message-title")?.message}'
        }, function(res) {
            //_report('send_msg', res.err_msg);
        })
    }
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
        // 发送给好友
        WeixinJSBridge.on('menu:share:appmessage', function(argv){
            shareFriend();
        });
        // 分享到朋友圈
        WeixinJSBridge.on('menu:share:timeline', function(argv){
            shareTimeline();
        });
    }, false);
	</script>
</html>