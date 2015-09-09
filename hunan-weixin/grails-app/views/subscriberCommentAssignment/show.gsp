
<%@page import="com.surelution.wxmp.jx.SubscriberCommentReplyUser"%>
<%@page import="com.surelution.wxmp.jx.User"%>
<%@page import="org.h2.command.ddl.CreateLinkedTable"%>
<%@page import="com.surelution.whistle.push.UserInfo"%>
<%@ page import="com.surelution.wxmp.jx.SubscriberCommentAssignment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subscriberCommentAssignment.label', default: 'SubscriberCommentAssignment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<r:require module="jquery-ui"/>
		
		<script type="text/javascript">

		$(function() {
		    $( "#dialog-modal" ).dialog({
		      height: 140,
		      autoOpen: false,
		      height: 300,
		      width: 350,
		      modal: true
		    });
		  });

		  function openReply(msgId) {
			  $("#replyTo").val(msgId);
			  $( "#dialog-modal" ).dialog( "open" );
		  }

		  function closeCommentAssignment() {
			  if(confirm('标记为处理完毕操作表示您认为这次用户的消息已经处理完毕，或者，本条消息没有进一步跟进的必要了。您确定标记为处理完毕吗？')) {
			  	document.location.href="${createLink(controller:'subscriberCommentAssignment',action:'closeCommentAssignment', params:[id:subscriberCommentAssignmentInstance.id]) }";
			  }
		  }

		  function reAssign() {
			  if(confirm('指派操作表示您认为这次用户的消息您无法处理，需要指派给其他人处理。您确定指派吗？')) {
				  var userId = $("#assignTo").val();
				  document.location.href="${createLink(controller:'subscriberCommentAssignment',action:'reAssign', params:[id:subscriberCommentAssignmentInstance.id]) }?userId=" + userId;
			  }
		  }
		</script>
		
	</head>
	<body>

<div id="dialog-modal" title="回复">
<g:form action="reply">
  	回复内容：<textarea rows="15" cols="60" name="replyContent"></textarea><br>
  	<input type="hidden" name="replyTo" id='replyTo'>
  	<input type="hidden" name="subscriberCommentAssignmentId" value="${subscriberCommentAssignmentInstance.id}">
  	<input type="submit" value="回复">
</g:form>
</div>

		<a href="#show-subscriberCommentAssignment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-subscriberCommentAssignment">
			<h1><g:message code="subscriberCommentAssignment.usershow.label" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table style="width:800px;">
			<tr>
				<td style="width:200px;"><g:message code="subscriberCommentAssignment.subscriber.label" default="Subscriber" /></td>
				<td>操作</td>
			</tr>
			<tr >
				<td>
					<g:set var="userinfo" value="${UserInfo.loadUserInfo(subscriberCommentAssignmentInstance.subscriber.openId)}"/>
						<img alt="" src="${userinfo?.headImgUrl}" height="80" width="80"><br>
						${userinfo?.nickname  }
				</td>
				<td style="text-align:left;"><g:message code="subscriberCommentAssignment.closed.label" default="Closed" />:&nbsp;&nbsp;
					<g:formatBoolean boolean="${subscriberCommentAssignmentInstance?.closed}" true="已处理" false="未处理"/>
					<g:if test="${!subscriberCommentAssignmentInstance?.closed}">
						<input type="button" value="标记为处理完毕" onclick="closeCommentAssignment()">
					</g:if><br>
					
					<g:if test="${subscriberCommentAssignmentInstance?.user}">
					<g:message code="subscriberCommentAssignment.user.label" default="User" />:&nbsp;&nbsp;
						${subscriberCommentAssignmentInstance?.user.username}
						&nbsp;
						指派给:
						<g:select name="assignTo" id="assignTo" from="${SubscriberCommentReplyUser.list().collect(){it.user}}" optionKey="id" optionValue="username"/>
						<input type="button" value="指派" onclick="reAssign()">
					</g:if><br>
					
					<g:if test="${subscriberCommentAssignmentInstance?.tips}">
					<g:message code="subscriberCommentAssignment.tips.label" default="Tips" />:&nbsp;&nbsp;
						<g:fieldValue bean="${subscriberCommentAssignmentInstance}" field="tips"/>
					</g:if>
				</td>
			</tr>
						
			</table>
		</div>
		
			<h1><g:message code="subscriberCommentAssignment.message.list.label" args="[entityName]" /></h1>
			<div id="message">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table >
				<thead style="border:1px solid #DFDFDF;">
					<tr class="sortable" style="position: relative; top:expression(this.offsetParent.scrollTop);height: 20px;">
					
						<g:sortableColumn property="content"  title="${message(code: 'subscriberComment.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="createdAt" style="width:130px;" title="${message(code: 'subscriberComment.createAt.label', default: 'Created At')}" />
					
					</tr>
				</thead>
				<tbody >
				<g:each in="${subscriberComments}" status="i" var="subscriberComment">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}" onclick="openReply(${subscriberComment.id})">
					
					
						<td style="border:1px solid #DFDFDF;text-align: left">${fieldValue(bean: subscriberComment, field: "content")}</td>
					
						<td style="border:1px solid #DFDFDF;"><g:formatDate date="${subscriberComment.createdAt }" format="yyyy-MM-dd HH:mm:ss"/></td>
					
					</tr>
					<g:set var="replies" value="${subscriberComment.replies }"/>
					<g:if test="${replies }" >
						<tr style="background:#DFDFDF;">
							<td colspan="2" style="color:black;text-align:left;">
								<table >
									<g:each in="${replies }" var="reply" >
										<tr >
											<td style="float:left;">&gt;&gt;<label style="color:blue;">${reply.user.username }</label>于&nbsp;<label style="color:blue;"><g:formatDate date="${reply.repliedAt}" format="yyyy-MM-dd HH:mm"/></label>回复道：${reply.content }</td>
										</tr>
									</g:each>
								</table>
							</td>
						</tr>
					</g:if>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
