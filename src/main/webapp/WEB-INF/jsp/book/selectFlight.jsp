<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>KH - Airline</title>

<link rel="stylesheet" type="text/css" href="_css/Icomoon/style.css" />
<link rel="stylesheet" type="text/css" href="_css/animated-header.css?ver=0"/>
<link rel="stylesheet" href="_css/flickity-docs.css" media="screen">


<script type="text/javascript" src="_scripts/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="_scripts/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="_scripts/jquery.isotope.min.js"></script>


<script type="text/javascript" src="_scripts/animated-header.js"></script>
<script type="text/javascript" src="_scripts/flickity.pkgd.min.js"></script>


</head>
<body>

<!--  top_header -->
<div id="wrapper">
	<div id="header">
		<div id="header-inner">
			<div id="header-inner-logo">
				<div id="header-inner-logo-icon">
					
					<img src="_assets/icon.png" id="main_icon"  />

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
			<h3>출발편<h3>
			<ul class="total_sel_dep"></ul>
		</div>

		<div id="total_arr">
			<button class="dep_reset">초기화</button>
		</div>
		
	</div>



	<div class="tab" data-section="1">
		
		<img src="_assets/1.jpg" alt="" />
	
		
		<div class="tab-headline">
			
			<div id="tab_menu">
				<ul>
					<li data-button="1" id="select_li">출국편 선택</li>
					<li data-button="2">귀국편 선택</li>
				</ul>		
			</div>

			<div id="search_dep">

				<div id="date_list">
					<ul id="date_choice">
						<li>11월 20일</li>
						<li>11월 21일</li>
						<li>11월 22일</li>
						<li>11월 23일</li>
						<li>11월 24일</li>
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
					<div id="flight_title2">
						<div class="line3">
							<ul>
								<li id="line">LH713</li>
								<li id="line2">인천국제공항(ICN)</li>
								<li id="line">15:30</li>
								<li id="line2">프랑크푸르트(FRA)</li>
								<li id="line">19:20</li>
								<li class="line_more">
										<img src="_assets/arrow.png" />
								</li>
							</ul>
							<ul class="hide" id="hide2">
								<div>
									<li>소요시간 : 10시간 15분 탑승가능인원 : 200명 </li>
									<button class="choice" value="LH713">선택하기</button>
								</div>
							</ul>
						</div><!--반복요소 -->
						<div class="line3">
							<ul>
								<li id="line">LH713</li>
								<li id="line2">인천국제공항(ICN)</li>
								<li id="line">15:30</li>
								<li id="line2">프랑크푸르트(FRA)</li>
								<li id="line">19:20</li>
								<li class="line_more">
										<img src="_assets/arrow.png" />
								</li>
							</ul>
							<ul class="hide" id="hide2">
								<li>소요시간 : 10시간 15분         탑승가능인원 : 200명 </li>
							</ul>
						</div><!--반복요소 -->
						<div class="line3">
							<ul>
								<li id="line">LH713</li>
								<li id="line2">인천국제공항(ICN)</li>
								<li id="line">15:30</li>
								<li id="line2">프랑크푸르트(FRA)</li>
								<li id="line">19:20</li>
								<li class="line_more">
										<img src="_assets/arrow.png" />
								</li>
							</ul>
							<ul class="hide" id="hide2">
								<li>소요시간 : 10시간 15분         탑승가능인원 : 200명 </li>
							</ul>
						</div><!--반복요소 -->
					</div>
				</div><!-- flight_list -->
				
			</div>

		</div> <!-- tab-headline -->

	</div>





	<div class="tab" data-section="2">
		
		<img src="_assets/1.jpg" alt="" />
	
		
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
						<li>11월 20일</li>
						<li>11월 21일</li>
						<li>11월 22일</li>
						<li>11월 23일</li>
						<li>11월 24일</li>
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
					<div id="flight_title2">
						<div class="line3">
							<ul>
								<li id="line">LH713</li>
								<li id="line2">인천국제공항(ICN)</li>
								<li id="line">15:30</li>
								<li id="line2">프랑크푸르트(FRA)</li>
								<li id="line">19:20</li>
								<li class="line_more">
										<img src="_assets/arrow.png" />
								</li>
							</ul>
							<ul class="hide" id="hide2">
								<li>소요시간 : 10시간 15분         탑승가능인원 : 200명 </li>
							</ul>
						</div><!--반복요소 -->

						<div class="line3">
							<ul>
								<li id="line">LH713</li>
								<li id="line2">인천국제공항(ICN)</li>
								<li id="line">15:30</li>
								<li id="line2">프랑크푸르트(FRA)</li>
								<li id="line">19:20</li>
								<li class="line_more">
										<img src="_assets/arrow.png" />
								</li>
							</ul>
							<ul class="hide" id="hide2">
								<li>소요시간 : 10시간 15분         탑승가능인원 : 200명 </li>
							</ul>
						</div><!--반복요소 -->

						<div class="line3">
							<ul>
								<li id="line">LH713</li>
								<li id="line2">인천국제공항(ICN)</li>
								<li id="line">15:30</li>
								<li id="line2">프랑크푸르트(FRA)</li>
								<li id="line">19:20</li>
								<li class="line_more">
										<img src="_assets/arrow.png" />
								</li>
							</ul>
							<ul class="hide" id="hide2">
								<li>소요시간 : 10시간 15분         탑승가능인원 : 200명 </li>
							</ul>
						</div><!--반복요소 -->

						<div class="line3">
							<ul>
								<li id="line">LH713</li>
								<li id="line2">인천국제공항(ICN)</li>
								<li id="line">15:30</li>
								<li id="line2">프랑크푸르트(FRA)</li>
								<li id="line">19:20</li>
								<li class="line_more">
										<img src="_assets/arrow.png" />
								</li>
							</ul>
							<ul class="hide" id="hide2">
								<li>소요시간 : 10시간 15분         탑승가능인원 : 200명 </li>
							</ul>
						</div><!--반복요소 -->
					</div>
				</div>
				
			</div>
			
		</div>

	</div>





</div>


<script>

    $(document).ready(function(){
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

        $(".choice").unbind("click").bind("click", function(){
            var dep = $(this).attr('value');
            $("<li>"+ dep +"</li>").appendTo(".total_sel_dep");
            $("<li>icn - fra</li>").appendTo(".total_sel_dep");
            $("<li>인천 - 프랑크푸르트</li>").appendTo(".total_sel_dep");
            $("<li></li>").appendTo(".total_sel_dep");
            $(".choice").attr('disabled',true);
        });

        $(".dep_reset").unbind("click").bind("click", function(){
        	$(".total_sel_dep>li").remove();
            $(".choice").attr('disabled',false);
        });

    });


</script>




</body>
</html>
