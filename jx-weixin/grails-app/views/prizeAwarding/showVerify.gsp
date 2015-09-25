
<%@ page import="com.surelution.wxmp.jx.PrizeAwarding" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'prizeAwarding.label', default: 'PrizeAwarding')}" />
		<title>兑奖模块</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link href="${resource(dir:'css/bootstrap.min.css')}" rel="stylesheet" media="screen">
		<script type="text/javascript" src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
	</head>
	<body>
		<div id="info" >
			<g:form action="showVerify">
				兑奖码：<g:textField name="verifyCode" value="${ verifyCode}"/><g:actionSubmit value="验证" action="showVerify"/><br/>
				<g:if test="${paInstance}">
					<g:hiddenField name="id" value="${paInstance.id }"/>
					上传图片:<img src="${resource(dir:'dynImage/file') }/${paInstance.picture.id}" alt="上传图片" width="240" height="320"/>
					<br>
					<g:if test="${paInstance.status.code==com.surelution.wxmp.jx.AwardingStatus.DRAWN }">
						奖品名称:${paInstance?.prize?.name}<br/>
						<br/>
						<g:actionSubmit action="verify" value="发奖"/><br/>
						<g:actionSubmit action="rejecting" value="图片不符，拒发"/>
					</g:if>
					<g:if test="${paInstance.status.code==com.surelution.wxmp.jx.AwardingStatus.NEW }">
						该客人已经上传图片，尚未自行抽奖，请指导客人先完成抽奖
					</g:if>
					<g:if test="${paInstance.status.code==com.surelution.wxmp.jx.AwardingStatus.AWARDED }">
						奖品已发放，发奖人是${paInstance.awardedBy }，奖品是${paInstance.prize.name }，发奖时间：${paInstance.awardedAt }
					</g:if>
					<g:if test="${paInstance.status.code==com.surelution.wxmp.jx.AwardingStatus.REJECTED }">
						图片不符，拒发
					</g:if>
					
				</g:if>
			</g:form>
		</div>
		<br>
		<table border="1" cellpadding="1" cellspacing="0" bordercolor="#000000">
			<tr>
				<td>奖品</td>
				<td>兑奖人</td>
				<td>兑奖时间</td>
				<td>图片上传时间</td>
				<td>兑奖码</td>
				<td>兑奖状态</td>
				<td>上传图片</td>
			</tr>
			<g:each in="${history }" var="h">
			<tr>
				<td>${h.prize.name }</td>
				<td>${h.awardedBy }</td>
				<td><g:formatDate date="${h.awardedAt }" format="yyyy-MM-dd HH:mm"/></td>
				<td><g:formatDate date="${h.createdAt }" format="yyyy-MM-dd HH:mm"/></td>
				<td>${h.verifyCode }</td>
				<td>${h.status.title }</td>
				<td><img src="${resource(dir:'dynImage/file') }/${h.picture.id}" width="240" height="320"/></td>
			</tr>
				
			</g:each>
		</table>
	</body>
</html>
