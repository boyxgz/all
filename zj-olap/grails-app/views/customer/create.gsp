<%@ page import="com.surelution.zjolap.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		
		<script type="text/javascript" charset="utf-8">
			function addFileUpload() {
				 var div = document.getElementById("divFiles");
				 var file = document.createElement("input");
				 var br = document.createElement("br");
					file.type='file';
					file.name = "file"+((Math.random()*(10000-100)+100));
					div.appendChild(file);
					div.appendChild(br);
			}
		</script>
	</head>
	<body>
		<a href="#create-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}" target='_blank'><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="list" action="list" target='_blank'><g:message code="default.list.label" args="[entityName]" /></g:link></span>
		</div>
		<div id="create-customer" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${customerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${customerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:uploadForm action="save" >
				<fieldset class="form">
					<g:render template="form"/>
					
					
					<div>
						<label for="license">
							  附件：
						</label>
					
					    <input type="button" value='增加附件' id="btnAddFile" onclick="addFileUpload()"/>
					     <div id='divFiles'>
					     
					     </div>
					   </div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					<g:actionSubmit name="create" action="saveD" class="save" value="临时保存" />
				</fieldset>
			</g:uploadForm>
		</div>
	</body>
</html>
