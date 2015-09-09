
<%@ page import="com.surelution.wxmp.jx.CardPrecontracting" %>
<!DOCTYPE html>
<html>
	<head>
		<title>预定加油卡</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<meta http-equiv="cleartype" content="on">
		<link type="text/css" rel="stylesheet" href="${createLink(uri: '/css/weixin-mobile.css')}" />
		<link rel="stylesheet" type="text/css" href="http://code.jquery.com/mobile/latest/jquery.mobile.min.css" />
		<link rel="stylesheet" type="text/css" href="http://dev.jtsage.com/cdn/datebox/latest/jqm-datebox.min.css" /> 
		
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script> 
		<script type="text/javascript" src="http://code.jquery.com/mobile/latest/jquery.mobile.min.js"></script>
		
		<script type="text/javascript" src="http://dev.jtsage.com/cdn/datebox/latest/jqm-datebox.core.min.js"></script>
		<script type="text/javascript" src="http://dev.jtsage.com/cdn/datebox/latest/jqm-datebox.mode.datebox.min.js"></script>
		<script src="http://dev.jtsage.com/cdn/datebox/i18n/jquery.mobile.datebox.i18n.zh-CN.utf8.js"></script>
		
		<script type="text/javascript">
		$(document).ready(function () {
		    $('#branch').change(function () {
		    	$('#district').empty()
		    	$('#stationOfFetch').empty()
			    var branchId = $('#branch').val();
			    if(branchId) {
				    var url = "${createLink(uri: '/jsonData/district/')}" + branchId;
				    $.getJSON(url,{},function(data)
	    			{
				    	$.each(data, function(i,obj) {
				    		var o = '<option value="' + obj.id + '">' + obj.name + '</option>'
				    		$('#district').append(o);
					    	})
				    	 
	    			})
		    }
		    })
		    $('#district').change(function () {
			    var url = "${createLink(uri: '/jsonData/station/')}" + $('#district').val()
			    $.getJSON(url,{},function(data)
    			{
			    	$('#stationOfFetch').empty()
			    	$.each(data, function(i,obj) {
			    		var o = '<option value="' + obj.id + '">' + obj.name + '</option>'
			    		$('#stationOfFetch').append(o);
				    	})
			    	 
    			})
		    })
		});
		
		</script>
	</head>
	<body>
	<div class="message" role="status">${flash.message}</div>
		<g:form action="mobileSave" >
		<g:hiddenField name="id" value="${verifycode }"/>
		<div class="x-form-fieldset-inner">
			<div class="x-field" >
				<div class="x-form-label"  style="width: 30% !important;">
					<span ><g:message code="cardPrecontracting.dateOfFetch.label" default="Date Of Fetch" /></span>
				</div>
				<div class="x-component-outer" style="width: 70% !important;">
					<div class="x-field-input" >
						<input type=text data-role="datebox" data-options='{"mode":"datebox", "useNewStyle":true, "overrideDateFieldOrder": ["y", "m", "d"]}' name="dateOfFetch" id="dateOfFetch" value="${formatDate(date:cardPrecontractingInstance?.dateOfFetch, format:'yyyy-MM-dd')}">
					</div>
				</div>
			</div>
		</div>
		
		<div class="x-form-fieldset-inner">
			<div class="x-field" >
				<div class="x-form-label"  style="width: 30% !important;">
					<span ><g:message code="cardPrecontracting.stationOfFetch.district.branch.label" default="分公司" /></span>
				</div>
				<div class="x-component-outer" style="width: 70% !important;">
					<div class="x-field-input" >
						<g:select id="branch" name="branch.id" noSelection="${['':''] }" from="${com.surelution.wxmp.jx.Branch.list()}" optionKey="id" optionValue="name" required="" value="${cardPrecontractingInstance?.stationOfFetch?.id}" class="many-to-one"/>
					</div>
				</div>
			</div>
		</div>
		
		<div class="x-form-fieldset-inner">
			<div class="x-field" >
				<div class="x-form-label"  style="width: 30% !important;">
					<span ><g:message code="cardPrecontracting.stationOfFetch.district.label" default="区县" /></span>
				</div>
				<div class="x-component-outer" style="width: 70% !important;">
					<div class="x-field-input" >
						<select id="district" name="district">
							<option></option>
						</select>
					</div>
				</div>
			</div>
		</div>
		
		<div class="x-form-fieldset-inner">
			<div class="x-field" >
				<div class="x-form-label"  style="width: 30% !important;">
					<span ><g:message code="cardPrecontracting.stationOfFetch.label" default="Station Of Fetch" /></span>
				</div>
				<div class="x-component-outer" style="width: 70% !important;">
					<div class="x-field-input" >
						<select id="stationOfFetch" name="stationOfFetch.id">
							<option></option>
						</select>
					</div>
				</div>
			</div>
		</div>
		
		<div class="x-form-fieldset-inner">
			<div class="x-field" >
				<div class="x-form-label"  style="width: 30% !important;">
					<span ><g:message code="cardPrecontracting.remark.label" default="Remark" /></span>
				</div>
				<div class="x-component-outer" style="width: 70% !important;">
					<div class="x-field-input" >
						<g:textField name="remark" value="${cardPrecontractingInstance?.remark}"/>			
					</div>
				</div>
			</div>
			
		</div>
		
		
		
		<div class="x-form-fieldset-inner">
			<div class="x-field" >
				<div class="x-form-label"  style="width: 30% !important;">
					<span ><g:message code="cardPrecontracting.holderName.label" default="Holder name" /></span>
				</div>
				<div class="x-component-outer" style="width: 70% !important;">
					<div class="x-field-input" >
						<g:textField name="holderName" value="${cardPrecontractingInstance?.holderName}"/>			
					</div>
				</div>
			</div>
		</div>
		
		<div class="x-form-fieldset-inner">
			<div class="x-field" >
				<div class="x-form-label"  style="width: 30% !important;">
					<span ><g:message code="cardPrecontracting.holderSId.label" default="Holder SID" /></span>
				</div>
				<div class="x-component-outer" style="width: 70% !important;">
					<div class="x-field-input" >
						<g:textField name="holderSId" value="${cardPrecontractingInstance?.holderSId}"/>			
					</div>
				</div>
			</div>
		</div>
		
		<div class="x-form-fieldset-inner">
			<div class="x-field" >
				<div class="x-form-label"  style="width: 30% !important;">
					<span ><g:message code="cardPrecontracting.contactTel.label" default="Contact Tel" /></span>
				</div>
				<div class="x-component-outer" style="width: 70% !important;">
					<div class="x-field-input" >
						<g:textField name="contactTel" value="${cardPrecontractingInstance?.contactTel}"/>			
					</div>
				</div>
			</div>
		</div>
		
		<p class="alignCenter">
			<input type="submit" class="x-button-large" value="提   交"/>
		</p>
		</g:form>
	</body>
</html>
