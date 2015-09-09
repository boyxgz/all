
<%@ page import="com.surelution.wxmp.jx.WheelPrize" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wheelPrize.label', default: 'WheelPrize')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-wheelPrize" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-wheelPrize" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list wheelPrize">
			
				<g:if test="${wheelPrizeInstance?.seq}">
				<li class="fieldcontain">
					<span id="seq-label" class="property-label"><g:message code="wheelPrize.seq.label" default="Seq" /></span>
					
						<span class="property-value" aria-labelledby="seq-label"><g:fieldValue bean="${wheelPrizeInstance}" field="seq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wheelPrizeInstance?.prize}">
				<li class="fieldcontain">
					<span id="prize-label" class="property-label"><g:message code="wheelPrize.prize.label" default="Prize" /></span>
					
						<span class="property-value" aria-labelledby="prize-label"><g:link controller="prize" action="show" id="${wheelPrizeInstance?.prize?.id}">${wheelPrizeInstance?.prize?.name}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${wheelPrizeInstance?.id}" />
					<g:link class="edit" action="edit" id="${wheelPrizeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
