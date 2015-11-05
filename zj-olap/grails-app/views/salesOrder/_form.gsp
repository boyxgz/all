<%@ page import="com.surelution.zjolap.SalesOrder" %>
	
		<script type="text/javascript">
			  $(document).ready(function()
				     {

			          $("#branch_id").change(loadData);
			          
			          loadData();
			        })
			        
			        
			        function loadData() {
			      
				         var branchId =  $("#branch_id").children('option:selected').val() +"";
				         $('#sales_id').empty();
				          if(branchId) {
				          $.ajax({
				        	     url:'${createLink(uri:'/salesOrder/findSales')}',
								dataType:"json",
								data:{branchId:branchId},
								success:function(data) {
									var varHtml ="";
			                         $.each(data, function(commentIndex, comment){
											var salesId = ${salesOrderInstance?.sales?.id}+"";
											if(comment.id ==salesId) 
											{
												varHtml +="<option  selected='selected'  value='"+ comment.id +"'>"+comment.name+"</option>";
											}else 
											{
												varHtml +="<option value='"+ comment.id +"'>"+comment.name+"</option>";
											}
				                         });
									// $('#fmClosed').html(closeHtml);
									$('#sales_id').html(varHtml);
								}
					          });
				          }
			          }
				

		</script>


<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'branch', 'error')} required">
 <sec:ifAnyGranted roles="ROLE_ADMIN">
	<label for="branch">
		<g:message code="salesOrder.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch_id" name="branch.id" from="${com.surelution.zjolap.Branch.list()}" optionKey="id" optionValue="name" required="" value="${salesOrderInstance?.branch?.id}" class="many-to-one"/>
	</sec:ifAnyGranted>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'customer', 'error')} required">
	<label for="customer">
		<g:message code="salesOrder.customer.label" default="Customer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="customer" name="customer.id" from="${com.surelution.zjolap.Customer.findAllByStatus('ABLE')}" optionKey="id" optionValue="name" required="" value="${salesOrderInstance?.customer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'gasType', 'error')} required">
	<label for="gasType">
		<g:message code="salesOrder.gasType.label" default="Gas Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="gasType" name="gasType.id" from="${com.surelution.zjolap.GasType.list()}" optionKey="id" optionValue="name" required="" value="${salesOrderInstance?.gasType?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'listUnitPrice', 'error')} required">
	<label for="listUnitPrice">
		<g:message code="salesOrder.listUnitPrice.label" default="List Unit Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="listUnitPrice" value="${fieldValue(bean: salesOrderInstance, field: 'listUnitPrice')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'orderFormNo', 'error')} ">
	<label for="orderFormNo">
		<g:message code="salesOrder.orderFormNo.label" default="Order Form No" />
		
	</label>
	<g:textField name="orderFormNo" value="${salesOrderInstance?.orderFormNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'purchasingPrice', 'error')} required">
	<label for="purchasingPrice">
		<g:message code="salesOrder.purchasingPrice.label" default="Purchasing Price" />
		<span class="required-indicator">*</span>
	</label>
	<%--<g:field name="purchasingPrice" value="${fieldValue(bean: salesOrderInstance, field: 'purchasingPrice')}" required=""/>
--%>
    <g:if test="${salesOrderInstance.quantity && salesOrderInstance.purchasingUnitPrice}">
    	 ${salesOrderInstance.quantity * salesOrderInstance.purchasingUnitPrice }
    </g:if>
   
  </div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'purchasingPriceRate', 'error')} required">
	<label for="purchasingPriceRate">
		<g:message code="salesOrder.purchasingPriceRate.label" default="Purchasing Price Rate" />
		<span class="required-indicator">*</span>
	</label>
	<%--<g:field name="purchasingPriceRate" value="${fieldValue(bean: salesOrderInstance, field: 'purchasingPriceRate')}" required=""/>
	
	--%>
	<g:if test="${salesOrderInstance.purchasingUnitPrice && salesOrderInstance.listUnitPrice}">
	<g:formatNumber number="${salesOrderInstance.purchasingUnitPrice/salesOrderInstance.listUnitPrice * 100 }" maxFractionDigits="4"/>%
	  </g:if>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'purchasingUnitPrice', 'error')} required">
	<label for="purchasingUnitPrice">
		<g:message code="salesOrder.purchasingUnitPrice.label" default="Purchasing Unit Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="purchasingUnitPrice" value="${fieldValue(bean: salesOrderInstance, field: 'purchasingUnitPrice')}" required=""/>

  
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="salesOrder.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" value="${fieldValue(bean: salesOrderInstance, field: 'quantity')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'sales', 'error')} required">
	<label for="sales">
		<g:message code="salesOrder.sales.label" default="Sales" />
		<span class="required-indicator">*</span>
	</label>
	<%--<g:select id="sales" name="sales.id" from="${com.surelution.zjolap.Sales.list()}" optionKey="id" optionValue="${{it.branch.name + '>>' + it.name}}" required="" value="${salesOrderInstance?.sales?.id}" class="many-to-one"/>
	
--%>
	 <select id="sales_id" name="sales.id">
							
	 </select>
   </div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'salingAt', 'error')} required">
	<label for="salingAt">
		<g:message code="salesOrder.salingAt.label" default="Saling At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="salingAt" precision="day"  value="${salesOrderInstance?.salingAt}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'salingtype', 'error')} required">
	<label for="salingtype">
		<g:message code="salesOrder.salingtype.label" default="Salingtype" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="salingtype" name="salingtype.id" from="${com.surelution.zjolap.SalingType.list()}" optionKey="id" optionValue="name" required="" value="${salesOrderInstance?.salingtype?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'timeByDay', 'error')} required">
	<label for="timeByDay">
		<g:message code="salesOrder.month.label" default="Time By Day" />
		<span class="required-indicator">*</span>
	</label>
	<%--
	<g:select id="timeByDay" name="month.id" from="${com.surelution.zjolap.FinancialMonth.list()}" optionKey="id" optionValue="${{it.year + '-' + it.month}}" required="" value="${salesOrderInstance?.month?.id}" class="many-to-one"/>
    --%>
    年:<g:select name="financialMonth_Year" from="${['2013','2014','2015','2016','2017']}" required="" value="${salesOrderInstance?.month?.year}" class="many-to-one"/>
    月:<g:select name="financialMonth_Month" from="${['1','2','3','4','5','6','7','8','9','10','11','12']}" required="" value="${salesOrderInstance?.month?.month}" class="many-to-one"/>
</div>

