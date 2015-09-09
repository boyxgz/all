<!DOCTYPE html>
<html>
<head>
<title>中国石油湖南分公司营业网点列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${resource(dir:'css/jquery.mobile-1.3.2.min.css')}" />
<script type="text/javascript"
	src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
<script src="${resource(dir:'js/jquery.mobile-1.3.2.min.js')}"></script>
<wx:registerJsapi apiList="'openLocation'" queryString="articles/network/${branch.id }"/>
<script type="text/javascript">
	function goNavi(stationName, address, lng, lat) {
		wx.openLocation({
		    latitude: lat,
		    longitude: lng,
		    name: stationName,
		    address: address, 
		    scale: 20,
		    infoUrl: '' 
		});
	}
</script>
</head>
<body>
	<div data-role="page" id="page-network">
		<div data-role="content">
			<div data-theme="b" data-role="header" data-position="fixed">加油站网点</div>
			<div data-role="collapsible-set" data-content-theme="d" id="set">
				<g:each in="${districts}" var="district" status="i">
					<div data-role="collapsible" id="set${i}" data-collapsed="true">
						<h3>${district.name}</h3>
						<table data-role="table" id="my-table"
							class="ui-responsive table-stroke">
							<thead>
								<tr>
									<th>网点名称</th>
									<th>地址</th>
									<th>联系电话</th>
								</tr>
							</thead>
							<tbody>
							<g:each in="${com.surelution.wxmp.jx.GasStation.findAllByDistrict(district) }" var="station">
								<tr>
									<th>
									<a href="javascript:goNavi('${station.name }','${station.address }', ${station.longitude},${station.latitude})">${station.name }</a>
									</th>
									<td>${station.address }</td>
									<td><a href="tel:${station.tel }">${station.tel }</a></td>
								</tr>
							</g:each>
							</tbody>
						</table>
					</div>
				</g:each>
			</div>
		</div>
	</div>
</body>
</html>