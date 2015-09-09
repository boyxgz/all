
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>中国石油湖南分公司</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=yes">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<!-- Mobile IE allows us to activate ClearType technology for smoothing fonts for easy reading -->
		<meta http-equiv="cleartype" content="on">
		<link type="text/css" rel="stylesheet" href="${createLink(uri: '/css/news-list.css')}" />

</head>
<body>
<div id="mainlist" class="news-list">
<ul>
	<g:each in="${messages }" var="message">
	<li>
		<a href="${message.url }"></a>
		<p>
		<a href="${message.url }"></a>
		<a href="${message.url }">${message.title }</a>
		</p>
		<a href="${message.url }">
		<img style="width: 50px; height: 50px;" src="${message.pictureUrl }">
		</a>
	</li>
	</g:each>
</ul>
</div>
	
</body>
</html>
