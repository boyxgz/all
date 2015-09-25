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

<div class="x-label-inner">
	<div class="x-label">
		<ul class="label-ul">
			<li class="tishi">亲，小U来送油啦！</li>
			<li class="tishi-line">&nbsp;</li>
			<li>
				<span style="color:#000000;"><span style="font-size: 14px;">恭喜！您已获<font color="red">参加“冲刺半吨汽油”大奖</font>评选资格。微信转发、电话求助，求爷爷告奶奶使出各种招数，让小伙伴来给您投票吧。<br/><br/></span></span></li>
			<li>
				<span style="color:#000000;"><span style="font-size: 14px;"><font color="blue">★点击右上角分享给好友或者朋友圈★</font><br/><br/></span></span></li>
		</ul>
	</div>
</div>

</body>
	<script type="text/javascript">
	function shareTimeline() {
        WeixinJSBridge.invoke('shareTimeline',{
            "img_url": "${resource(dir:'images', file:'roar-post.jpg')}",
            "img_width": "200",
            "img_height": "200",
            "link": "${url }",
            "desc": "请为我加油，赢取半吨汽油，全靠你啦！",
            "title": '搭把手，帮我赢半吨汽油！中国石油"喊一声，送一升"活动狂送30，000升汽油，见者有份！'
        }, function(res) {
               //_report('timeline', res.err_msg);
        });
    }
	function shareFriend() {
        WeixinJSBridge.invoke('sendAppMessage',{
            "img_url": "${resource(dir:'images', file:'roar-post.jpg')}",
            "img_width": "200",
            "img_height": "200",
            "link": "${url }",
            "desc": "请为我加油，赢取半吨汽油，全靠你啦！",
            "title": '搭把手，帮我赢半吨汽油！中国石油"喊一声，送一升"活动狂送30，000升汽油，见者有份！'
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