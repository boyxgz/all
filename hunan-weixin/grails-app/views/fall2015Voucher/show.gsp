
<%@page import="com.surelution.wxmp.jx.SubscriberAddress"%>
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.wxmp.jx.Fall2015Voucher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fall2015Voucher.label', default: 'Fall2015Voucher')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-fall2015Voucher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="show-fall2015Voucher" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list fall2015Voucher">
			
				
				<g:if test="${fall2015VoucherInstance?.paiedAt}">
				<li class="fieldcontain">
					<span id="paiedAt-label" class="property-label"><g:message code="fall2015Voucher.paiedAt.label" default="Paied At" /></span>
					
						<span class="property-value" aria-labelledby="paiedAt-label"><g:formatDate date="${fall2015VoucherInstance?.paiedAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015VoucherInstance?.whoPaied}">
				<li class="fieldcontain">
					<span id="whoPaied-label" class="property-label"><g:message code="fall2015Voucher.whoPaied.label" default="Who Paied" /></span>
					
						<span class="property-value" aria-labelledby="whoPaied-label"><g:link controller="user" action="show" id="${fall2015VoucherInstance?.whoPaied?.id}">${fall2015VoucherInstance?.whoPaied?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:set var="ui" value="${UserInfo.loadUserInfo(fall2015VoucherInstance.owner.openId) }"/>
				<g:if test="${fall2015VoucherInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="fall2015Voucher.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label">
						<img src="${ui.headImgUrl }" width="64" height="64"><br/>
						${ui.nickname }
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015VoucherInstance?.fullSn}">
				<li class="fieldcontain">
					<span id="fullSn-label" class="property-label"><g:message code="fall2015Voucher.fullSn.label" default="Full Sn" /></span>
					
						<span class="property-value" aria-labelledby="fullSn-label"><g:fieldValue bean="${fall2015VoucherInstance}" field="fullSn"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015VoucherInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="fall2015Voucher.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${fall2015VoucherInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015VoucherInstance?.batch}">
				<li class="fieldcontain">
					<span id="batch-label" class="property-label"><g:message code="fall2015Voucher.batch.label" default="Batch" /></span>
					
						<span class="property-value" aria-labelledby="batch-label">${fall2015VoucherInstance?.batch?.name}</span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015VoucherInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="fall2015Voucher.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${fall2015VoucherInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015VoucherInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="fall2015Voucher.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${fall2015VoucherInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015VoucherInstance?.reviewStatus}">
				<li class="fieldcontain">
					<span id="reviewStatus-label" class="property-label"><g:message code="fall2015Voucher.reviewStatus.label" default="Review Status" /></span>
					
						<span class="property-value" aria-labelledby="reviewStatus-label"><g:fieldValue bean="${fall2015VoucherInstance}" field="reviewStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015VoucherInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="fall2015Voucher.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${fall2015VoucherInstance}" field="status"/></span>
					
				</li>
				</g:if>
				
				
				<g:set var="address" value="${SubscriberAddress.findBySubscriber(fall2015VoucherInstance.owner) }"/>
				<g:if test="${address }">
				<li class="fieldcontain">
					<span id="address-label" class="property-label">地址</span>
					
					<span class="property-value" aria-labelledby="status-label">
						所在地区:${address.branch.name }<br/>
						详细地址:${address.address }<br/>
						姓名:${address.linkMan }<br/>
						联系方式:${address.tel }
					</span>
					
				</li>
				</g:if>
			
				<g:if test="${fall2015VoucherInstance?.ticket}">
				<li class="fieldcontain">
					<span id="ticket-label" class="property-label"><g:message code="fall2015Voucher.ticket.label" default="Ticket" /></span>
					<g:set var="receipt" value="${fall2015VoucherInstance?.ticket?.freceipt}"/>
					<span class="property-value" aria-labelledby="ticket-label">
						卡号:${receipt.cardNo }<br/>
						充值金额:${receipt.amount }<br/>
						充值小票照片:<img alt="" src="${createLink(controller:'fall2015Voucher', action:'receiptPic', id:receipt.id) }"><br/>
					</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${fall2015VoucherInstance?.id}" />
					<g:link class="edit" action="approve" id="${fall2015VoucherInstance?.id}">审核通过</g:link>
					<g:actionSubmit class="delete" action="reject" value="审核拒绝" onclick="return confirm('确定审核拒绝吗？操作不可返回，且该用户不能参加本活动');" />
					<g:actionSubmit class="delete" action="changeAddress" value="退回补充联系人信息" onclick="return confirm('确定退回补充联系人信息吗？操作后，用户收到消息修改地址信息');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
