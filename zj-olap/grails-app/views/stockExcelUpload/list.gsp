
<%@ page import="com.surelution.zjolap.StockExcelUpload" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'excelUpload.label', default: 'ExcelUpload')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-excelUpload" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="create" action="initUploadExcel" controller="customerStock"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div id="list-excelUpload" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="deleted" title="${message(code: 'excelUpload.deleted.label', default: 'Deleted')}" />
					
						<g:sortableColumn property="originalFileName" title="${message(code: 'excelUpload.originalFileName.label', default: 'Original File Name')}" />
					
						<g:sortableColumn property="uploadedAt" title="${message(code: 'excelUpload.uploadedAt.label', default: 'Uploaded At')}" />
						<g:sortableColumn property="user" title="${message(code: 'excelUpload.branch.label', default: 'Branch')}" />
						<g:sortableColumn property="user" title="${message(code: 'excelUpload.user.label', default: 'User')}" />
						<th>下载</th>
						<sec:ifAnyGranted roles="ROLE_ADMIN">
						<th>删除（会删除账单）</th>
						</sec:ifAnyGranted>
					</tr>
				</thead>
				<tbody>
				<g:each in="${excelUploadInstanceList}" status="i" var="excelUploadInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:formatBoolean boolean="${excelUploadInstance.deleted}"/></td>
					
						<%--<td>${fieldValue(bean: excelUploadInstance, field: "filePath")}</td>
					
						--%><td>${fieldValue(bean: excelUploadInstance, field: "originalFileName")}</td>
					
						<td><g:formatDate date="${excelUploadInstance.uploadedAt}" /></td>
					
						<g:if test="${excelUploadInstance?.user?.branch}">
							<td>${excelUploadInstance?.user?.branch?.name} </td>
						</g:if>
						<g:else>
							<td>总公司</td>
						</g:else>
						<td>${excelUploadInstance?.user?.username} </td>
						<td>
						  <g:form controller="stockExcelUpload" >
							<g:hiddenField name="id" value="${excelUploadInstance?.id}" />
							<g:actionSubmit class="create" action="downFile" value="下载"   />
					     </g:form>
						</td>
						<sec:ifAnyGranted roles="ROLE_ADMIN">
					    <td>
					        <g:if test="${!excelUploadInstance.deleted}">
					          <g:form>
					         	 <g:hiddenField name="id" value="${excelUploadInstance?.id}" />
					         	 <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"    onclick="return confirm('确定删除？')"/>
					          </g:form>
					        </g:if>
					    </td>
					    </sec:ifAnyGranted>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="paginateButtons">
				<g:paginate total="${excelUploadInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
