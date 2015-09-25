
<!DOCTYPE html>
<%@page import="com.surelution.wxmp.jx.Branch"%>
<%@page import="com.surelution.wxmp.jx.GasStation"%>
<html>
	<head>
		<title>申请卡必要信息</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=yes">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<!-- Mobile IE allows us to activate ClearType technology for smoothing fonts for easy reading -->
		<meta http-equiv="cleartype" content="on">
		<link type="text/css" rel="stylesheet" href="${createLink(uri: '/css/weixin-mobile.css')}" />
	</head>
	<body>
	<g:form method="post" action="saveEditCard">
	<g:hiddenField name="verifyCode" value="${verifyCode }"/>
		<div class="x-form-fieldset-inner">
			<div class="x-field" >
				<div class="x-form-label"  style="width: 30% !important;">
					<span>姓名：</span>
				</div>
				<div class="x-component-outer" style="width: 70% !important;">
					<div class="x-field-input" >
						<g:textField name="holderName" value="${card?.holderName }"/>
					</div>
				</div>
			</div>
			<div class="x-field" >
				<div class="x-form-label"  style="width: 30% !important;">
					<span>身份证号码：</span>
				</div>
				<div class="x-component-outer" style="width: 70% !important;">
					<div class="x-field-input" >
						<g:textField name="holderSId" value="${card?.holderSId }"/>
					</div>
				</div>
			</div>
			<div class="x-field" >
				<div class="x-form-label"  style="width: 30% !important;">
					<span>卡号：</span>
				</div>
				<div class="x-component-outer" style="width: 70% !important;">
					<div class="x-field-input" >
						<g:textField name="cardNo" value="${card?.cardNo }"/>
					</div>
				</div>
			</div>
			<p class="alignCenter" >
				<g:submitButton name="submit" value="提交"/>
			</p>
		</div>
	</g:form>
	</body>
</html>
