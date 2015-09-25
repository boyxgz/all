<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>喊一声，送一升</title>
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
			<li class="tishi">亲，小U来送油啦！</li>
			<li class="tishi-line">&nbsp;</li>
			<li>
				<span style="color:#000000;"><span style="font-size: 14px;">恭喜！您已获汽油1升！小U已在您的账户中存入了一个礼品券。<br/><br/>
戳屏幕左下角菜单<font color="red">“送一升”</font> → <font color="red">“我的礼品券”</font>便可查看您的礼品码。
请于2014年11月1号至2014年12月30号间持手机去市区参加活动的6座加油站（您可以使用“<font color="red">油站导航</font>”）便可免费加取您的1升汽油啦。<br/><br/></span></span></li>
			<li>
				<span style="color:#000000;"><span style="font-size: 18px;"><font color="blue">您把这条消息转发到朋友圈，邀请小伙伴点击<font color="red">“帮TA加油”</font>按钮，更有机会赢取<font color="red">半吨汽油、免费加满油箱</font>等好礼！考验人品、测试友情的时候到啦，赶紧转吧！</font><br/><br/></span></span></li>
			<li>
				<span style="color:#000000;"><span style="font-size: 14px;">目前，您分享的内容已经有<font color="blue"> ${readingCount } </font>个人查看了，有<font color="blue"> ${votingCount } </font>个人给您点了加油<g:if test="${faultCount != 0 }">（另外，系统统计出您另有${faultCount}票待核实，小U正在跟腾讯公司核实，如有疑问，请联系<a href="tel:0575-83383129">0575-83383129</a>）</g:if>，当前排名<font color="blue"> ${topAt>3000?"3000名开外啦！":"第" + topAt + "名"} </font>。<br/><br/></span></span></li>
			<li> 
				<span style="color:#000000;"><span style="font-size: 14px;">
注：6站地址<br/>
中环东路加油站（欧尚超市北面）<br/>
二环西路加油站（富悦大酒店对面）<br/>
方兴加油站（富悦大酒店北面）<br/>
东城加油站（电气城北面）<br/>
象贤加油站（秀洲工业园区口，嘉绍高速入口处）<br/>
台兴加油站（二环北路，韩泰公司南面）<br/><br/></span></span></li>
			<li>
				<span style="color:#000000;"><span style="font-size: 14px;"><font color="blue">★ 点击右上角分享给好友或者朋友圈 ★</font></span></span></li>
			<li>
		</ul>
	</div>
</div>


</body>
	<script type="text/javascript">
	function shareTimeline() {
        WeixinJSBridge.invoke('shareTimeline',{
            "img_url": "${resource(dir:'images', file:'roar-post.jpg', absolute:true)}",
            "img_width": "200",
            "img_height": "200",
            "link": "${url }",
            "desc": "${KeyedMessage.findByKey("gas-gift-by-voice-share-desc")?.message}",
            "title": '${KeyedMessage.findByKey("gas-gift-by-voice-share-title")?.message}'
        }, function(res) {
               //_report('timeline', res.err_msg);
        });
    }
	function shareFriend() {
        WeixinJSBridge.invoke('sendAppMessage',{
            "img_url": "${resource(dir:'images', file:'roar-post.jpg', absolute:true)}",
            "img_width": "200",
            "img_height": "200",
            "link": "${url }",
            "desc": "${KeyedMessage.findByKey("gas-gift-by-voice-share-desc")?.message}",
            "title": '${KeyedMessage.findByKey("gas-gift-by-voice-share-title")?.message}'
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