
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<%@ page import="com.surelution.wxmp.jx.TrackableArticle" %>
<!DOCTYPE html>
<html>
	<head>
		<title>请为我加油，赢取半吨汽油，全靠你啦！</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=yes">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<meta http-equiv="cleartype" content="on">
		<link type="text/css" rel="stylesheet" href="${resource(dir: 'css/weixin-mobile.css')}" />
	    <link href="${resource(dir:'css/bootstrap.min.css')}" rel="stylesheet" media="screen">
	    <script src="${resource(dir:'js/bootstrap.min.js')}"></script>
    	<script src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
    	
    	<%
			def eventDescUrl = KeyedMessage.findByKey("gas-gift-by-voice")?.message
			def fellowGuidePage = KeyedMessage.findByKey("fellow-guide-page")?.message
		 %>
    	<script type="text/javascript">
    		function fellow() {
    			document.location.href = "${fellowGuidePage}";
        	}
        	function eventDesc() {
        		document.location.href = "${eventDescUrl}";
            }
			function voteTo() {
				$.getJSON( "${createLink(controller:'gasGiftByVoice', action:'vote')}?candidate=${sharer.openId}&voter=${reader.openId}", function( data ) {
					if(data.voteInfo.status == 1) {
						alert("哦也，您已成功“帮他加油”！");
					} else {
						alert("您已为这个好友加油，无需重复操作");
					}
				}
				);
			}
    	</script>
	</head>
	<body>

	<div>
	<div class="topimgAdWarp" style="text-align: center;">
	<img class="btndown" src="${sharer.headImgUrl }" style="width:150px;height:150px" /></div>
<div class="x-label-inner">
	<div class="x-label">
		<ul class="label-ul">
			<li class="tishi">助${sharer.nickname }赢取半吨汽油</li>
			<li>
				<span style="color:#000000;"><span style="font-size: 14px;"><br/>点击“帮TA加油”助TA赢取半吨汽油哦<br/><br/></span></span></li>
			<li>
				<span style="color:#000000;"><span style="font-size: 4px;text-align: center；">
				
					<input type="button" style="width: 15em;  height: 3em;" onclick="voteTo()" value="帮TA加油">
					<br><br>
					
				<g:if test="${reader.subscribe == 0 }">
					<input type="button" style="width: 15em;  height: 3em;" onclick="fellow()" value="关注中国石油，我也要玩">
				</g:if>
				<g:elseif test="${!readerInvovled }">
					<input type="button" style="width: 15em;  height: 3em;" onclick="eventDesc()" value="我也要玩">
				</g:elseif></span></span></li>
		</ul>
	</div>
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
            "desc": "请为我加油，赢取半吨汽油，全靠你啦！",
            "title": '搭把手，帮我赢半吨汽油！中国石油"喊一声，送一升"活动狂送30，000升汽油，见者有份！'
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
