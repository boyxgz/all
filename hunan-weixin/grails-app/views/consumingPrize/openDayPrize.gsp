<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<link rel="stylesheet" href="${resource(dir:'css/reset.css')}">
<link rel="stylesheet" href="${resource(dir:'css/atom.css')}">
<link rel="stylesheet" href="${resource(dir:'css/global.css')}">
<link rel="stylesheet" href="${resource(dir:'css/open.css')}?v=2">
<title>上班抢红包：中国石油湖南销售分公司</title>
</head>
<body ontouchstart="" class="open-body">
  <div class="wrapper">
    
    <div class="bg rotate"></div>
    <div class="open-has ">
      <h3 class="title-close"><span class="user">${furtherStep?"上班抢红包给你发了一个宝箱":message }</span></h3>
      <h3 class="title-open"></h3>

      <div class="mod-chest">
        
        <div class="chest-close show ">
          <div class="gift"></div>
          <g:if test="${furtherStep }">
          <div class="tips">
            <i class="arrow"></i>
          </div>
          </g:if>
        </div>
        <div class="chest-open ">
          <div class="mod-chest-cont open-cont">
            <div class="content">
              <div class="gift">
                <div id="prize_info"></div>
              </div>
              <div class="func">
                <button class="chest-btn" onclick="showVoucher()">查看全部红包</button>
              </div>
            </div>
          </div>
        </div>
        
      </div>
    </div>
    <div class="open-none" style="display:none">
      <h3>好遗憾，没中奖</h3>
      <div class="mod-chest">
        <div class="chest-open show"></div>
      </div>
      <div class="func">
        <button class="chest-btn">关闭</button>
      </div>
    </div>

  </div>
  <script type="text/javascript" src="${resource(dir:'js/zepto.min.js')}"></script>
<script type="text/javascript">
  <g:if test="${furtherStep }">
	function showVoucher() {
		document.location.href = "${myVoucherUrl}";
	}

  $(".chest-close").click(function(){

    $(this).addClass("shake");
    var that=this;
    
    this.addEventListener("webkitAnimationEnd", function(){
    	
        
      $(that).closest(".open-has").addClass("opened");
      setTimeout(function(){
        //


    	$.ajax({type:'get',url:'${resource(dir:'consumingPrize/drawOpenDayPrize')}/${ticket?.refusingCode}',success:function(data){
    		if(data.status) {
    			$(that).removeClass("show");
    			$(that).closest(".open-has").find(".title-open")[0].innerHTML = "恭喜您，中奖了！您的奖品是：" + data.voucherInfo;
    	        $(that).closest(".mod-chest").find(".chest-open").addClass("show");
        	} else {
        		$(that).closest(".open-has").find(".title-open")[0].innerHTML = "好遗憾，没中奖";
        		$(that).closest(".open-none").addClass("show")
            }
    		
    	}})

        
        //$(that).closest(".mod-chest").find(".chest-open").addClass("show");
        setTimeout(function(){
          $(".chest-open").addClass("blur");
        },500)
      },200)
    }, false);
  })
</g:if>
<g:elseif test="${forkUrl}">
  
$(".chest-close").click(function(){
	document.location.href = "${forkUrl}";
})
</g:elseif>
</script>
</body>
</html>