<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>KH - Airline</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='../_scripts/jquery-2.0.2.min.js'/>"></script>
<script src="<c:url value='../_scripts/jquery-ui-1.10.4.min.js'/>"></script>
<script src="<c:url value='../_scripts/jquery.isotope.min.js'/>"></script>

<script src="<c:url value='../_scripts/animated-header.js?ver=2'/>"></script>
<script src="<c:url value='../_scripts/flickity.pkgd.min.js'/>"></script>

<script type="text/javascript">
$(document).ready(function(){
	flight();//페이지 열릴때 시작
	
	function flight(param) {
		$.ajax({
				type: "get",
				url: "flightList.do",
				data: param,
				success: function(data){
					//출국 리스트
					if(data.list1 == "") {
						$(".flight_title4").empty();
						$(".flight_title4").append( 
						"<tr>" +
						"<td colspan='6'>조회된 결과가 없습니다.</td>" +
						"</tr>");
					} else {
						$(".flight_title4").empty();
						$.each(data.list1, function(i, item) {
							$(".flight_title4").append(
							
							"<div class='line3'>" +
								"<ul>"+
									"<li id='line'>"+ item.CODE + "</li>" +
									"<li id='line2'>"+data.route.DEP+" </li>" +
									"<li id='line'>"+data.route.TI_DEP+"</li>"+
									"<li id='line2'>"+data.route.ARR + "</li>" +
									"<li id='line'>"+data.route.TI_DEP+"</li>" +
									"<li class='line_more'>" +
									 "<img src='http://localhost:9090/khteam1/_assets/arrow.png' />" +
								"</li>" +
								"</ul>" +
								"<ul class='hide' id='hide2'>" +
									"<div>" +
										"<li>소요시간 : " + data.route.TI_FLY +
										" 항공료 :" + data.route.PRICE + "</li>" +
										"<button class='choice' id='c1' value='"+ item.ITI_NO +"'>선택하기</button>"+
									"</div>" +
								"</ul>"+
							"</div>" +
							
							"<div class = 'dep_inform' style=' display:none;' >" +
								"<h5>출국편</h5> " +
								"노선번호 : " + item.CODE + "<br>" +
								"출발지 : " + data.route.DEP + "<br>" +
								"도착지 : " + data.route.ARR +"<br>" +
							"</div>"
							
							

							);
						});
					}
					//귀국 리스트
					if(data.list2 == "") {
						$(".flight_title3").empty();
						$(".flight_title3").append( 
						"<tr>" +
						"<td colspan='6'>조회된 결과가 없습니다.</td>" +
						"</tr>");
					} else {
						$(".flight_title3").empty();
						$.each(data.list2, function(i, item) {
							$(".flight_title3").append(
								"<div class='line3'>" +
									"<ul>"+
										"<li id='line'>"+ item.ITI_NO + "</li>" +
										"<li id='line2'>"+data.route.DEP+" </li>" +
										"<li id='line'>"+data.route.TI_DEP+"</li>"+
										"<li id='line2'>"+data.route.ARR + "</li>" +
										"<li id='line'>"+data.route.TI_DEP+"</li>" +
										"<li class='line_more'>" +
										 "<img src='http://localhost:9090/khteam1/_assets/arrow.png' />" +
									"</li>" +
									"</ul>" +
									"<ul class='hide' id='hide2'>" +
										"<div>" +
											"<li>소요시간 : " + data.route.TI_FLY +
											" 항공료 :" + data.route.PRICE + "</li>" +
											"<button class='choice2' id='c2' value='"+ item.ITI_NO +"'>선택하기</button>"+
										"</div>" +
									"</ul>"+
								"</div>" +
								
								"<div class = 'dep_inform' style=' display:none;' >" +
									"<h5>귀국편</h5> " +
									"노선번호 : " + item.ITI_NO + "<br>" +
									"출발지 : " + data.route.DEP + "<br>" +
									"도착지 : " + data.route.ARR +"<br>" +
								"</div>"
							
							);
						});
					}			
					
					//날짜버튼
					$.each(data.date1, function(i, item) {
						$("button[id=date"+i+"]").val(item);
						$("button[id=date"+i+"]").text(item);
					});
					
					$.each(data.date2, function(i, item) {
						$("button[id=date2"+i+"]").val(item);
						$("button[id=date2"+i+"]").text(item);
					});		
				}//success	
				
				
				
				, beforeSend: function () {
		              var width = 0;
		              var height = 0;
		              var left = 0;
		              var top = 0;

		 

		              width = 50;
		              height = 50;
		              top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
		              left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();

		 

		              if($("#div_ajax_load_image").length != 0) {
		                     $("#div_ajax_load_image").css({
		                            "top": top+"px",
		                            "left": left+"px"
		                     });
		                     $("#div_ajax_load_image").show();
		              }
		              else {
		                     $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; background:none;"><img src="../_assets/ajax_loader.gif" style="width:200px; height:200px;"></div>');
		              }

		       } //beforesend
		       
		       , complete: function () {
                   $("#div_ajax_load_image").hide();
		       }
		       
		});//ajax
	}
	
	//날짜 버튼 클릭시
	$("button[name=TI_DEP1]").on("click", function(){
		var param = "TI_DEP1=" + $(this).val();
		flight(param);
		flight(param);
	});
	
	$("button[name=TI_DEP2]").on("click", function(){
		var param = "TI_DEP2=" + $(this).val();
		flight(param);
		flight(param);
	});
	
});





