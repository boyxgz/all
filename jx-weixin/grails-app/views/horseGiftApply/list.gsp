
<%@page import="com.surelution.wxmp.jx.GasCardApply"%>
<%@ page import="com.surelution.wxmp.jx.HorseGiftApply" %>
<%@ page import="com.surelution.wxmp.jx.GasCard" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'horseGiftApply.label', default: 'HorseGiftApply')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style type='text/css' media='screen'>
			#hoverNav {
				width: 480px;
			}
		</style>
		<resource:lightBox />
	</head>
	<body>
		<a href="#list-horseGiftApply" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<h1><g:message code="default.list.label" args="[entityName]" /></h1>
		<div id="list-horseGiftApply" class="dialog" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:form action="search" >
                <div class="dialog1">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    	选择审核状态
                                </td>
                                <td valign="top" class="value">
                                	<g:select name="status" from="${com.surelution.wxmp.jx.HorseGiftApply.ApplyStatus.values()}" noSelection='${["":"全部"] }' keys="${com.surelution.wxmp.jx.HorseGiftApply.ApplyStatus.values()*.name()}" value="${params['status'] }"/>
                                	<g:submitButton name="search" class="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                                </td>
                            </tr>
                         </tbody>
                   </table>
            	</div>
             </g:form>
			
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="status" title="${message(code: 'horseGiftApply.status.label', default: 'Status')}" />
					
						<th style="width:50px;"><g:message code="horseGiftApply.subscriber.label" default="Subscriber" /></th>
					
						<th><g:message code="horseGiftApply.uploading.label" default="Uploading" /></th>
						
						<th>卡信息</th>
					
						<th style="width:80px;"><g:message code="horseGiftApply.use.label" default="use" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${horseGiftApplyInstanceList}" status="i" var="horseGiftApplyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td style="width:100px;"><g:link action="show" id="${horseGiftApplyInstance.id}">${fieldValue(bean: horseGiftApplyInstance, field: "status")}</g:link></td>
					
						<td>${horseGiftApplyInstance.subscriber.id}</td>
						<td><richui:lightBox href="${horseGiftApplyInstance.uploading.pictureUrl}" style="width:480px;"><img src='${horseGiftApplyInstance.uploading.pictureUrl}' width="120" height="200"/></richui:lightBox></td>
						
						<td>
							<%
								if(horseGiftApplyInstance.giftType == HorseGiftApply.GiftType.APPLY_CARD) {
									def gsa = horseGiftApplyInstance.gasCardApply
							%>
						<table>
							<tr>
								<td colspan="2" class="statusStyle">新办卡</td>
							</tr>
							<tr>
								<td align="right">姓名：</td>
								<td>${gsa.holderName}</td>
							</tr>
							<tr>
								<td align="right">身份证号：</td>
								<td>${gsa.holderSId}</td>
							</tr>
						</table>
							<%
								} else if(horseGiftApplyInstance.giftType == HorseGiftApply.GiftType.OLD_CARD) {
									def gc = horseGiftApplyInstance.gasCard
							%>
							<table>
								<tr>
									<td colspan="2" class="statusStyle">已持卡</td>
								</tr>
								<tr>
									<td align="right">姓名：</td>
									<td>${gc?.holderName}</td>
								</tr>
								<tr>
									<td align="right">身份证号：</td>
									<td>${gc?.holderSId}</td>
								</tr>
								<tr>
									<td>卡号：</td>
									<td>${gc?.cardNo}</td>
								</tr>
							</table>
							<%
								}
							 %>
						</td>
					
						<td style="width:200px;text-align:left;"><g:form method="post" >
							<g:hiddenField name="id" value="${horseGiftApplyInstance?.id}" />
							<g:hiddenField name="version" value="${horseGiftApplyInstance?.version}" />
								<g:if test="${horseGiftApplyInstance.status == HorseGiftApply.ApplyStatus.UNLUCKLY || horseGiftApplyInstance.status == HorseGiftApply.ApplyStatus.APPROVED ||horseGiftApplyInstance.status == HorseGiftApply.ApplyStatus.PAID}">
									已完成审核流程
								</g:if>
								<g:else>
									<a href="${createLink(action:'passed') }/${horseGiftApplyInstance?.id}" target="_blank" onclick="return confirm('${message(code: 'default.button.pass.confirm.message', default: 'Are you sure?')}');">1、${message(code: 'default.button.pass.label', default: 'Pass')}</a><br>
									<a href="${createLink(action:'showReject') }/${horseGiftApplyInstance?.id}" target="_blank">2、${message(code: 'default.button.reject.label', default: 'Rejected')}</a><br>
									<a href="${createLink(action:'showRejectPart') }/${horseGiftApplyInstance?.id}" target="_blank" >3、${message(code: 'default.button.passPic.label', default: 'Pass Picture')}</a><br>
									<a href="${createLink(action:'showUnlucky') }/${horseGiftApplyInstance?.id}" target="_blank" >4、${message(code: 'default.button.unlucky.label', default: 'Unluck')}</a><br>
									<%--<g:actionSubmit class="save" action="passed" value="${message(code: 'default.button.pass.label', default: 'Pass')}"  formnovalidate="" onclick="return confirm('${message(code: 'default.button.pass.confirm.message', default: 'Are you sure?')}');" />
									
								--%></g:else>
						</g:form>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${horseGiftApplyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
