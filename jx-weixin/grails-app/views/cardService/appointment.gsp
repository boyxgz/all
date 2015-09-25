
<!DOCTYPE html>
<html>
<head>
<title>中国石油浙江公司</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="${resource(dir:'css/jquery.mobile-1.3.2.min.css')}" />
<script type="text/javascript"
	src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
<script src="${resource(dir:'js/jquery.mobile-1.3.2.min.js')}"></script>
</head>
<body>

	<div data-role="page" id="page-network">
		<div data-role="content">
		<label for="holderName">姓名：</label><input id="holderName">
		<label for="holderIdNo">身份证号码：</label><input id="holderIdNo">
		<label for="fetchAt">取卡时间：</label><input type="date" id="fetchAt">
		<button>确认预约</button>
		</div>
	</div>
	</body>
</html>
