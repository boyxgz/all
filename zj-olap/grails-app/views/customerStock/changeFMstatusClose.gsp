<%@ page import="com.surelution.zjolap.SalesOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require module="jquery-ui"/>
		<title><g:message code="changeFMstatusClose.label" /></title>
		<script type="text/javascript">
			  $(document).ready(function() {
		          $("#fmBranch").change(loadData);
		          
		          $("#fmYear").change(loadData);
		          loadData();
		        })

		        function loadData() {
		        	  var year =  $(this).children('option:selected').val();
			          var branchId =  $("#fmBranch").children('option:selected').val();
			         $('#fmClosed').empty();
			        //  $('#fmOpened').empty();
			          if(year && branchId) {
			          $.ajax({
			        	     url:'${createLink(uri:'/customerStock/findFM')}',
							dataType:"json",
							data:{year:year,branchId:branchId},
							success:function(data) {
								var closeHtml = "";
								var openHtml ="";
		                         $.each(data, function(commentIndex, comment){
										  if(comment.isClosed) {
			                             	 closeHtml +="<option value='"+ comment.month +"'>"+comment.month+"</option>";
										  }else {
											  openHtml +="<option value='"+ comment.month +"'>"+comment.month+"</option>";
										  }
			                         });
								// $('#fmClosed').html(closeHtml);
								$('#fmOpened').html(openHtml);
							}
				          });
			          }
		          }
				

		</script>
	</head>
	<body>
		<a href="#create-salesOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
		</div>
		<div id="create-salesOrder" class="content scaffold-create" role="main">
			<h1><g:message code="changeFMstatusClose.label" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${salesOrderInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${salesOrderInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="changeFMstatus">
					<fieldset class="form">
						<div class="fieldcontain">
							
							<label for="fmBranch">
								<g:message code="salesOrder.branch.label" default="Branch" />
							</label>
							<g:select id="fmBranch" name="fmBranch" value="${params.fmBranch}" from="${com.surelution.zjolap.Branch.list()}" noSelection="['':'所有公司']" optionKey="id" optionValue="name"  class="many-to-one"/>
							
							
							<label for="fmYear">
								年份
							</label>
							<g:select id="fmYear" name="fmYear" value="${params.fmYear}" from="${com.surelution.zjolap.FinancialMonth.getDistinctYear()}" noSelection="['':'全部']" optionKey="year" optionValue="year"  class="many-to-one"/><%--
							
							
							<label for="fmClosed">
								已经关闭的账期
							</label>
							<select name="fmClosed" id="fmClosed">
							
							</select>
							
							--%><label for="fmOpened">
								可以关闭的账期
							</label>
							<select name="fmOpened" id="fmOpened">
							
							</select>
							
							<g:submitButton name='closeBtn'  value="关闭账期" />
						   <%--<g:submitButton name='openBtn' value="开启账期" />
						--%></div>
						</fieldset>
					
					
				</g:form>
		</div>
	</body>
</html>
