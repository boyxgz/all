<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:javascript library="jquery" />
		<r:layoutResources />
		<g:layoutHead/>
	</head>
	 <body>
	    <div id="container">
	    	<div id="header">
	    		<div class="header_box">
		    			<a href="${createLink(uri: '/')}" title="微信营销平台后台"><img style="border: 0 none;float:left;" src="${resource(dir:'images',file:'title.png')}" width="600px" height="60px"/></a>
					<div style='float: right;font-size:12px;padding-top:50px;'>
					当前用户：<sec:username />&nbsp;&nbsp;<g:link controller="user" action="showChangePw" style="color:black;font-weight:normal;">更改密码</g:link>&nbsp;&nbsp;<g:link controller="logout" style="color:black;font-weight:normal;">退出</g:link>
					</div>
		    	</div>
		    	</div>
			<div id="leftcol">
				<sec:ifAnyGranted roles="ROLE_STATION">
				<p>
					<g:link url="${resource(dir:'pos')}" >红包兑奖</g:link>
				</p>
				<p>
					<g:link url="${resource(dir:'reports/stationDetailList')}" >兑奖报表</g:link>
				</p>
				<!-- 
				<p>
					<g:link url="${resource(dir:'changshaInvitingReports/index')}" >兑奖记录</g:link>
				</p>
				 -->
				<p>
					<g:link url="${resource(dir:'registerPrize/dailyReport')}" >兑奖日报</g:link>
				</p>
				<p>
					<g:link url="${resource(dir:'reports/subscriberStationDaily')}" >粉丝增长日报</g:link>
				</p>
				</sec:ifAnyGranted>
				<sec:ifAnyGranted roles="ROLE_BRANCH">
				<p>
					<g:link url="${resource(dir:'pos')}" >红包兑奖</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'reports/branchDetailList')}"  >分公司兑奖报表</g:link>
				</p>
				<!-- 
				<p>
					<g:link url="${resource(dir:'changshaInvitingReports/summary')}" >长沙扫码报表</g:link>
				</p>
				<p>
					<g:link url="${resource(dir:'changshaInvitingReports/summary2')}" >长沙兑奖报表</g:link>
				</p>
				 -->
				<p>
					<g:link url="${resource(dir:'gasStation')}" >加油站管理</g:link>
				</p>
				<!-- 
				<p>
					<g:link url="${resource(dir:'promotionNotice')}" >促销活动</g:link>
				</p>
				-->
				<p>
					<g:link url="${resource(dir:'reports/subscriberBranchDaily')}" >粉丝汇总报表</g:link>
				</p>
				<p>
					<g:link url="${resource(dir:'/registerPrize/summaryReport')}" >关注兑奖报表</g:link>
				</p>
				<p>
					<g:link url="${resource(dir:'/subscriberCommentAssignment')}" >客服消息</g:link>
				</p>
				</sec:ifAnyGranted>
				
				<sec:ifAnyGranted roles="ROLE_HEADQUARTER, ROLE_ADMIN">
			    <p>
					<g:link url="${resource(dir:'fall2015Voucher')}"  >赢缤纷水果审核</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'fall2015Reports/dashboard')}"  >赢缤纷水果报表</g:link>
				</p>
				<p>
					<g:link url="${resource(dir:'fall2015Reports/cashReport')}"  >充值金额报表</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'fall2015Voucher/approvedList')}"  >批准发货</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'fall2015Voucher/addressList')}"  >地址列表</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'lateSpring2015Report/dashboard')}"  >清明5.1活动汇总报表</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'lateSpring2015Report/dashboardByBranch')}"  >清明5.1分公司汇总</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'lateSpring2015Report/dashboardByStation')}"  >清明5.1加油站汇总</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'reports/spring2015Dashboard')}"  >春节活动汇总报表</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'drawPrizeVoucher/list')}"  >抽奖明细表</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'springFestival2015Reports/dashboard')}"  >汇总日报</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'springFestival2015Reports/dashboardByBranch')}"  >分公司汇总报表</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'springFestival2015Reports/dashboardByStation')}"  >加油站汇总报表</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'springFestival2015Reports/invitingTop')}"  >推荐排名报表</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'drawPrizeVoucher/listInvitingTop')}"  >推荐排名奖品报表</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'reports/subscriberHeadquarterDaily')}"  >分公司粉丝汇总报表</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'registerPrize/summaryHeadquarterReport')}"  >分公司兑奖汇总报表</g:link>
				</p>
				<p>
					<g:link url="${resource(dir:'branch')}" >分公司管理</g:link>
				</p>
				<p>
			   		 <g:link url="${resource(dir:'dynArticle')}"  >编辑简单页面</g:link>	
			    </p>
			    <p>
					<g:link url="${resource(dir:'multiNewsMessage')}"  >编辑页面绑定</g:link>
				</p>
			    <p>
					<g:link url="${resource(dir:'multiNewsMessageItem')}"  >编辑页面绑定小项</g:link>
				</p>
				<p>
					<g:link url="${resource(dir:'/subscriberCommentAssignment')}" >客服消息</g:link>
				</p>
				</sec:ifAnyGranted>
				<sec:ifAnyGranted roles="ROLE_ADMIN">
				<p>
					<g:link url="${resource(dir:'user')}" >用户管理</g:link>
				</p>
				<p>
					<g:link url="${resource(dir:'subscriberCommentReplyUser')}" >客服权限管理</g:link>
				</p>
				</sec:ifAnyGranted>
			</div>

			<div id="main_content"><g:layoutBody /></div>
			<div id="footer">
			<p>
			___________________________________________________________________________________________
			</p>
				&copy;<a href="http://www.sh-hansi.com"  style="text-decoration:none;color:white;">上海悍思企业管理咨询有限公司</a>&nbsp;&nbsp;&nbsp;&nbsp;技术支持
			</div>
	    </div>
	</body>
</html>
