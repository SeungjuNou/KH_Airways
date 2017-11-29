<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KH - Airline</title>

<link rel="stylesheet" type="text/css" href="_css/Icomoon/style.css?ver=1" />
<link rel="stylesheet" type="text/css" href="_css/main.css?ver=1"/>
<link rel="stylesheet" href="_css/flickity-docs.css?ver=1" media="screen">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css?ver=1">

<script type="text/javascript" src="_scripts/jquery-2.0.2.min.js?ver=1"></script>
<script type="text/javascript" src="_scripts/jquery-ui-1.10.4.min.js?ver=1"></script>
<script type="text/javascript" src="_scripts/jquery.isotope.min.js?ver=1"></script>

<script type="text/javascript" src="_scripts/animated-header.js?ver=1"></script>
<script type="text/javascript" src="_scripts/flickity.pkgd.min.js?ver=1"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?ver=1"></script>


  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css?ver=1">
  <link rel="stylesheet" href="/resources/demos/style.css?ver=1">
  <script src="https://code.jquery.com/jquery-1.12.4.js?ver=1"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?ver=1"></script>



</head>
<body>

<!--  top_header -->
<div id="wrapper">
	<div id="header">
		<div id="header-inner">
			<div id="header-inner-logo">
				<div id="header-inner-logo-icon">
					
					<img src="_assets/icon.png" id="main_icon" data-button="1" />

				</div>
			</div>
			<div id="header-inner-nav">
				<ul>
					<li><p data-button="1"><b>항공권예매</b></p></li>
					<li><p data-button="2"><b>마일리지</b></p></li>
					<li><p data-button="3"><b>마이페이지</b></p></li>
					<li id="member">
						<p data-button="4"><b>Seungju Nou</b></p>
						<ul>
							<li data-button="4" id="login2">로그인</li>
							<li data-button="4" id="join2">회원가입</li>
							<li>mypage</li>
							<li>예약조회</li>
							<li>관리자페이지</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="tab" data-section="1">
		
		<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
      		<source src="_assets/main2.mp4" type="video/mp4">
		</video>


		<div class="tab-headline">
			<div id="search_flight">
				<div id="sf_text">항공편 조회하기</div>

				<div id="check_return">
					<input type="checkbox" name="return" value="return" checked="checked" >왕복&nbsp;
					<input type="checkbox" name="oneway" value="oneway">편도
				</div>

				<div id="select_way">
					
					<input type="text" name="dep_area" id="dep_area" placeholder="출발지 선택" />
		
					<div class="dep_area2">

					</div>


					<input type="text" name="dep_area" id="dep_area" placeholder="도착지 선택" />
		
					<div class="dep_area2">
					
  						


					</div>


					
					<div id="dep_date">
						출국일
						<input type="date" id="userdate" name="userdate" value="2017-11-13">
            		</div>

            		<div id="arr_date">
            			귀국일
                		<input type="date" id="userdate" name="userdate" value="2017-11-13">
            		</div>

				</div>

				<div id="people_count">
					성인
					<select name="adult_count" id="adult_count">
					    <option value="">1명</option>
					    <option value="">2명</option>
					    <option value="">3명</option>
					    <option value="">4명</option>
					</select>
					
					소아
					<select name="adult_count" id="child_count">
					    <option value="">1명</option>
					    <option value="">2명</option>
					    <option value="">3명</option>
					    <option value="">4명</option>
					</select>

					유아 
					<select name="adult_count" id="baby_count">
						
					    <option value="">1명</option>
					    <option value="">2명</option>
					    <option value="">3명</option>
					    <option value="">4명</option>
					</select>

					<div id="search_fl">
						<button>조회</button>
					</div>
					
				</div>
			</div>
		</div>
	</div>

	<div class="tab" data-section="2">
	
		<img src="_assets/1.JPG"/>

		<div id="tab-headline3">
			<div id="line3_inner">

				<div class="hero-gallery js-flickity" data-js-module="hero-gallery">
					
					<div class="hero-gallery__cell hero-gallery__cell--1">
						<div class="hero-gallery__cell__content">
							<h1>&nbsp;&nbsp;마일리지 적립</h1>
							<div id="mi_text">
								<p class="tagline">
								&nbsp;&nbsp;항공편에 탑승시마다 일정 마일리지를 적립할 수 있습니다. <br />
								&nbsp;&nbsp;탑승 마일리지를 를 모아보세요.
								</p>	
							</div>
							
						</div>
					</div>

					<div class="hero-gallery__cell hero-gallery__cell--1">
						<div class="hero-gallery__cell__content">
							<h1>&nbsp;&nbsp;보너스 항공권</h1>
							<div id="mi_text">
								<p class="tagline">
								&nbsp;&nbsp;마일리지를 사용해서 놀라운 경험을 만끽하세요 <br />
								&nbsp;&nbsp;탑승 마일리지를 이용한 보너스항공편을 조회할 수 있습니다.	
								</p>	
							</div>
						</div>
					</div>
					
					    
				</div>
				
			</div>
		</div>
	</div>

	<div class="tab" data-section="3">
		
		<img src="_assets/2.JPG" alt="" />
		
		<div class="tab-headline">
			<a href="#">
			<p>
				마이페이지로 가기
				<img src="_assets/arrow2.png" id="arrow" />
			</p>
			</a>
		</div>
	</div>

