<%@ page import="com.surelution.wxmp.jx.HorseGiftApply" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'horseGiftApply.label', default: 'HorseGiftApply')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-horseGiftApply" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="edit-horseGiftApply" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${horseGiftApplyInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${horseGiftApplyInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" action="showPay">
				<g:hiddenField name="id" value="${apply?.id}" />
				<g:hiddenField name="version" value="${apply?.version}" />
				<fieldset class="form">
					<div class="fieldcontain  required">
						<label for="verifyCode">
							<g:message code="horseGiftApply.verifyCode.label" default="Verify Code" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="verifyCode" value="${apply?.verifyCode }"/>
					</div>
					<g:if test="${apply}">
					<ol class="property-list horseGiftApply">
						<g:if test="${apply.giftType == HorseGiftApply.GiftType.OLD_CARD }">
							<li class="fieldcontain">
								${HorseGiftApply.GiftType.OLD_CARD }
							</li>
							<li class="fieldcontain">
								<span id="status-label" class="property-label"><g:message code="gasCard.holderName.label" default="Holder Name" /></span>
								<span class="property-value" aria-labelledby="status-label">${apply.gasCard.holderName }</span>
							</li>
							<li class="fieldcontain">
								<span id="status-label" class="property-label"><g:message code="gasCard.holderSId.label" default="Holder Socail ID" /></span>
								<span class="property-value" aria-labelledby="status-label">${apply.gasCard.holderSId }</span>
							</li>
							<li class="fieldcontain">
								<span id="status-label" class="property-label"><g:message code="gasCard.cardNo.label" default="Card No" /></span>
								<span class="property-value" aria-labelledby="status-label">${apply.gasCard.cardNo }</span>
							</li>
						</g:if>
						<g:if test="${apply.giftType == HorseGiftApply.GiftType.APPLY_CARD }">
							<li class="fieldcontain">
								${HorseGiftApply.GiftType.APPLY_CARD }
							</li>
							<li class="fieldcontain">
								<span id="status-label" class="property-label"><g:message code="gasCardApply.holderName.label" default="Holder Name" /></span>
								<span class="property-value" aria-labelledby="status-label">${apply.gasCardApply.holderName }</span>
							</li>
							<li class="fieldcontain">
								<span id="status-label" class="property-label"><g:message code="gasCardApply.holderSId.label" default="Holder Socail ID" /></span>
								<span class="property-value" aria-labelledby="status-label">${apply.gasCardApply.holderSId }</span>
							</li>
							<li class="fieldcontain">
								<span id="status-label" class="property-label"><g:message code="gasCard.cardNo.label" default="Card No" /></span>
								<span class="property-value" aria-labelledby="status-label"><g:textField name="cardNo"/></span>
							</li>
						</g:if>
					</ol>
					</g:if>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="search" action="showPay" value="查看" />
					<g:if test="${apply }">
						<g:if test="${apply.giftType == HorseGiftApply.GiftType.APPLY_CARD }">
							<g:actionSubmit class="search" action="savePay" value="确认发放新卡" />
						</g:if>
						<g:if test="${apply.giftType == HorseGiftApply.GiftType.OLD_CARD }">
							<g:actionSubmit class="search" action="savePay" value="确认圈存" />
						</g:if>
					</g:if>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
