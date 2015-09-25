<%@page import="com.surelution.wxmp.patrocn.domain.Location"%>
<%@page import="com.surelution.wxmp.patrocn.dao.LocationDao"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>导航</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>

<%!
	String getGoogleDirectionApi(String origAddress, String destAddress) {
		StringBuilder googleDirectionApi = new StringBuilder("http://maps.googleapis.com/maps/api/directions/json?origin=");
		googleDirectionApi.append(origAddress);
		googleDirectionApi.append("&destination=");
		googleDirectionApi.append(destAddress);
		googleDirectionApi.append("&sensor=true&language=zh_CN");
		return googleDirectionApi.toString();
	}
%>

<%
	String orig = request.getParameter("orig");
	String dest = request.getParameter("dest");
	int destId = Integer.parseInt(dest);
	ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(application);
	LocationDao dao = ac.getBean(LocationDao.class);
	Location location = dao.findById(destId);
	String googleImageApi = "http://maps.googleapis.com/maps/api/staticmap?";
	googleImageApi += "key=AIzaSyB76eufhJiBHXBQFXRE_d9S3AKxXYKpsEc&";
	googleImageApi += "markers=color:green%7C";
	googleImageApi += location.getLatitude();
	googleImageApi += ",";
	googleImageApi += location.getLongitude();
	googleImageApi += "&";
	googleImageApi += "markers=color:red%7C";
	googleImageApi += orig;
	googleImageApi += "&";
	googleImageApi += "sensor=true&size=480x640&path=weight:10%7Ccolor:green%7Cenc:";

	URL url = new URL(getGoogleDirectionApi(orig, location.getLatitude() + "," + location.getLongitude()));
	String lines = IOUtils.toString(url.openStream(), "utf-8");
	JSONObject root = new JSONObject(lines);
	JSONObject routes = root.getJSONArray("routes").getJSONObject(0);
	String overview = routes.getJSONObject("overview_polyline").getString("points");
%>

<font color="blue">请根据如下指引前往 <%=location.getName() %></font>(<%=location.getAddress() %>)<br/>

<%
	JSONArray steps = routes.getJSONArray("legs").getJSONObject(0).getJSONArray("steps");
	for(int i = 0; i < steps.length(); i++) {
		JSONObject step = steps.getJSONObject(i);
		String html_instructions = step.getString("html_instructions");
		String distance = step.getJSONObject("distance").getString("text");
		String duration = step.getJSONObject("duration").getString("text");
		out.print(html_instructions);
		out.print(distance);
		out.print(",约");
		out.print(duration);
		out.append("<br/>");
	}
%>
如下图，绿色通道即为行程路径，红色气泡为您当前位置，绿色气泡处我们已经安排好了热情的中国石油员工正在等待为您服务：

<img alt="导航地图" src="<%=googleImageApi%><%=overview%>">
<br><br> 
<br>
<p align="center">&copy; 2013 <a href="http://www.sh-hansi.com/">上海悍思企业管理咨询有限公司</a></p>
</body>
</html>