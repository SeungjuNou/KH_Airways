<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html en="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>KH - Airline</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="../_css/bootstrap.min.css" rel="stylesheet">
<link href="../_css/metisMenu.min.css" rel="stylesheet">
<link href="../_css/startmin.css" rel="stylesheet">
<link href="../_css/morris.css" rel="stylesheet">
<link href="../_css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
	
<link rel="stylesheet" type="text/css" href="../_css/card.css" />
<link rel="stylesheet" type="text/css" href="../_css/animated-header.css?ver=0"/>
<link rel="stylesheet" type="text/css" href="../_css/mypage.css" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="../_scripts/card.js"></script>
<script type="text/javascript" src="../_scripts/flickity.pkgd.min.js"></script>

</head>
<body>

	<!--  top_header -->
	<div id="wrapper">

		<div id="top-1"></div>

		<div id="top-2">
			<div id="logo">
				<img src="../_assets/icon.png" alt="" />
			</div>
			<ul>
				<div id="menu">
					<li id="empty2"></li>
					<li>항공권 예매</li>
					<li>웹 체크인</li>
					<li>Seungju nou</li>
				</div>
			</ul>
		</div>

		<div id="body">
			<div id="body-inner">
				<div id="inner2">
					<ul>
						<li id="select-inner">
							<div>마이 페이지</div>
						</li>
						<li>마일리지</li>
						<li>나의 예약</li>
						<li>웹 체크인</li>
						<li id="empty">&nbsp;</li>
					</ul>
				</div>

				<div id="inner3">

					<form action="/book/bookPay.do" method="POST" onsubmit="if (handled) return false">
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">

										<div class="panel-heading">
											<h2>결제</h2>
										</div>	

										<input type="button" id="credit" value="신용카드 결제" />
                                		<input type="button" value="마일리지 결제" />
								</div>	
							</div>
							<!-- col 12 end -->
						</div>
						<!-- /.row -->
					</form>

				</div>
			</div>
		</div>
	</div>


	<div id="card_pay">
        <div class="demo-container">
            <h2>카드정보 입력</h2>
            <div class="card-wrapper"></div>
  
            <div class="form-container active">
                <form action="" id="card_info">
                    Card number :&nbsp;&nbsp;<input placeholder="Card number" type="text" name="number">
                    Card holder &nbsp;&nbsp;:&nbsp;&nbsp;<input placeholder="Full name" type="text" name="name">
                    Expiry date &nbsp;&nbsp;:&nbsp;&nbsp;<input placeholder="MM/YY" type="text" name="expiry">
                    CVC number :&nbsp;&nbsp;<input placeholder="CVC" type="text" name="cvc">
                    <input type="reset" value="초기화" />
                    <input type="submit" value="결제" />
                </form>
            </div>
        </div>      

        <div id="close5">
            <img src="../_assets/close.png" alt="" />
        </div>  
        
   </div>



	<!-- jQuery -->
	<script src="../_scripts/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../_scripts/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../_scripts/metisMenu.min.js"></script>


	<!-- Custom Theme JavaScript -->
	<script src="../_scripts/startmin.js"></script>


	<script>

	    $(document).ready(function(){
	        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	        $("#credit").click(function(){
	            $("#card_pay").fadeIn(450);
	        });

	        $("#close5>img").click(function(){
	            $("#card_pay").fadeOut(450);
	        });

	    });


	     $('.active form').card({
	            container: $('.card-wrapper')
	    })


	</script>




</body>
</html>