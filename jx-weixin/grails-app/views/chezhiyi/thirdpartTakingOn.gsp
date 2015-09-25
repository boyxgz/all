
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<%@ page import="com.surelution.wxmp.jx.TrackableArticle" %>
<!DOCTYPE html>
<html>
	<head>
		<title>加入中油服务商，共享成功</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/> 
    	<script src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
	</head>
	<body>


<div id="web_bg" style="position:absolute; width:100%; height:100%; z-index:-1"> 
<img style="position:fixed;" src="${resource(dir:'images/mobile_bg.jpg')}" height="100%" width="100%" /> 
</div>
<g:if test="${flash.message}">
<div class="message" role="status">${flash.message}</div>
</g:if>

<div class="content">
<h2>${KeyedMessage.findByKey("thirdpard-taking-on-share-title")?.message}</h2>

<p>

	<g:form action="thirdpartTakingOn" >
<g:hiddenField name="openId" value="${thirdpartTakingOnInstance.openId }"/>
	<label for="name">
		<g:message code="thirdpartTakingOn.name.label" default="Name" />
		
	</label>
<br/>
	<g:textField name="name" value="${thirdpartTakingOnInstance?.name}"/>
<br/>

	<label for="linkMan">
		<g:message code="thirdpartTakingOn.linkMan.label" default="Link Man" />
		
	</label>
<br/>
	<g:textField name="linkMan" value="${thirdpartTakingOnInstance?.linkMan}"/>
<br/>

	<label for="tel">
		<g:message code="thirdpartTakingOn.tel.label" default="Tel" />
		
	</label>
<br/>
	<g:textField name="tel" value="${thirdpartTakingOnInstance?.tel}"/>
<br/>

	<label for="address">
		<g:message code="thirdpartTakingOn.address.label" default="Address" />
		
	</label>
<br/>
	<g:textField name="address" value="${thirdpartTakingOnInstance?.address}" size="40"/>
<br/>

	<label for="production">
		<g:message code="thirdpartTakingOn.production.label" default="Production" />
		
	</label>
<br/>
	<g:textArea name="production" value="${thirdpartTakingOnInstance?.production}" cols="40"/>
<br/>
	<label for="remark">
		<g:message code="thirdpartTakingOn.remark.label" default="Remark" />
		
	</label>
<br/>
	<g:textArea name="remark" value="${thirdpartTakingOnInstance?.remark}" cols="40"/>
<br/>
		
		
<g:submitButton name="create" class="save" value="提交" />
	</g:form>
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
            "link": "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6843083540cb5186&redirect_uri=http%3A%2F%2Fjx.sh-hansi.com%2Fchezhiyi%2FthirdpartTakingOn&response_type=code&scope=snsapi_base#wechat_redirect",
            "desc": "${KeyedMessage.findByKey("thirdpard-taking-on-share-desc")?.message}",
            "title": '${KeyedMessage.findByKey("thirdpard-taking-on-share-title")?.message}'
        }, function(res) {
        });
    }
	function shareFriend() {
        WeixinJSBridge.invoke('sendAppMessage',{
            "img_url": "${resource(dir:'images', file:'roar-post.jpg', absolute:true)}",
            "img_width": "200",
            "img_height": "200",
            "link": "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6843083540cb5186&redirect_uri=http%3A%2F%2Fjx.sh-hansi.com%2Fchezhiyi%2FthirdpartTakingOn&response_type=code&scope=snsapi_base#wechat_redirect",
            "desc": "${KeyedMessage.findByKey("thirdpard-taking-on-share-desc")?.message}",
            "title": '${KeyedMessage.findByKey("thirdpard-taking-on-share-title")?.message}'
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
