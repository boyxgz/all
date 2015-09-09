<!DOCTYPE html>
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<%@page import="com.surelution.wxmp.jx.ChangshaSubscribingGift"%>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name='HandheldFriendly' content='True' />
    <meta name='viewport' content='user-scalable=0' />
    <meta name="viewport" content="width=device-width" />
    <title>刮刮奖</title>

    <g:if test="${gift.status == ChangshaSubscribingGift.GiftStatus.NEW }">
	<script type="text/javascript" src="${resource(dir: 'js/jquery-1.9.1.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js/jquery.eraser.js')}"></script>
    <style type="text/css">
      body {
        background: #FFF;
        color: #FFF;
        margin: 5px;
        padding: 0px;
        margin-bottom: 45px;
        text-align: center;
        font-family: Helvetica, Arial;
      }

      a {
        color: #000;
      }

      a.box {
        text-decoration: none;
        display: inline-block;
        color: #000;
        background: #DDD;
        padding: 10px;
        margin: 10px;
      }

      .big {
        font-size: 2em;
        display: inline-block;
        margin: 10px;
      }
      .container {
        position: relative;
        display: inline-block;
        width: 320px;
        height: 450px;
      }

      #robot {
        position: absolute;
        top: 0px;
        left: 0px;
        z-index: 1;
      }

      #redux {
        position: absolute;
        top: 60px;
        left: 130px;
        z-index: 2;
      }

    </style>
    </g:if>
  </head>
  <body>
    <span class="container">
      <img id="robot" src="${resource(dir: 'images/voucher')}${gift.type.key}.jpg?v=12345" width="320"/>
      
    <g:if test="${gift.status == ChangshaSubscribingGift.GiftStatus.NEW }">
      <img id="redux" src="${resource(dir: 'images/overlay.jpg')}" />
      </g:if>
    </span>
    <g:if test="${gift.status != ChangshaSubscribingGift.GiftStatus.NEW }">
    <p id="voucherSn">您的兑奖编号是${gift.sn }</p>
    </g:if>
    <p><b>通过点击右上角“...”按钮</b>，选择把本页发给您的朋友，或者，分享到朋友圈，推荐好友一起关注哦，每推荐一位好友成功关注，推荐人即可获得一次刮奖机会，推荐越多，刮奖机会越多。</p>
    <p>
    <img src="${resource(dir: 'images/tips.png')}" width="320">
    </p>
    <g:if test="${gift.status == ChangshaSubscribingGift.GiftStatus.NEW }">
    <script type = "text/javascript">

      $(function(){
        $('#redux').eraser({
            size: 10,
            progressFunction: function(p) {
                if(p > 0.2) {
                	$('#redux').eraser('clear');
					
					$.getJSON( "${createLink(controller:'invitation', action:'open', id:gift.id)}", 
						function( data ) {
							<g:if test="${gift.type.price == 0}">alert("谢谢您的支持");</g:if>
							<g:else>alert("您获得了价值${gift.type.price}元的${gift.type.name}");</g:else>
						}
					);
					
                }
              }

         });
      });

    </script>
</g:if>
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