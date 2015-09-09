
<!DOCTYPE html>
<%@page import="grails.util.Holders"%>
<%@page import="com.surelution.wxmp.jx.KeyedMessage"%>
<%@page import="com.surelution.wxmp.jx.Voucher.VoucherStatus"%>
<html>
	<head>
		<title>推荐排名</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/> 
		<link href="${resource(dir:'css/spring-festival-2015.css')}" rel="stylesheet" type="text/css" />
		
		<wx:registerJsapi queryString="springFestival2015/invitationTop?${request.queryString }" apiList="'onMenuShareAppMessage','onMenuShareTimeline'"/>
		<script type="text/javascript">
		var title = '${KeyedMessage.findByKey('2015-share-title').message}';
		var link = '${dest}';
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
<div id="web_bg" style="position:absolute; width:100%; height:100%; z-index:-1"> 
<img style="position:fixed; max-width:800px;" src="${resource(dir:'images/bg-s-2015.jpg')}" height="100%" width="100%" /> 
</div>
<div id="mcover" onclick="document.getElementById('mcover').style.display='';" style="display: none;">
     <img src="${resource(dir:'images/share.png')}">
</div>
<div class="content">
<h2>${KeyedMessage.findByKey("2015-invitation-title")?.message }</h2>
<br/>
<h2>您共推荐：${myCount }位朋友</h2>
<h2>第1名推荐：${maxCount }位朋友</h2>
<h2>第5名推荐：${top5 }位朋友</h2>
<h2>第10名推荐：${top10 }位朋友</h2>
<h2>第50名推荐：${top50 }位朋友</h2>
<h2>第100名推荐：${top100 }位朋友</h2>
<h2>您的排名：${myPositon }</h2>

<p>
<a href="#" onclick="document.getElementById('mcover').style.display='block';"><span class="button  blue">分享到朋友圈吧</span></a>	
</p>
<p class="textBox">
<b>活动说明说明：</b><br/>
${KeyedMessage.findByKey("2015-invitation-desc")?.message }
</p>
</div>

</body>
</html>