
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>POS</title>
		<script type="text/javascript" src="${resource(dir:'js/jquery-1.9.1.min.js')}"></script>
		<script type="text/javascript">
			function PrintElem()
		    {
		        Popup($("#divPrint").html());
		    }
	
		    function Popup(data) 
		    {
		        var mywindow = window.open('', 'my div', 'height=400,width=600');
		        mywindow.document.write('<html>');
		        mywindow.document.write('<body>');
		        mywindow.document.write(data);
		        mywindow.document.write('</body></html>');
	
		        mywindow.print();
		        mywindow.close();
	
		        return true;
		    }
		</script>
	</head>
	<body>
		<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
		<button onclick="PrintElem()">PRINT</button>
		<div id="divPrint">
			汽油赠送<br/>
			昵称：xxxx<br/>
			时间：2014-10-30<br/>
			价值：7.18元
		</div>
	</body>
</html>
