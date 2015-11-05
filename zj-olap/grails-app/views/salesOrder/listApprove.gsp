
<%@ page import="com.surelution.zjolap.SalesOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'salesOrder.label', default: 'SalesOrder')}" />
		<r:require module="jquery-ui"/>
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript" src="${resource(file:'js/jquery.stickytableheaders.js') }"></script>
		
		<script type="text/javascript">
	        $(document).ready(function()
	        {

	        	$.datepicker.regional['zh-cn'] = {
	        	        closeText: '关闭',
	        	        prevText: '&#x3C;上月',
	        	        nextText: '下月&#x3E;',
	        	        currentText: '今天',
	        	        changeMonth: true,
	        	        changeYear: true,
	        	        monthNames: ['一月','二月','三月','四月','五月','六月',
	        	        '七月','八月','九月','十月','十一月','十二月'],
	        	        monthNamesShort: ['一月','二月','三月','四月','五月','六月',
	        	        '七月','八月','九月','十月','十一月','十二月'],
	        	        dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
	        	        dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
	        	        dayNamesMin: ['日','一','二','三','四','五','六'],
	        	        weekHeader: '周',
	        	        dateFormat: 'yy-mm-dd',
	        	        firstDay: 1,
	        	        isRTL: false,
	        	        showButtonPanel: true,
	        	        showMonthAfterYear: true
	        	        };
	        	    $.datepicker.setDefaults($.datepicker.regional['zh-cn']);
	        	    
	          $("#salingAtFrom").datepicker({dateFormat: 'yy-mm-dd'});
	          $("#salingAtTo").datepicker({dateFormat: 'yy-mm-dd'});
	          fun();
	          clickFun();

	          $("table").stickyTableHeaders({ scrollableArea: $(".scaffold-list")[0]});
	        })
	        
	        function fun() {
  	 			 var thead = document.getElementsByTagName("thead")[0];
  	 			 var tr = thead.getElementsByTagName("tr")[0];
  	 			 var tds = tr.getElementsByTagName("th");
  	 			 
  	 			 var div = document.getElementById("divCols");
  	 			 var checkedStr = "${params.checkedStr}";
   	 			 var  strs= checkedStr.split(",");
  	  	 	     
  	 			 for(var i=0;i<tds.length;i++) {
  	 			 	  
  	 			 	  
  	 			 	  var input = document.createElement("input");
  	 			 	  var span = document.createElement("span");
  	 			 	  span.innerHTML = "&nbsp;&nbsp;&nbsp; "+tds[i].textContent+":";
  	 			 	  div.appendChild(span);
  	 			 	  
  	 			 	  input.type='checkbox';
  	 			 	  input.name = "colsCheck";
  	 			 	  input.checked = checkedFun(strs,i);
  	 			 	  input.value =i;
  	 			 	  if(input.addEventListener) {
  	 			 	  	input.addEventListener("click",clickFun);
  	 			 	  }else if(input.attachEvent){
  	 			 	  	input.attachEvent("onClick",clickFun);
  	 			 	  }
  	 			 	  
  	 			 	  div.appendChild(input);
  	 			 }
  	 			 
  	 		}
	        function checkedFun(strs,index) {
				if(strs&&strs[0].length!=0){
					for(var i=0;i<strs.length;i++) {
						if(strs[i]==index&&strs[i].length!=0) {
							return true;
						}
					}
					return false;
				}

				return true;
  	  	  	}
  	 		
  	 		function clickFun() {
  	 		  var div = document.getElementById("divCols");
  	 		  var inputs = div.getElementsByTagName("input");
  	 		  var checkedStr = "";
  	 		
  	 		  for(var i =0;i<inputs.length;i++){
  	 		  	if(inputs[i].checked) {
  	 		  	   checkedStr+=i+",";
  	 		  		visableTableHead(i,true);
  	 		  	} else {

  	 		  	  visableTableHead(i,false);
  	 		  	}
  	 		  }

  	 		  appendCheckedStrUrl(checkedStr);
  	 		}

  	 		function appendCheckedStrUrl(checkedStr) {
				var pageDiv = document.getElementById("paginateButtons");
				var  allA = pageDiv.getElementsByTagName("a");
				var  checkedStrId = document.getElementById("checkedStrId");

				checkedStrId.value = checkedStr;
				if(allA) {
					for(var i=0;i<allA.length;i++) {
						var href = allA[i].href ; 
						var offset = "";
						var pams = href.split("checkedStr");
						if(pams[1]) {
							offset =pams[1].substr(pams[1].indexOf("&"));
						}
						allA[i].href=pams[0] + "&checkedStr="+checkedStr+offset
					}
				}
  	  	  	}
  	 		
  	 		function visableTableHead(index,show) {
  	 			 var thead = document.getElementsByTagName("thead")[0];
  	 			 var tr = thead.getElementsByTagName("tr")[0];
  	 			 var th = tr.getElementsByTagName("th")[index];
  	 			 
  	 			 if(show) {
  	 			    th.style.display = ""; 
  	 			    visableTableTd(index,show);
  	 			 }else {
  	 			 	   th.style.display = "none"; 
  	 			 	   visableTableTd(index,show);
  	 			 }
  	 		}
  	 		
  	 		function visableTableTd(index,show) {
  	 			 var thead = document.getElementsByTagName("tbody")[0];
  	 			 var trs = thead.getElementsByTagName("tr");
  	 			 for(var i =0;i<trs.length;i++){
  	 			    var td = trs[i].getElementsByTagName("td")[index];
  	 		  	if(show) {
					td.style.display = ""; 
  	 		  	} else {
  	 		  	 	  td.style.display = "none"; 
  	 		  	}
  	 		  }
  	 		}
	    </script>
	</head>
	<body >
		<a href="#list-salesOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
		</div>
		<div id="create-salesOrder" class="scaffold-create" role="main" style="overflow: auto;">
			<g:form action="listApprove" >
					<fieldset class="form">
					    <sec:ifAnyGranted roles="ROLE_ADMIN">
					    
						<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'branch', 'error')} ">
							<label for="branch">
								<g:message code="salesOrder.branch.label" default="Branch" />
							</label>
							<g:select id="branch" name="branch.id" from="${com.surelution.zjolap.Branch.list()}" noSelection="['':'']" optionKey="id" optionValue="name" value="${params['branch.id']}" class="many-to-one"/>
						</div>
						</sec:ifAnyGranted>
						
						<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'orderFormNo', 'error')} ">
							<label for="orderFormNo">
								<g:message code="salesOrder.orderFormNo.label" default="Order Form No" />
							</label>
							<g:textField name="orderFormNo" value="${params.orderFormNo}"/>
						</div>
						
						<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'salingAt', 'error')} required">
							<label for="salingAt">
								<g:message code="salesOrder.salingAt.label" default="Saling At" />
							</label>
							<g:textField name="salingAtFrom" value="${params.salingAtFrom}" />~
							<g:textField name="salingAtTo" value="${params.salingAtTo}" />
						</div>
						<g:hiddenField id="checkedStrId" name="checkedStr" value="${params.checkedStr}"/>
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="search" class="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
					</fieldset>
				</g:form>
		</div>
		<div id="list-salesOrder" class="scaffold-list" role="main" style="overflow: auto;">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div id="divCols"></div>
			<div  style="width:890px;height:510px;overflow:scroll;">
			<table>
				<thead>
					<tr>
						<th><g:message code="salesOrder.branch.label" default="Branch" /></th>
						<th><g:message code="salesOrder.salingtype.label" default="Saling Type" /></th>
						<th><g:message code="salesOrder.month.label" default="结算月" /></th>
						<th><g:message code="salesOrder.customer.label" default="Customer" /></th>
						<g:sortableColumn property="orderFormNo" title="${message(code: 'salesOrder.orderFormNo.label', default: 'Order Form No')}"  params="${params}"/>
						<th><g:message code="salesOrder.timeByDay.label" default="开单时间" /></th>
						<th><g:message code="salesOrder.category.label" default="Category" /></th>
						<th><g:message code="salesOrder.gasType.label" default="Gas Type" /></th>
						<th><g:message code="salesOrder.quantity.label" default="数量" /></th>
						<th><g:message code="salesOrder.purchasingUnitPrice.label" default="销售价" /></th>
						<g:sortableColumn property="purchasingPrice" title="${message(code: 'salesOrder.purchasingPrice.label', default: 'Purchasing Price')}"  params="${params}"/>
			
						<th><g:message code="salesOrder.customerType.label" default="客户性质" /></th>
						<th><g:message code="salesOrder.customerTypelevel2.label" default="机构用户分类" /></th>
						<th><g:message code="salesOrder.customerTypelevel3.label" default="工业分类" /></th>

						<g:sortableColumn property="listUnitPrice" title="${message(code: 'salesOrder.listUnitPrice.label', default: 'List Unit Price')}"  params="${params}"/>
						<th><g:message code="salesOrder.sales.label" default="客户经理人" /></th>
						<th>状态</th>
						 <sec:ifAnyGranted roles="ROLE_ADMIN">
						<th>审批</th>
						</sec:ifAnyGranted>
					</tr>
				</thead>
				<tbody>
				<g:each in="${salesOrderInstanceList}" status="i" var="salesOrderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${salesOrderInstance.id}">${salesOrderInstance.branch.name}</g:link></td>
						<td>${salesOrderInstance?.salingtype?.name}</td>
						<td>${salesOrderInstance?.month?.year}-${salesOrderInstance?.month?.month} </td>
						<td>${salesOrderInstance?.customer?.name}</td>
						<td>${fieldValue(bean: salesOrderInstance, field: "orderFormNo")}</td>
						<td><g:formatDate format="yyyy-MM-dd" date="${salesOrderInstance?.timeByDay?.date}"/> </td>
						<td>${salesOrderInstance.gasType?.category?.name}</td>
						<td>${salesOrderInstance.gasType.name}</td>
						<td>${salesOrderInstance.quantity}</td>
						<td><g:formatNumber number="${salesOrderInstance.purchasingUnitPrice}" format=".###"/></td>
						
						<td><g:formatNumber number="${salesOrderInstance.quantity * salesOrderInstance.purchasingUnitPrice}" format=".###"/></td>
			
						<td>${salesOrderInstance?.customer?.customerType?.level2?.level1?.name}</td>
						<td>${salesOrderInstance?.customer?.customerType?.level2?.displayName}</td>
						<td>${salesOrderInstance?.customer?.customerType?.displayName}</td>
		
						<td>${salesOrderInstance.listUnitPrice}</td>
						
						<td>${salesOrderInstance?.sales?.name}</td>
						<td>
							${salesOrderInstance?.statusName}
						</td>
						 <sec:ifAnyGranted roles="ROLE_ADMIN">
						<td>
						    <g:if test="${salesOrderInstance?.status !='DISABLE'}">
							<g:link action="saveApprove" id="${salesOrderInstance.id}">
					    	同意
					    	</g:link>
					    	 &nbsp; &nbsp;
					    	 <g:link action="saveDisApprove" id="${salesOrderInstance.id}">
					    	 驳回
					    	 </g:link>
							</g:if>
							
						</td>
						</sec:ifAnyGranted>
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			<div class="paginateButtons" id="paginateButtons">
				<g:paginate total="${salesOrderInstanceTotal}" params="${params}" />
			</div>
		</div>
	</body>
</html>
