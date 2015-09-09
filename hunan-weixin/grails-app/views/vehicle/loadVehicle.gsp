
<%@ page import="com.surelution.wxmp.jx.VehicleType" %>
<!DOCTYPE html>
<html>
	<head>
		<title>中国石油嘉兴公司</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link rel="stylesheet" href="${resource(dir:'css/jquery.mobile-1.3.2.min.css')}" />
		<script src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
		<script src="${resource(dir:'js/jquery.mobile-1.3.2.min.js')}"></script>
	</head>
	<body>
<div data-role="page" id="page-configVehicle">
    <div data-role="content">
		<br>
		<font size="+2"><b>设置车辆信息</b></font><br><br>
		请根据行车证上的相关信息正确填写如下信息<br>
		<g:form action="addNew">
			<font color="blue">车辆类型：</font><g:select name="type" from="${VehicleType.list() }" optionKey="id" optionValue="title" value="${vehicle?.type?.id }"/>
			<font color="blue">号牌号码：</font><g:textField name="vNo" value="${(vehicle?.vNo)?vehicle.vNo:'浙F' }" style="text-transform:uppercase;"/>(目前只支持 浙F 开头的号牌)<br>
			<font color="blue">车辆识别代号：</font><g:textField name="vId" value="${vehicle?.vId }" style="text-transform:uppercase;"/>
			<font color="blue">发动机号：</font><g:textField name="engineId" value="${vehicle?.engineId }" style="text-transform:uppercase;"/>
			<g:hiddenField name="subscriber.id" value="${subscriber.id}"/>
			<g:submitButton name="submit" value="设置"/>
		</g:form>
	</div>
	<g:if test="${vehicle }">
    <div data-theme="a" data-role="footer" data-position="fixed">
	    <div data-role="navbar" data-iconpos="top">
	        <ul>
	            <li>
	                <a href="${resource(dir:'vehicle/violate')}/${subscriber.id }#page-nonprocess" rel="external">
	                    未处理
	                </a>
	            </li>
	            <li>
	                <a href="${resource(dir:'vehicle/violate')}/${subscriber.id }#page-processed" rel="external">
	                    已处理
	                </a>
	            </li>
	            <li>
	                <a href="#page-configVehicle" data-transition="fade" data-theme="" data-icon="">
	                    车辆设置
	                </a>
	            </li>
	        </ul>
	    </div>
    </div>
    </g:if>
</div>
	</body>
</html>
