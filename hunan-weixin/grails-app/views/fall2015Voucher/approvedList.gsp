
<%@page import="com.surelution.wxmp.jx.SubscriberAddress"%>
<%@page import="com.surelution.wxmp.jx.Fall2015DrawPrizeTicket"%>
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.wxmp.jx.Fall2015Voucher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fall2015Voucher.label', default: 'Fall2015Voucher')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-fall2015Voucher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-fall2015Voucher" class="content scaffold-create">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${fall2015VoucherInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${fall2015VoucherInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form controller="fall2015Voucher" action="changeToDeliveied">
			<table>
				<thead>
					<tr>
					
						<th>&nbsp;</th>
					
						<th><g:message code="fall2015Voucher.owner.label" default="Owner" /></th>
					
						<th>编号</th>
						
						<th>礼品类型</th>
						
						<th>姓名</th>
						
						<th>电话</th>
						
						<th>地区</th>
						
						<th>地址</th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${vouchers}" status="i" var="fall2015VoucherInstance">
				<g:set var="ui" value="${UserInfo.loadUserInfo(fall2015VoucherInstance.owner.openId) }"/>
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<g:set var="address" value="${SubscriberAddress.findBySubscriber(fall2015VoucherInstance.owner) }"/>
					
						<td><g:checkBox name="voucherId" checked="true" value="${fall2015VoucherInstance.id }"/></td>
						<td>${ui.nickname }</td>
					
						<td>${fieldValue(bean: fall2015VoucherInstance, field: "fullSn")}</td>
					
						<td>${fall2015VoucherInstance.batch.name}</td>
						<td>${address.linkMan }</td>
						<td>${address.tel }</td>
						
						<td>${address.branch.name }</td>
						<td>${address.address }</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<fieldset class="buttons">
				<g:submitButton name="change" value="确认发货，导出地址列表" onclick="return confirm('确认发货吗？确认后会转到导出地址列表页面');"/>
			</fieldset>
			</g:form>
		</div>
	</body>
</html>
