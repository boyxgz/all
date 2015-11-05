<%@ page import="com.surelution.zjolap.WarningRuleToBranchCustomer" %>

<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<script>
var dialog;
$(function() {
    dialog = $( "#dialog" ).dialog({
      autoOpen: false,
      modal: true,
      height: 600,
      width: 700,
    });
 
    $( "#opener" ).click(function() {
    	dialog.dialog( "open" );
    });
    
    $( "#btnSearch" ).click(function() {
       var s = document.getElementById("customerName").value;
      $( "#divresult" ).load( "${createLink(uri: '/customer/selector')}?branchId=${branch?.id}&customerName=" + s);
    });
  });

function select(id, name) {
	document.getElementById("opener").value=name;
	document.getElementById("customerBranch").value=id;
	dialog.dialog( "close" );
}
</script>
</head>

<div id="dialog" title="选择客户">
  	客户名称:<input id="customerName" name="customerName"><input type="button" id="btnSearch" value="查询">
  	<div id="divresult"></div>
</div>

<div class="fieldcontain ${hasErrors(bean: warningRuleToBranchCustomerInstance, field: 'customerBranch', 'error')} required">
	<label for="customerBranch">
		<g:message code="warningRuleToBranchCustomer.customer.label" default="Customer Branch" />
		<span class="required-indicator">*</span>
	</label>
	<input id="opener" name="customerId" value="${warningRuleToBranchCustomerInstance?.customerBranch?.customer?.name }" size="100" readonly>
	<input type="hidden" id="customerBranch" name="customerBranch.id" value="${warningRuleToBranchCustomerInstance?.customerBranch?.id }">
</div>

<div class="fieldcontain ${hasErrors(bean: warningRuleToBranchCustomerInstance, field: 'rule', 'error')} required">
	<label for="rule">
		<g:message code="warningRuleToBranchCustomer.rule.label" default="Rule" />
		<span class="required-indicator">*</span>
	</label>
	
	<g:select id="rule" name="rule.id" from="${com.surelution.zjolap.WarningRule.getListByBranch("${branch?.id}")}" optionKey="id" required=""  optionValue="${{it?.gasType?.category?.name+'>>'+it?.gasType?.name+'>>'+it?.typeName +'>>'+it?.value}}" value="${warningRuleToBranchCustomerInstance?.rule?.id}" class="many-to-one"/>
</div>