</div>

<div id="top" >
<a ><img src="_assets/top.png" alt="" width="30px" height="30px" data-button="1"/></a>

</div>


<div id="member_form">
	<div id="login_form">
		<form  action="#" autocomplete="on"> 
			<p> 
				<input id="username" name="username" required="required" type="text" placeholder="ID"/>
			</p>
			<p> 
				<input id="password" name="password" required="required" type="password" placeholder="Password" /> 
			</p>
			<p class="keeplogin"> 
				<input id="login" type="submit" value="로그인" /> 
			</p>
		</form>
	</div>

	<div id="login-form-close">
		<img src="_assets/close.png" alt="" />
	</div>

</div>			

<div id="join-wrap">

	<div id="join-form">
		<form action="#" id="join3">
			<h2>회원가입</h2>
			<input type="text" placeholder="아이디 - ID" required="required"/>
			<input type="password" placeholder="비밀번호 - PASSWORD" required="required"/>
			<input type="password" placeholder="재입력 - PASSWORD2" required="required"/>
			<input type="text"  placeholder="한글이름 - NAME" required="required"/>
			<div id="join_line2">
				<input type="text" placeholder="영문 성 - LAST NAME" required="required"/>
				<input type="text" placeholder="영문 이름 - FIRST NAME" required="required"/>
			</div>
			<input type="date" placeholder="생년월일 - BIRTH" required="required"/>
			<input type="text" placeholder="연락처 - PHONE"  required="required"/>
			<input type="text" placeholder="이메일 - EMAIL"  required="required"/>
			<div id="join_line2">
				<input type="reset" />
				<input type="submit" />
			</div>
		</form>
                   
		<div id="join-form-close">
			<img src="_assets/close.png" alt="" />
		</div>

	</div>
	
</div>


<script>



    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $("#dep_area").click(function(){
            $('.dep_area2').show("slow");
        });

        $(document).mouseup(function(e){
        	var container = $(".dep_area2");
        	if (container.has(e.target).length === 0){
				container.hide("slow");
			}
        });


        $("#join, #join2").click(function(){
            $("#join-wrap").fadeIn(450);
        });

        $("#join-form-close").click(function(){
            $("#join-wrap").fadeOut(450);
        });

        $("#login2").click(function(){
            $("#member_form").fadeIn(450);
        });

        $("#login-form-close").click(function(){
            $("#member_form").fadeOut(450);
        });


    });




</script>

</body>
</html>
