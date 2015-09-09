<%@page import="grails.util.Holders"%>
<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>导航</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <wx:registerJsapi apiList="'openLocation'" queryString="navigation/go?${request.queryString }"/>
    <script type="text/javascript">
		function openLocation() {
			wx.openLocation({
			    latitude: ${station.latitude}, // 纬度，浮点数，范围为90 ~ -90
			    longitude: ${station.longitude}, // 经度，浮点数，范围为180 ~ -180。
			    name: '${station.name }', // 位置名
			    address: '${station.address }', // 地址详情说明
			    //scale: 1, // 地图缩放级别,整形值,范围从1~28。默认为最大
			    infoUrl: '' // 在查看位置界面底部显示的超链接,可点击跳转
			});
		}
    </script>
</head>
<body>
<a href="javascript:openLocation()"><img src="http://api.map.baidu.com/staticimage?markers=${station.longitude },${station.latitude }&markerStyles=-1,http://${Holders.config.app.web.path }/images/logo-2.png,-1,23,25&center=${station.longitude },${station.latitude }&width=320&height=400&zoom=14"></a>
<br/>
<font color="blue">请戳上图实时导航前往${station.name }</font>(${station.address })
<br/>
<font color="blue">或者，请根据如下指引前往 ${station.name }</font>(${station.address })<br/><br/>
<g:each in="${routes }" var="r">
${r[0]}<br/>
</g:each>

<br>
<p align="center">&copy; 2013 <a href="http://www.sh-hansi.com/">上海悍思企业管理咨询有限公司</a></p>
</body>
</html>