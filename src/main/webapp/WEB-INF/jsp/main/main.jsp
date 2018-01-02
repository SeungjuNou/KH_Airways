<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KH - Airline</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script type="text/javascript">
	$( function() {
		$("input[name=DEP_DATE1]").datepicker(
			{dateFormat: "yy-mm-dd"}
		);
		$("input[name=DEP_DATE2]").datepicker(
			{dateFormat: "yy-mm-dd"}
		);
	} );
	
	
	
</script>
 

<script type="text/javascript" src="_scripts/jquery-2.0.2.min.js?ver=1"></script>
<script type="text/javascript" src="_scripts/jquery-ui-1.10.4.min.js?ver=1"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="_scripts/animated-header.js?ver=1"></script>
<script type="text/javascript" src="_scripts/flickity.pkgd.min.js?ver=1"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?ver=1"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js?ver=1"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?ver=1"></script>

<link rel="stylesheet" type="text/css" href="_css/Icomoon/style.css?ver=1" />
<link rel="stylesheet" type="text/css" href="_css/main.css?ver=1"/>
<link rel="stylesheet" href="_css/flickity-docs.css?ver=1" media="screen">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css?ver=1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


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
					<li><p data-button="6"></p></li>
					<li><p data-button="6"></p></li>
					<li><p data-button="1"><b>항공권예매</b></p></li>
					<li id="member">
						<c:if test="${empty sessionScope.ID}">
						<p data-button="4"><b>member</b></p>
						<ul>
							<li data-button="4" id="login2">로그인</li>
							<li data-button="4" id="join2">회원가입</li>
						</ul>
						</c:if>
						
						<c:if test="${!empty sessionScope.ID}">
						<p data-button="4"><b>${sessionScope.MEM_NAME}</b></p>
						<ul>
							<li><a href="/khteam1/login/logOut.do">로그아웃</a></li>
							<li><a href="/khteam1/myPage/viewMember.do">마이페이지</a></li>
						</ul>
						</c:if>
						
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
				
				
				</div>

			<form action="/khteam1/book/flightSearch.do" method="post">

				<div id="select_way">
					
					<input type="text" name="DEP" id="dep_area1" class="dep_area" placeholder="출발지 선택" />
		
					<div class="dep_area2">

						<ul>
							<c:forEach items="${list }" var="row">
			                    <li><button type="button" class="rowDep" value="${row.DEP}">${row.DEP}</button></li>
			                </c:forEach>
						</ul>

					</div>


					<input type="text" name="ARR"  id="dep_area0" class="dep_area" placeholder="도착지 선택" />
		
					<div class="dep_area2">
					
	  						 <ul id="arr2">
	  						
							</ul> 
					</div>


					
					<div id="dep_date">
						출국일
						<input type="date" id="userdate" name="DEP_DATE1" value="2017-12-04">
            		</div>

            		<div id="arr_date">
            			귀국일
                		<input type="date" id="userdate" name="DEP_DATE2" value="2017-12-13">
            		</div>

				</div>

				<div id="people_count">
					성인
					<select name="adult_count" id="adult_count">
					    <option value="1">1명</option>
					    <option value="2">2명</option>
					    <option value="3">3명</option>
					    <option value="4">4명</option>
					</select>
					
					유아
					<select name="child_count" id="child_count">
						<option value="0">0명</option>
					    <option value="1">1명</option>
					    <option value="2">2명</option>
					    <option value="3">3명</option>
					    <option value="4">4명</option>
					</select>

					<div id="search_fl">
						<button>조회</button>
					</div>
			</form>
				
				</div>
			</div>
		</div>
	</div>

	

</div>

<div id="top" >
<a ><img src="_assets/top.png" alt="" width="30px" height="30px" data-button="1"/></a>

</div>


<div id="member_form">
	<div id="login_form">
		<form  action="/khteam1/login/loginCheck.do" id="loging" autocomplete="on" method="post"> 
			<p> 
				<input id="ID" name="ID" required="required" type="text" placeholder="ID"/>
			</p>
			<p> 
				<input id="PASSWORD" name="PASSWORD" required="required" type="password" placeholder="Password" /> 
			</p>
			<p class="keeplogin">  
				<input id="login" type="submit" value="로그인" />
				<button id="login" class="findId">아이디 찾기</button> 
			</p>
			
		</form>
	</div>

	<div id="login-form-close">
		<img src="_assets/close.png" alt="" />
	</div>

</div>			

