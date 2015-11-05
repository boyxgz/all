<%@ page import="com.surelution.zjolap.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title>修改密码</title>
	</head>
	<body>
		<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
		</div>
		<div id="edit-user" class="content scaffold-edit" role="main">
			<h1>修改密码</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${userInstance?.id}" />
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
						<label for="password">
							原密码：
							<span class="required-indicator">*</span>
						</label>
						<g:passwordField name="password" required=""/>
					</div>
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'newPw1', 'error')} required">
						<label for="pw1">
							新密码：
							<span class="required-indicator">*</span>
						</label>
						<g:passwordField name="newPw1" required=""/>
					</div>
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'newPw2', 'error')} required">
						<label for="pw2">
							确认密码：
							<span class="required-indicator">*</span>
						</label>
						<g:passwordField name="newPw2" required=""/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="changePw" value="修改" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
