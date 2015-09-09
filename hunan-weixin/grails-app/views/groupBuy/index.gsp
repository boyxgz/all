
<%@ page import="com.surelution.wxmp.jx.IncomeMessage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html lang="zh_CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width">
	<meta name="format-detection" content="false">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<title>Kitchen Sink</title>
	<link rel="stylesheet" href="${resource(dir:'joapp-css/jo.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir:'joapp-css/app.css')}" type="text/css">
</head>
<body onload="App.load();">

	<div id="hide">
	<jocard id="about">
		<jotitle>This was Defined as HTML</jotitle>
		<jogroup id="aboutcontent">
		<johtml class="about">
			<img src="joicon_114.png" width="114" height="114" alt="Apple Touch Icon">
			<p>
				Welcome to a "kitchen sink" demo of some of the things you
				can do with the Jo HTML5 framework.
			</p>
			<p>
				One thing I hope comes across is how flexible the framework
				truly is. This demo illustrates not only some of the important
				goodies like widgets and interacting with data, but also some
				of the many ways you can go about getting them to work.
			</p>
			<p>
				For example, this "about" content is pulled directly from the
				<code>index.html</code> file in the project using <code>joInterface</code>.
				This entire box can be defined by your HTML, or using pure
				JavaScript, or a mix.
			</p>
			<p>
				Most of the coding examples use a pure JavaScript approach
				because that tends to be more performant in terms of load time,
				and tends to build tighter apps.
			</p>
			<p>
				However, as this view shows, Jo doesn't try to force you to
				go any deeper into the framework than you want to go. By learning
				only a few special tags, you can have a quick prototype in HTML
				in minutes.
			</p>
			<p>
				Once you have that prototype, it's easy to turn those styled tags
				into working UI controls by using the joInterface class. Heck,
				you can even take static HTML content and place it directly into
				most of the UI widgets as a string, or by passing a reference to a
				parent DOM element.
			</p>
		</johtml>
		</jogroup>
	</jocard>
	</div>

	<!-- load the jo library -->
	<script src="${resource(dir:'joapp-js/jo.js')}"></script>

	<!-- app scripts for this demo -->${resource(dir:'joapp-js/app.css')}
	<script src="${resource(dir:'joapp-js/app.js')}"></script>
	<script src="${resource(dir:'joapp-js/menu.js')}"></script>
	<script src="${resource(dir:'joapp-js/popups.js')}"></script>
	<script src="${resource(dir:'joapp-js/widgets.js')}"></script>
	<script src="${resource(dir:'joapp-js/lists.js')}"></script>
	<script src="${resource(dir:'joapp-js/audio.js')}"></script>
	<script src="${resource(dir:'joapp-js/ajax.js')}"></script>
	<script src="${resource(dir:'joapp-js/themes.js')}"></script>

</body>
</html>

