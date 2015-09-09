
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
			<g:form action="list" >
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: fall2015VoucherInstance, field: 'reviewStatus', 'error')} required">
						<label for="reviewStatus">
							<g:message code="fall2015Voucher.reviewStatus.label" default="Review Status" />
							<span class="required-indicator">*</span>
						</label>
						<g:select name="reviewStatus" from="${com.surelution.wxmp.jx.Fall2015Voucher$ReviewStatus?.values()}" keys="${com.surelution.wxmp.jx.Fall2015Voucher$ReviewStatus.values()*.name()}" required="" value="${params.reviewStatus}"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="search" value="查询" />
				</fieldset>
			</g:form>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="fall2015Voucher.owner.label" default="Owner" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'fall2015Voucher.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="fullSn" title="${message(code: 'fall2015Voucher.fullSn.label', default: 'Full Sn')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'fall2015Voucher.batch.label', default: 'Amount')}" />
						
						<th>卡类型</th>
						
						<th>卡号</th>
						
						<th>状态</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fall2015VoucherInstanceList}" status="i" var="fall2015VoucherInstance">
				<g:set var="ui" value="${UserInfo.loadUserInfo(fall2015VoucherInstance.owner.openId) }"/>
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${fall2015VoucherInstance.id}" target="_blank">
						<img src="${ui.headImgUrl }" width="64" height="64"><br/>
						${ui.nickname }</g:link></td>
					
						<td>${fieldValue(bean: fall2015VoucherInstance, field: "dateCreated")}</td>
					
						<td>${fieldValue(bean: fall2015VoucherInstance, field: "fullSn")}</td>
					
						<td>${fall2015VoucherInstance.batch.name}</td>
						
						<td>${fall2015VoucherInstance.ticket.freceipt.cardType }</td>
						
						<td>
						<a href="${createLink(controller:'fall2015Voucher', action:'cardNo', id:fall2015VoucherInstance.ticket.freceipt.cardNo) }" target="_blank">${fall2015VoucherInstance.ticket.freceipt.cardNo }</a>
						</td>
						
						<td>${fall2015VoucherInstance.reviewStatus }</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fall2015VoucherInstanceTotal}" params="${params }"/>
			</div>
		</div>
	</body>
</html>
