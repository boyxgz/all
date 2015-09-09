
<!DOCTYPE html>
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<%@page import="com.surelution.whistle.core.js.JsApiContext"%>
<%@page import="grails.util.Holders"%>
<html>
	<head>
		<title>关注有礼</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width">
		<link href="${resource(dir:'css/spring-festival-2015.css')}" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${resource(dir: 'js/jquery-1.9.1.min.js')}"></script>
		
		<wx:registerJsapi queryString="springFestival2015/registerGreeting/${voucher.id }" apiList="'onMenuShareAppMessage','onMenuShareTimeline'"/>

		<script type="text/javascript">
			function shareVoucher() {
				var url = 'http://${Holders.config.app.web.path}/springFestival2015/shareVoucher/${voucher.id}';
				$.getJSON(url);
			}
			var title = '${KeyedMessage.findByKey('2015-share-title').message}';
			var link = '${dest}';
			var imgUrl = 'http://${Holders.config.app.web.path}/images/hongbao-icon.jpg';
			wx.ready(function () {
				wx.onMenuShareTimeline({
				    title: title,
				    link: link,
				    imgUrl: imgUrl,
				    success: function () { 
				    	//shareVoucher();
				    },
				    cancel: function () {
					    
				    }
				});

				wx.onMenuShareAppMessage({
				    title: title,
				    link: link,
				    imgUrl: imgUrl,
				    success: function () { 
				    	//shareVoucher();
				    },
				    cancel: function () {
				    }
				});
			})
		</script>
	</head>
	<body>

<div id="web_bg" style="position:absolute; width:100%; height:100%; z-index:-1">
<img style="position:fixed; max-width:800px;" src="${resource(dir:'images/bg-s-2015.jpg')}" height="100%" width="100%" /> 
</div>
<div id="mcover" onclick="document.getElementById('mcover').style.display='';" style="display: none;">
     <img src="${resource(dir:'images/share.png')}">
</div>
<div class="content">
<h2>恭喜您，获得关注红包2元。<br>
</h2>

<div class="top">
<img src="${resource(dir:'images/hongbao-2.png')}" width="40%" height="40%"  /> 
</div>

<p>
<a href="#" onclick="document.getElementById('mcover').style.display='block';"><span class="button  blue">分享到朋友圈吧</span></a>	
</p>
<p class="textBox">
<b>活动规则及说明：</b><br/>
${KeyedMessage.findByKey("2015-spring-festival-event-tips")?.message }
</p>
</div>

</body>


</html>