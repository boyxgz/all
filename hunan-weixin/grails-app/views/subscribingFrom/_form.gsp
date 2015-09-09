<%@ page import="com.surelution.wxmp.jx.SubscribingFrom" %>



<div class="fieldcontain ${hasErrors(bean: subscribingFromInstance, field: 'comeFrom', 'error')} ">
	<label for="comeFrom">
		<g:message code="subscribingFrom.comeFrom.label" default="Come From" />
		
	</label>
	<g:textField name="comeFrom" value="${subscribingFromInstance?.comeFrom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subscribingFromInstance, field: 'gasStation', 'error')} ">
	<label for="gasStation">
		<g:message code="subscribingFrom.gasStation.label" default="Gas Station" />
		
	</label>
	<g:select id="gasStation" name="gasStation.id" from="${com.surelution.wxmp.jx.GasStation.list()}" optionKey="id" optionValue="name" value="${subscribingFromInstance?.gasStation?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subscribingFromInstance, field: 'branch', 'error')}">
	<label for="branch">
		<g:message code="subscribingFrom.branch.label" default="Branch" />
	</label>
	<g:select id="branch" name="branch.id" from="${com.surelution.wxmp.jx.Branch.list()}" optionKey="id" required="" optionValue="name" value="${subscribingFromInstance?.branch?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subscribingFromInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="subscribingFrom.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${subscribingFromInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subscribingFromInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="subscribingFrom.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${subscribingFromInstance?.name}"/>
</div>

