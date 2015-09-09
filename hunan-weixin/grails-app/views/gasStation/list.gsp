
<%@page import="com.surelution.wxmp.jx.District"%>
<%@page import="com.surelution.wxmp.jx.Branch"%>
<%@page import="com.surelution.wxmp.jx.GasStation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gasStation.label', default: 'GasStation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript library="jquery" />

		<script type="text/javascript">
		$(document).ready(function () {
		    $('#branch').change(function () {
		    	$('#district').empty()
		    	$('#stationOfFetch').empty()
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
			    	$('#stationOfFetch').empty()
			    	$.each(data, function(i,obj) {
			    		var o = '<option value="' + obj.id + '">' + obj.name + '</option>'
			    		$('#stationOfFetch').append(o);
				    	})
			    	 
    			})
		    })
		});
		
		</script>
	</head>
	<body>
		<a href="#list-gasStation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-gasStation" role="main">
			<h1>加油站管理</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${gasStationInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${gasStationInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="list" >
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: gasStationInstance, field: 'district', 'error')} required">
						<label for="district">
							分公司
						</label>
						<g:if test="${branch}">
							${branch.name }
							<g:set var="districts" value="${District.findAllByBranch(branch)}"/>
						</g:if>
						<g:else>
							<g:select id="branch" name="branch.id" from="${branches}" optionKey="id" optionValue="name" value="${params['branch.id'] }" noSelection="${['null':'-分公司-'] }" class="many-to-one"/>
						</g:else>
					</div>
					<div class="fieldcontain ${hasErrors(bean: gasStationInstance, field: 'district', 'error')} required">
						<label for="district">
							<g:message code="gasStation.district.label" default="District" />
							<span class="required-indicator">*</span>
						</label>
						<g:if test="${params['branch.id'] }">
							<g:set var="districts" value="${District.findAllByBranch(Branch.get(params['branch.id'])) }"/>
						</g:if>
						<g:select id="district" name="district.id" from="${districts}" optionKey="id" optionValue="name" value="${params['district.id'] }" class="many-to-one"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="search" value="查询" />
				</fieldset>
			</g:form>
		</div>
		<div id="list-gasStation" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'gasStation.name.label', default: 'Name')}" />
						
						<g:sortableColumn property="linkMan" title="${message(code: 'gasStation.linkMan.label', default: 'Link Man')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'gasStation.address.label', default: 'Address')}" />
					
						<th><g:message code="gasStation.branch.label" default="Branch" /></th>
					
						<g:sortableColumn property="latitude" title="${message(code: 'gasStation.latitude.label', default: 'Latitude')}" />
					
						<g:sortableColumn property="longitude" title="${message(code: 'gasStation.longitude.label', default: 'Longitude')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gasStationInstanceList}" status="i" var="gasStationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${gasStationInstance.id}">${fieldValue(bean: gasStationInstance, field: "name")}</g:link></td>
						
						<td>${fieldValue(bean: gasStationInstance, field: "linkMan")}</td>
					
						<td>${fieldValue(bean: gasStationInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: gasStationInstance, field: "district.name")}</td>
					
						<td>${gasStationInstance.latitude}</td>
					
						<td>${gasStationInstance.longitude}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gasStationInstanceTotal}" params="${params }"/>
			</div>
		</div>
	</body>
</html>
