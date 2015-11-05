<%@page import="com.surelution.zjolap.CustomerTypeLevel3"%>
<%@ page import="com.surelution.zjolap.Customer" %>
<%@page import="com.surelution.zjolap.CustomerType"%>
<r:require module="jquery-ui"/>
<script type="text/javascript">
	$(document).ready(function()
	    {
		loadType2();
	    });

	function loadType2() {
		var typeID =  $('#customerTypeID').children('option:selected').val();
		var type2 =  ${customerInstance?.customerType?.level2?.id} +"";
		$('#customerType2ID').empty();
		$('#customerType3ID').empty();
		
		 $.ajax({
			    url:'${createLink(uri:'/customerType/loadType2')}',
				dataType:"json",
				data:{typeID:typeID},
				
				success:function(data) {
					var html = "";
                         $.each(data, function(commentIndex, comment){
							if(type2 ==comment.id ) {
								html +="<option selected='selected' value='"+ comment.id +"'>"+comment.name+"</option>";
							}else {
								html +="<option  value='"+ comment.id +"'>"+comment.name+"</option>";
							}
                         });
					 $('#customerType2ID').html(html);
					loadType3();
				}
	          });
	}

	function loadType3() {
		var typeID =  $('#customerType2ID').children('option:selected').val();
		var type3 =  ${customerInstance?.customerType?.id} +"";
		$('#customerType3ID').empty();
		 $.ajax({
			 url:'${createLink(uri:'/customerType/loadType3')}',
				dataType:"json",
				data:{typeID:typeID},
				
				success:function(data) {
					var html = "";
                         $.each(data, function(commentIndex, comment){
							if(type3 ==comment.id ) {
								html +="<option selected='selected' value='"+ comment.id +"'>"+comment.name+"</option>";
							}else {
								html +="<option  value='"+ comment.id +"'>"+comment.name+"</option>";
							}
						                       
						  });
					 $('#customerType3ID').html(html);
				
				}
	          });
	}



	function chkimg(inp)
	{
		//alert(1);
		
		var hz = inp.substring(inp.lastIndexOf(".")+1);
		
		var patrn =/^(gif|jpg|jpeg|png|ico|bmp|GIF|JPG|JPEG|PNG|ICO|BMP){1}$/;
	    if(!patrn.test(hz)){
		    document.getElementById("licenseFile").value="";
			alert("营业执照必须是图片格式");
        }
		
	}

	
</script>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="customer.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${customerInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="customer.address.label" default="address" />
		
	</label>
	<g:textField name="address" value="${customerInstance?.address}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'tel', 'error')} ">
	<label for="tel">
		<g:message code="customer.tel.label" default="tel"  />
		
	</label>
	<g:textField name="tel" value="${customerInstance?.tel}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'license', 'error')} ">
	<label for="license">
		<g:message code="customer.license.label" default="license" />
		
	</label>
	<g:textField name="license" value="${customerInstance?.license}" />
	
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'license', 'error')} ">
	<label for="license">
		<g:message code="customer.licensePicUrl.label" default="license" />
		
	</label>
	<%--<g:textField name="license" value="${customerInstance?.license}"/>
--%>
    <input type="file" id='licenseFile' name="licenseFile"  onchange="chkimg(this.value)"/>
    (只能上传图片格式的文件)
   </div>

   
   
<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'customerType', 'error')} ">
	<label for="customerType">
		<g:message code="customer.customerType.label" default="Customer Type" />
		
	</label>
	<div style="display: none;">
	<%--<g:select id="customerType" name="customerType.id" from="${CustomerTypeLevel3.list() }" optionKey="id" optionValue="name" value="${customerInstance?.customerType?.id}"/>
	--%></div>
	
	<g:select id="customerTypeID" name="customerTypeID" from="${CustomerType.list() }" optionKey="id" optionValue="name" onchange="loadType2()"  value="${customerInstance?.customerType?.level2?.level1?.id}"/>
	<select id="customerType2ID" name="customerType2ID" onchange="loadType3()">
	
	</select>
	
	<select id="customerType3ID" name="customerType.id">
	
	</select>
</div>

