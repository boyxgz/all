
<%@ page import="com.surelution.wxmp.jx.VehicleType" %>
<!DOCTYPE html>
<html>
	<head>
		<title>中国石油嘉兴公司</title>
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<link rel="stylesheet" href="${resource(dir:'css/jquery.mobile-1.3.2.min.css')}" />
		<script src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
		<script src="${resource(dir:'js/jquery.mobile-1.3.2.min.js')}"></script>
		<style type="text/css">
			h3 {
				color: blue
			}
		</style>
	</head>
	<body>
	
<!-- Home -->
<div data-role="page" id="page-nonprocess">
    <div data-role="content">
    <div data-theme="b" data-role="header" data-position="fixed">
    未处理
    </div>
        <ul data-role="listview" data-divider-theme="b" data-inset="true">
        	<g:each in="${nunProcess}" var="p">
	            <li data-theme="c">
	                <a href="#page-${p.illegalAt.time }" data-transition="slide">
	                	<g:formatDate date="${p.illegalAt }" format="yyyy-MM-dd HH:mm"/>
	                </a>
	            </li>
        	</g:each>
        </ul>
    </div>
    <div data-theme="a" data-role="footer" data-position="fixed">
	    <div data-role="navbar" data-iconpos="top">
	        <ul>
	            <li>
	                <a href="#page-nonprocess" data-transition="fade" data-theme="" data-icon="">
	                    未处理
	                </a>
	            </li>
	            <li>
	                <a href="#page-processed" data-transition="fade" data-theme="" data-icon="">
	                    已处理
	                </a>
	            </li>
	            <li>
	                <a href="../loadVehicle/${subscriber.id }" data-transition="fade" data-theme="" data-icon="" rel="external">
	                    车辆设置
	                </a>
	            </li>
	        </ul>
	    </div>
    </div>
</div>

<div data-role="page" id="page-processed">
    <div data-role="content">
    <div data-theme="b" data-role="header" data-position="fixed">
    已处理
    </div>
        <ul data-role="listview" data-divider-theme="b" data-inset="true">
        	<g:each in="${processed}" var="p">
	            <li data-theme="c">
	                <a href="#page-${p.illegalAt.time }" data-transition="slide">
	                	<g:formatDate date="${p.illegalAt }" format="yyyy-MM-dd HH:mm"/>
	                </a>
	            </li>
        	</g:each>
        </ul>
    </div>
    <div data-theme="a" data-role="footer" data-position="fixed">
	    <div data-role="navbar" data-iconpos="top">
	        <ul>
	            <li>
	                <a href="#page-nonprocess" data-transition="fade" data-theme="" data-icon="">
	                    未处理
	                </a>
	            </li>
	            <li>
	                <a href="#page-processed" data-transition="fade" data-theme="" data-icon="">
	                    已处理
	                </a>
	            </li>
	            <li>
	                <a href="../loadVehicle/${subscriber.id }" data-transition="fade" data-theme="" data-icon="" rel="external">
	                    车辆设置
	                </a>
	            </li>
	        </ul>
	    </div>
    </div>
</div>

<g:each in="${nunProcess}" var="p">
	<div data-role="page" id="page-${p.illegalAt.time }">
		<ul data-role="listview" data-divider-theme="b" data-inset="true">
		    <li data-theme="c">
		        <h3>违章日期</h3><g:formatDate date="${p.illegalAt }" format="yyyy-MM-dd HH:mm:ss"/><br>
		        <h3>违章地点</h3>${p.address }<br>
		        <h3>违章行为</h3>${p.illegalAction }<br>
		        <h3>处理状态</h3>${p.status }<br>
		        <h3>采集机关</h3>${p.policeOffice }<br>
		    </li>
		</ul>
		
	    <div data-theme="a" data-role="footer" data-position="fixed">
		    <div data-role="navbar" data-iconpos="top">
		        <ul>
		            <li>
		                <a href="#page-nonprocess" data-transition="slide">
				            返回未处理列表
				        </a>
		            </li>
		        </ul>
		    </div>
		</div>
	</div>
</g:each>
<g:each in="${processed}" var="p">
	<div data-role="page" id="page-${p.illegalAt.time }">
		<ul data-role="listview" data-divider-theme="b" data-inset="true">
		    <li data-theme="c">
		        <h3>违章日期</h3><g:formatDate date="${p.illegalAt }" format="yyyy-MM-dd HH:mm:ss"/><br>
		        <h3>违章地点</h3>${p.address }<br>
		        <h3>违章行为</h3>${p.illegalAction }<br>
		        <h3>处理状态</h3>${p.status }<br>
		        <h3>采集机关</h3>${p.policeOffice }<br>
		    </li>
		</ul>
		
	    <div data-theme="a" data-role="footer" data-position="fixed">
		    <div data-role="navbar" data-iconpos="top">
		        <ul>
		            <li>
		                <a href="#page-processed" data-transition="slide">
				            返回已处理列表
				        </a>
		            </li>
		        </ul>
		    </div>
		</div>
	</div>
</g:each>
	</body>
</html>