<div id="join-wrap">

	<div id="join-form">
		<form action="/khteam1/join/insertMember.do" id="join3" method="post">
			<h2>회원가입</h2>
			<input type="text" id="ID" class="ID" name="ID" placeholder="아이디 - ID" required="required"/>
			<input type="password" id="PASSWORD" name="PASSWORD" placeholder="비밀번호 - PASSWORD" required="required"/>
			<input type="password" placeholder="재입력 - PASSWORD2" required="required"/>
			<input type="text" id="NAME" name="NAME" placeholder="한글이름 - NAME" required="required"/>
			<div id="join_line2">
				<input type="text" id="E_FIRST" name="E_FIRST" placeholder="영문 성 - LAST NAME" required="required"/>
				<input type="text" id="E_LAST" name="E_LAST" placeholder="영문 이름 - FIRST NAME" required="required"/>
			</div>
			<input type="text" id="BIRTH" name="BIRTH" placeholder="생년월일 - BIRTH" required="required"/>
			<input type="text" id="PHONE" name="PHONE" placeholder="연락처 - PHONE"  required="required"/>
			<input type="text" id="EMAIL" name="EMAIL" placeholder="이메일 - EMAIL"  required="required"/>
			<div id="join_line2">
				<input type="reset" value="다시작성"/>
				<input id="joinSubmit" type="submit" value="회원가입" />
			</div>
		</form>
                   
		<div id="join-form-close">
			<img src="_assets/close.png" alt="" />
		</div>

	</div>
	
</div>


<script>

$(".dep_area").click(function() { 
	var dep = "DEP=" + $(".dep_area").val();
	flight(dep);	
	function flight(dep) {
		//페이지 열릴때 시작
			$.ajax({
					type: "get",
					url: "arrRouteList.do",
					data: dep,
					success: function(data){
					
						$("#arr2").empty();
						
						$.each(data, function(i, item) {
							$("#arr2").append(
									"<li><button type='button' class="
									+ "rowDep2" + 
									" value=" + item.ARR + ">" + 
									item.ARR +
									"</button></li>"
									);
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
			                     $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; background:none;"><img src="_assets/ajax_loader.gif" style="width:200px; height:200px;"></div>');
			              }

			       } //beforesend
			       
			       , complete: function () {
	                     $("#div_ajax_load_image").hide();
			       }

					
			
			});
	}
	
}); 



$(".ID").keyup(function() { 
	
	var id = "ID=" + $(".ID").val();
	
	checkId(id);

	function checkId(id) {
		//페이지 열릴때 시작
			$.ajax({
					type: "get",
					url: "member/checkId.do",
					data: id,
					success: function(data){
						$(".ID").css('background', 'rgba(149, 234, 145, 0.6)');
						$(".ID").css('color', 'white');
						$("#joinSubmit").attr("disabled", false);
						if (data == "n") {
							$("#joinSubmit").attr("disabled", true);
							$(".ID").css('background', 'rgba(255, 72, 50, 0.6)');
						} else {
							$("#joinSubmit").attr("disabled", false);
							$(".ID").css('background', 'rgba(149, 234, 145, 0.6)');
						}

						
					}//success
			
			});
	}
	
}); 






$(document).bind('ready ajaxComplete', function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".dep_area").click(function(){
            $(this).next($(".dep_area2")).show("slow");
        });

        $(document).mouseup(function(e){
        	var container = $(".dep_area2");
        	if (container.has(e.target).length === 0){
				container.hide("slow");
			}
        });
		
        $(".rowDep").click(function(){
            $("#dep_area1").val($(this).val());
        });
        
        $(".rowDep2").click(function(){
            $("#dep_area0").val($(this).val());
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
        
        //ID찾기
        $(".findId").click(function(event){
        	event.preventDefault();
        	var url = "findId.do";
        	var name = "ID찾기";
        	var width=500, height=300;
        	var left = (screen.availWidth - width)/2;
        	var top = (screen.availHeight - height)/2;
        	var specs = "width=" + width;
        	specs += ",height=" + height;
        	specs += ",left=" + left;
        	specs += ",top=" + top;
        	window.open(url,name,specs);
        });
       
    }); 
    
//로그인
$("#loging").bind("submit", function(event){
	event.preventDefault();
	var url = $(this).attr("action");
	var loginData = $(this).serialize();
	$.ajax({
		url: url,
		type: "POST",
		data: loginData,
		success: function(data) {
			if(data == false) {
				alert("ID 또는 PASSWORD가 다릅니다.");
			} else {
				alert("로그인 되었습니다.");
				location.href="main.do";
			}
		}		
	});
});




</script>

</body>
</html>
