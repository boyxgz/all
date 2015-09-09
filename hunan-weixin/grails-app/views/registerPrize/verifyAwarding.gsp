
<%@ page import="com.surelution.wxmp.jx.RegisterPrize" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>兑奖</title>
		<script type="text/javascript">
			function awarding() {
				if(confirm("确定为这位客户兑付奖品?")) {
					document.location.href = "${createLink(action:"awarding") }?verifyCode=${rp?.verifyCode}";
				}
			}
		</script>
	</head>
	<body>
		<a href="#list-registerPrize" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<g:if test="${rp }">
			<g:if test="${rp.awardedBy }">
				本兑奖码${rp.verifyCode }已于${formatDate(date:rp.awardedAt, format:"yyyy-MM-dd") }兑奖，兑奖人是${rp.awardedBy.username }<br>
				<a href='${createLink(action:"showAwarding") }'>返回兑奖码录入</a></li>
			</g:if>
			<g:else>
				兑奖码有效，可以兑奖。<br>
				<li><a href="javascript:awarding();">为该客户兑付奖品</a></li>
				<li><a href='${createLink(action:"showAwarding") }'>返回兑奖码录入</a></li>
			</g:else>
		</g:if>
		<g:else>
			兑奖码无效，请<a href='${createLink(action:"showAwarding") }'>返回重新输入！</a>
		</g:else>
	</body>
</html>