</script>

<link rel="stylesheet" type="text/css" href="<c:url value='../_css/Icomoon/style.css?ver=1'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='../_css/animated-header.css?ver=1'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='../_css/flickity-docs.css?ver=1'/>" media="screen">

</head>
<body>



<!--  top_header -->
<div id="wrapper">
	<div id="header">
		<div id="header-inner">
			<div id="header-inner-logo">
				<div id="header-inner-logo-icon">
					
					<img src="../_assets/icon.png" id="main_icon"  />

				</div>
			</div>
			<div id="header-inner-nav">
				<ul>
					<li><p><b>항공권예매</b></p></li>
					<li><p><b>마일리지</b></p></li>
					<li><p><b>마이페이지</b></p></li>
					<li id="member">
						<p><b>Seungju Nou</b></p>
						<ul>
							<li>로그아웃</li>
							<li>마이페이지</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>







	<div id="total_sum">

		<div id="total_dep">
			<ul class="total_sel_dep">
			</ul>
			<ul class="total_sel_dep2">
			</ul>
		</div>

		<form action="./flightBookingForm.do" method="post">
		<div id="total_arr">
			<input type="hidden" name="ITI_NO1">
			<input type="hidden" name="ITI_NO2">
			<button type="submit">다음</button>
		</div>
		</form>
		
	</div>



	<div class="tab" data-section="1">
		
		<img src="<c:url value='../_assets/1.JPG'/>" alt="" />
	
		
		<div class="tab-headline">
			
			<div id="tab_menu">
				<ul>
					<li data-button="1" id="select_li">출국편 선택</li>
					<li data-button="2">귀국편 선택</li>
				</ul>		
			</div>

			<div id="search_dep">

				<div id="date_list">
					<ul id="date_choice" class="ajaxButton1">
						<button class="ajaxButton" id="date0" name="TI_DEP1" onclick="javascript:this.onclick='';"></button>
						<button class="ajaxButton" id="date1" name="TI_DEP1" onclick="javascript:this.onclick='';"></button>
						<button class="ajaxButton" id="date2" name="TI_DEP1" onclick="javascript:this.onclick='';"></button>
						<button class="ajaxButton" id="date3" name="TI_DEP1" onclick="javascript:this.onclick='';"></button>
						<button class="ajaxButton" id="date4" name="TI_DEP1" onclick="javascript:this.onclick='';"></button>
					</ul>
				</div>

				<div id="flight_choice">
					
					<div id="flight_title">

						<ul>
							<li id="line">편명</li>
							<li id="line2">출발지</li>
							<li id="line">출발시간</li>
							<li id="line2">도착지</li>
							<li id="line">도착시간</li>
							<li>더보기</li>
						</ul>

					</div>
				</div>

				<div id="flight_list">
					<div id="flight_title2" class="flight_title4">


						


					</div>
				</div><!-- flight_list -->
				
			</div>

		</div> <!-- tab-headline -->

	</div>





	<div class="tab" data-section="2">
		<img src="<c:url value='../_assets/1.JPG'/>" />
		
		<div class="tab-headline">
			
			<div id="tab_menu">
				<ul>
					<li data-button="1" id="select_li">출국편 선택</li>
					<li data-button="2" id="select_li">귀국편 선택</li>
				</ul>		
			</div>

			<div id="search_dep">

				<div id="date_list">
					<ul id="date_choice">
						<button class="ajaxButton" id="date20" name="TI_DEP2"></button>
						<button class="ajaxButton" id="date21" name="TI_DEP2"></button>
						<button class="ajaxButton" id="date22" name="TI_DEP2"></button>
						<button class="ajaxButton" id="date23" name="TI_DEP2"></button>
						<button class="ajaxButton" id="date24" name="TI_DEP2"></button>
					</ul>
				</div>

				<div id="flight_choice">
					
					<div id="flight_title">

						<ul>
							<li id="line">편명</li>
							<li id="line2">출발지</li>
							<li id="line">출발시간</li>
							<li id="line2">도착지</li>
							<li id="line">도착시간</li>
							<li>더보기</li>
						</ul>

					</div>
				</div>

				<div id="flight_list">
					<div id="flight_title2" class="flight_title3">
						
					</div>
				</div>
				
			</div>
			
		</div>

	</div>


	


