<%@page import="com.surelution.wxmp.jx.Branch"%>
<%@ page import="com.surelution.wxmp.jx.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<script type="text/javascript" src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script> 
		<script type="text/javascript">
		$(document).ready(function () {
		    $('#branch').change(function () {
		    	$('#district').empty()
		    	$('#station').empty()
			    var branchId = $('#branch').val();
			    if(branchId) {
				    var url = "${createLink(uri: '/jsonData/district/')}" + branchId;
				    $.getJSON(url,{},function(data)
	    			{
				    	$.each(data, function(i,obj) {
				    		var o = '<option value="' + obj.id + '">' + obj.name + '</option>'
				    		$('#district').append(o);
					    	})
				    	 
	    			})
		    }
		    })
		    $('#district').change(function () {
			    var url = "${createLink(uri: '/jsonData/station/')}" + $('#district').val()
			    $.getJSON(url,{},function(data)
    			{
			    	$('#station').empty()
			    	$.each(data, function(i,obj) {
			    		var o = '<option value="' + obj.id + '">' + obj.name + '</option>'
			    		$('#station').append(o);
				    	})
			    	 
    			})
		    })
		});
		
		</script>
	</head>
	<body>
		<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-user" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form method="post" >
				<g:hiddenField name="user.id" value="${user.id}" />
				<g:hiddenField name="version" value="${user?.version}" />
				<fieldset class="form">
					<div class="fieldcontain">
					<label>用户名</label>
						${user.username }
					</div>
					<div class="fieldcontain">
						<label for="branch">
							分公司
						</label>
						<g:select name="branch" from="${Branch.findAllByParentIsNotNull() }" optionKey="id" optionValue="name" value="${userData?.gasStation?.district?.branch?.id }"/>
					</div>
					<div class="fieldcontain">
						<label for="district">
							区县
						</label>
						<g:select name="district" from="${districts }" optionKey="id" optionValue="name" value="${ userData?.gasStation?.district?.id}"/>
					</div>
					<div class="fieldcontain">
						<label for="station">
							加油站
						</label>
						<g:select id="station" name="gasStation.id" from="${gasStations }" optionKey="id" optionValue="name" value="${ userData?.gasStation?.id}"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="saveGasStation" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:link class="edit" action="show" id="${user?.id}">用户详情</g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
