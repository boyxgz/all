
<%@ page import="com.surelution.zjolap.Customer" %>
<%@ page import="com.surelution.zjolap.FileUpload" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}" target='_blank'><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="list" action="list" target='_blank'><g:message code="default.list.label" args="[entityName]" /></g:link></span>
			<span class="menuButton"><g:link class="create" action="create" target='_blank'><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div id="show-customer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="dialog">
				<table>
	                    <tbody>
	                    	<tr class="prop">
	                            <td valign="top" class="name"><g:message code="customer.id.label" default="Id" /></td>
	                            
	                            <td valign="top" class="value">${customerInstance?.id}</td>
	                            
	                        </tr>
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="customer.name.label" default="name" /></td>
	                            
	                            <td valign="top" class="value"><g:fieldValue bean="${customerInstance}" field="name"/></td>
	                            
	                        </tr>
	                         <tr class="prop">
	                            <td valign="top" class="name"><g:message code="customer.tel.label" default="name" /></td>
	                            
	                            <td valign="top" class="value"><g:fieldValue bean="${customerInstance}" field="tel"/></td>
	                            
	                        </tr>
	                        
	                         <tr class="prop">
	                            <td valign="top" class="name"><g:message code="customer.address.label" default="name" /></td>
	                            
	                            <td valign="top" class="value"><g:fieldValue bean="${customerInstance}" field="address"/></td>
	                            
	                        </tr>
	                     
	                        
	                         <tr class="prop">
	                            <td valign="top" class="name"><g:message code="customer.license.label" default="license" /></td>
	                            
	                            <td valign="top" class="value"><g:fieldValue bean="${customerInstance}" field="license"/></td>
	                        </tr>
	                         <tr class="prop">
	                            <td valign="top" class="name"><g:message code="customer.licensePicUrl.label" default="license" /></td>
	                            
	                            <td valign="top" class="value">
	                            	<g:if test="${customerInstance?.licensePicUrl }"><img src="${resource(dir:'dynImage/file/')}${customerInstance?.licensePicUrl?.id }" width="400" height="400"/></g:if>
	                            	&nbsp;
	                            	</td>
	                        </tr>
	                        
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="customer.customerType.label" default="customerType" /></td>
	                            
	                            <td valign="top" class="value">${customerInstance?.customerType?.name}</td>
	                        </tr>
	                	</tbody>
	        
	                </table>
	                
	                <table>
				<thead>
					<tr>
					   <th>文件名</th>
	                   <th>时间</th>
	                   		     
					    <th>操作</th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${files}" status="i" var="fileUploadInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
					
						<td>${fieldValue(bean: fileUploadInstance, field: "fileName")}</td>
					
						<td><g:formatDate date="${fileUploadInstance.uploadDate}" /></td>
					
						
						<td>
						    <g:form controller="fileUpload" >
							<g:hiddenField name="id" value="${fileUploadInstance?.id}" />
							<g:actionSubmit class="create" action="downFile" value="下载"   />
					     </g:form>
						    
						 </td>
						
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
	                
			</div>
			<g:if test="${editable}">
			<g:form>
							<fieldset class="buttons">
					<g:hiddenField name="id" value="${customerInstance?.id}" />
					<g:actionSubmit class="edit" action="edit" value="${message(code:'default.button.edit.label', default:'Edit')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			</g:if>
		</div>
	</body>
</html>
