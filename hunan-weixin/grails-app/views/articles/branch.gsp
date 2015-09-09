
<!DOCTYPE html>
<%@page import="com.surelution.wxmp.jx.Branch"%>
<html>
<head>
<title>中国石油湖南分公司营业网点列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${resource(dir:'css/jquery.mobile-1.3.2.min.css')}" />
<script type="text/javascript"
	src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
<script src="${resource(dir:'js/jquery.mobile-1.3.2.min.js')}"></script>
</head>
<body>
	<div data-role="page" id="page-network">
		<div data-role="content">
			<div data-theme="b" data-role="header" data-position="fixed">选择分公司</div>
			<div data-role="collapsible-set" data-content-theme="d" id="set">
				<g:each in="${Branch.list()}" var="branch" status="i">
				<a href="${resource(dir:'/articles/network')}/${branch.id}" data-role="button" data-icon="search" rel="external">${branch.name}</a>
				</g:each>
			</div>
		</div>
	</div>
</body>
</html>
