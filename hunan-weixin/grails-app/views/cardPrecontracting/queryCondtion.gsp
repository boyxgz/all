
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.surelution.wxmp.jx.CardPrecontracting" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cardPrecontracting.label', default: 'CardPrecontracting')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		
	     <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script> 

	</head>
	<body>
		<a href="#list-cardPrecontracting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cardPrecontracting" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status" >${flash.message}</div>
			</g:if>
			
			    <g:form action="queryCondtion">
			    <div class="x-component-outer" style="width: 70% !important;">
					  开始日期： <g:datePicker name="beginDate" precision="day"  value="${params['beginDate']}"/>
					   结束日期： <g:datePicker name="endDate" precision="day"   value="${params['endDate']}"/><br>
					站点：	<g:select id="stationOfFetch" name="stationOfFetchId" value="${params['stationOfFetchId']}" from="${com.surelution.wxmp.petrozj.GasStation.list()}" optionKey="id" optionValue="name"  />
						
	 					<g:submitButton name="submit"  value="查询"/>
				</div>
				</g:form>
				<div id="message"></div>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dateOfFetch" title="${message(code: 'cardPrecontracting.dateOfFetch.label', default: 'Date Of Fetch')}" params="${params}" />
					
						<g:sortableColumn property="precontractingDate" title="${message(code: 'cardPrecontracting.precontractingDate.label', default: 'Precontracting Date')}" params="${params}" />
					
						<g:sortableColumn property="remark" title="${message(code: 'cardPrecontracting.remark.label', default: 'Remark')}" params="${params}"  />
					
						<th><g:message code="cardPrecontracting.stationOfFetch.label" default="Station Of Fetch" /></th>
					
						<th><g:message code="cardPrecontracting.subscriber.label" default="Subscriber" /></th>
						
						<th colspan="2"><g:message code="cardPrecontracting.Status.label" default="Status" /></th>
					
					</tr>
				</thead>
				<tbody>
				
				<g:each in="${cardPrecontractingInstanceList}" status="i" var="cardPrecontractingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cardPrecontractingInstance.id}"><g:formatDate format="yyyy-MM-dd" date="${cardPrecontractingInstance?.dateOfFetch}"  /></g:link></td>
					
						<td><g:formatDate format="yyyy-MM-dd" date="${cardPrecontractingInstance?.precontractingDate}"  /></td>
					
						<td>${fieldValue(bean: cardPrecontractingInstance, field: "remark")}</td>
					
						<td>${cardPrecontractingInstance.stationOfFetch?.name} </td>
					
						<td>${cardPrecontractingInstance.subscriber?.openId}</td>
						
						<td id="${'status'+cardPrecontractingInstance.id}">${cardPrecontractingInstance?.status}</td>
						<td>
						   <g:remoteLink  action="updateStatus" params="${[id:cardPrecontractingInstance.id,status:"无效"]}" update="${'status'+cardPrecontractingInstance.id}">无效</g:remoteLink>
						   <g:remoteLink  action="updateStatus" params="${[id:cardPrecontractingInstance.id,status:"有效"]}" update="${'status'+cardPrecontractingInstance.id}">有效</g:remoteLink>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cardPrecontractingInstanceTotal}" params="${params}"   />
			</div>
		</div>
	</body>
</html>
