
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<%@ page import="com.surelution.wxmp.jx.TrackableArticle" %>
<!DOCTYPE html>
<html>
	<head>
		<title>请为我加油，赢取半吨汽油，全靠你啦！</title>
    	<script src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
		<link href="${resource(dir:'css/voice-gift.css')}?v=2" rel="stylesheet" type="text/css" />
    	
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
				$.getJSON( "${createLink(controller:'gasGiftByVoice', action:'vote')}?candidate=${sharer.openId}&voter=${reader.openId}", 
						function( data ) {
					if(data.voteInfo.status == 1) {
						alert("哦也，您已成功“帮他加油”！");
					} else if(data.voteInfo.status == 2) {
						alert("活动已经结束，下次要早些哦！");
					} else {
						alert("您已为这个好友加油，无需重复操作");
					}
				}
				);
			}
    	</script>
	</head>
	<body>


<div id="web_bg" style="position:absolute; width:100%; height:100%; z-index:-1"> 
<img style="position:fixed;" src="${resource(dir:'images/mobile_bg.jpg')}" height="100%" width="100%" /> 
</div>

<div class="header">
<img src="${sharer.headImgUrl }" width="200" height="200" alt="用户名" /> 
 </div>
<div class="content">
<h2>快快帮 ${sharer.nickname } 赢取半吨汽油！</h2>
<p><a href="javascript:voteTo()"><img src="${resource(dir:'images/gas-gift-vote-btn.gif')}" /></a><br/>
点击“帮TA加油”助朋友赢取半吨汽油哦</p>

<p>
<g:if test="${reader.subscribe == 0 }">
	<a href="javascript:fellow()"><span class="button  blue">关注中国石油，我也要玩</span> </a>
<br />
点击“关注中国石油，我也要玩”自己赢取好礼!
</g:if>
<g:elseif test="${!readerInvovled }">
	<a href="javascript:eventDesc()"><span class="button  blue">我也要玩</span> </a>
<br />
点击“我也要玩”自己赢取好礼!
</g:elseif>
</p>
<p>

</p>

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
