
<%@ page import="com.surelution.zjolap.FileUpload" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fileUpload.label', default: 'FileUpload')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-fileUpload" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="create" action="create" params="${[fromID:params.fromID,useOpter:params.useOpter]}"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div id="list-fileUpload" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
					
						<%--<g:sortableColumn property="fileName" title="${message(code: 'fileUpload.fileName.label', default: 'File Name')}"  params="${params}"/>
					
						<g:sortableColumn property="fileUUID" title="${message(code: 'fileUpload.fileUUID.label', default: 'File UUID')}" params="${params}"/>
					
						<g:sortableColumn property="fileUrl" title="${message(code: 'fileUpload.fileUrl.label', default: 'File Url')}"  params="${params}"/>
					
						<g:sortableColumn property="uploadDate" title="${message(code: 'fileUpload.uploadDate.label', default: 'Upload Date')}" params="${params}"/>
					
						<g:sortableColumn property="useOpter" title="${message(code: 'fileUpload.useOpter.label', default: 'Use Opter')}" params="${params}"/>
					     
					    --%>
					   <th>文件名</th>
	                   <th>时间</th>
					   <th colspan="2">操作</th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${fileUploadInstanceList}" status="i" var="fileUploadInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
					
						<td>${fieldValue(bean: fileUploadInstance, field: "fileName")}</td>
					
						<%--<td>${fieldValue(bean: fileUploadInstance, field: "fileUUID")}</td>
					
						<td>${fieldValue(bean: fileUploadInstance, field: "fileUrl")}</td>
					
						--%><td><g:formatDate date="${fileUploadInstance.uploadDate}" /></td><%--
					
						<td>${fieldValue(bean: fileUploadInstance, field: "useOpter")}</td>
						
						--%><td>
						    <g:form>
							<g:hiddenField name="id" value="${fileUploadInstance?.id}" />
							<g:actionSubmit class="create" action="downFile" value="下载"   />
					     </g:form>
						    
						 </td>
						<td>
						<g:form>
							<g:hiddenField name="id" value="${fileUploadInstance?.id}" />
							<g:actionSubmit class="create" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					     </g:form>
						</td>
						
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fileUploadInstanceTotal}" params="${params}"/>
			</div>
		</div>
	</body>
</html>