</div>


<script>

$(document).bind('ready ajaxComplete', function(){
       
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".line_more>img").click(function(){
            var submenu = $(this).closest("li").closest("ul").next("ul");
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
            	$(this).css('transform','rotate(0deg)');
                submenu.slideUp();
            }else{
            	$(this).css('transform','rotate(180deg)');
                submenu.slideDown();
            }
        });

       /*  $(".choice").unbind("click").bind("click", function(){
            var dep = $(this).attr('value');
            $("<li>"+ dep +"</li>").appendTo(".total_sel_dep");
            $("<li>"+ dep +"-"+arr+"</li>").appendTo(".total_sel_dep");
            $("<li></li>").appendTo(".total_sel_dep");
            $(".choice").attr('disabled',true);
        });

        $(".dep_reset").unbind("click").bind("click", function(){
        	$(".total_sel_dep>li").remove();
            $(".choice").attr('disabled',false);
        }); */

    });
    
    
//향공편 선택
$(document).bind('ready ajaxComplete', function(){
	$(".choice").on("click",function(e){
     	var row = ($(this).closest("div").closest("ul").closest("div").next("div")).html();     	
		var row2 = $(".total_sel_dep").html();
     	$("input[name=ITI_NO1]").val($(this).val());
     	if(row2 == '') {
     		$("<li>"+row+"</li>").appendTo(".total_sel_dep");
     	} else {
     		$(".total_sel_dep").empty();
     		$("<li>"+row+"</li>").appendTo(".total_sel_dep");
     	}
        
     });
	
	$(".choice2").on("click",function(e){
		var row = ($(this).closest("div").closest("ul").closest("div").next("div")).html();     	
		var row2 = $(".total_sel_dep2").html();
     	$("input[name=ITI_NO1]").val($(this).val());
     	if(row2 == '') {
     		$("<li>"+row+"</li>").appendTo(".total_sel_dep2");
     	} else {
     		$(".total_sel_dep2").empty();
     		$("<li>"+row+"</li>").appendTo(".total_sel_dep2");
     	}
        
     });
	
});


</script>




</body>
</html>
