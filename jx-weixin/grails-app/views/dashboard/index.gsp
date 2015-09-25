
<%@ page import="com.surelution.wxmp.jx.Employee" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>活动数据</title>
	</head>
	<body>
	成功发送语音的人数：<font color="blue">${voiceCount}</font><br/>
	总阅读次数：<font color="blue">${readingCount}</font>（1个人转发的文章另1个人读多次，只算1次）<br/>
	参与阅读的人数：<font color="blue">${ readerCount}</font><br/>
	总投票量：<font color="blue">${voteCount}</font>
	</body>
</html>
