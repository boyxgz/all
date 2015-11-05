
<%@page import="com.surelution.zjolap.Branch"%>
<%@ page import="com.surelution.zjolap.ExcelUpload" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'excelUpload.label', default: 'ExcelUpload')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript" src="${resource(file:'js/jquery-1.11.3.min.js') }"></script>
		<script type="text/javascript">
			function deleteItem(itemId) {
				if(confirm('如果确定删除，系统可能需要执行较长时间，请耐心等候后续提示！确定删除？')) {
					$.ajax({
						  method: "POST",
						  url: "${createLink(controller:'excelUpload', action:'delete')}/" + itemId
						})
						  .done(function( data ) {
							  alert(data.msg);
							  if(data.succeed) {
								  document.location.reload(true);
							  }
						  });
				}
			}
		</script>
	</head>
	<body>
		<a href="#list-excelUpload" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="create" action="createSalesOrder"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div id="create-salesOrder" class="scaffold-create" role="main">
			<g:form action="list" >
				<fieldset class="form">
				<g:if test="${branches}">
					<div class="fieldcontain ">
						<label for="branch">
							 分公司
						</label>
						<g:select name="branch" from="${branches}" optionKey="id" optionValue="name" noSelection="${['':''] }" value="${branch?.id }"/>
					</div>
					</g:if>
					<div class="fieldcontain ">
						<label for="financialMonth_Year">
							 结算年/月
						</label>
						 年:<g:select name="financialMonth_Year" from="${['','2013','2014','2015','2016','2017']}" value="${params.financialMonth_Year}" class="many-to-one"/>
   						月:<g:select name="financialMonth_Month" from="${['','1','2','3','4','5','6','7','8','9','10','11','12']}"  value="${params.financialMonth_Month}" class="many-to-one"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="search" class="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
				</fieldset>
			</g:form>
		</div>
		<div id="list-excelUpload" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="deleted" title="${message(code: 'excelUpload.deleted.label', default: 'Deleted')}" params="${params}"/>
					
						<%--
						<g:sortableColumn property="filePath" title="${message(code: 'excelUpload.filePath.label', default: 'File Path')}" />
					
						<g:sortableColumn property="originalFileName" title="${message(code: 'excelUpload.originalFileName.label', default: 'Original File Name')}" />
						--%>
						<g:sortableColumn property="user" title="${message(code: 'excelUpload.branch.label', default: 'Branch')}" params="${params}"/>
						<g:sortableColumn property="month" title="${message(code: 'excelUpload.month.label', default: '账期')}" params="${params}" />
						<g:sortableColumn property="user" title="${message(code: 'excelUpload.user.label', default: 'User')}" params="${params}"/>
						<g:sortableColumn property="uploadedAt" title="${message(code: 'excelUpload.uploadedAt.label', default: 'Uploaded At')}" params="${params}"/>
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
					
						<td>${fieldValue(bean: excelUploadInstance, field: "originalFileName")}</td>
						--%>
					
					
						<g:if test="${excelUploadInstance?.user?.branch}">
							<td>${excelUploadInstance?.user?.branch?.name} </td>
						</g:if>
						<g:else>
							<td>总公司</td>
						</g:else>
						<td>${excelUploadInstance?.month?.year}-${excelUploadInstance?.month?.month} </td>
						<td>${excelUploadInstance?.user?.username} </td>
						
						<td><g:formatDate date="${excelUploadInstance.uploadedAt}" /></td>
						<td>
						  <g:form controller="excelUpload" >
							<g:hiddenField name="id" value="${excelUploadInstance?.id}" />
							<g:actionSubmit class="create" action="downFile" value="下载"   />
					     </g:form>
						</td>
						<sec:ifAnyGranted roles="ROLE_ADMIN">
					    <td>
					        <g:if test="${!excelUploadInstance.deleted}">
					        <input type="button" onclick="deleteItem('${excelUploadInstance?.id}')" value="${message(code: 'default.button.delete.label', default: 'Delete')}"/>
					        </g:if>
					    </td>
					    </sec:ifAnyGranted>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="paginateButtons">
				<g:paginate total="${excelUploadInstanceTotal}" params="${params}" />
			</div>
		</div>
	</body>
</html>
