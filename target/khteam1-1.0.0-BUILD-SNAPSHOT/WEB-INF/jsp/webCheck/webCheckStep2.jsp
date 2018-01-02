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

<link rel="stylesheet" type="text/css" href="<c:url value='../_css/mypage.css?ver=1'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='../_css/bootstrap.min.css?ver=1'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='../_css/metisMenu.min.css?ver=1'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='../_css/timeline.css?ver=1'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='../_css/startmin.css?ver=1'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='../_css/morris.css?ver=1'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='../_css/font-awesome.min.css?ver=1'/>" />
<link rel="stylesheet" type="text/css" href="../_css/selectSeat.css?ver=1" />

<script type="text/javascript" src="<c:url value='../_scripts/jquery-2.0.2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='../_scripts/jquery-ui-1.10.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='../_scripts/jquery-2.0.2.min.js'/>"></script>

</head>
<body>

	<!--  top_header -->
	<div id="wrapper">

		<div id="top-1"></div>

		<div id="top-2">
			<div id="logo">
			
			<a href="../main.do">	<img src="<c:url value='../_assets/icon.png'/>" alt="" /> </a>
			</div>
			<ul>
				<div id="menu">
					<li id="empty2"></li>
					<li>항공권 예매</li>
					<li>웹 체크인</li>
					<a href="../myPage/viewMember.do"><li>${sessionScope.MEM_NAME}</li></a>
					<a href="../login/logOut.do"><li>로그아웃</li></a>
				</div>
			</ul>
		</div>

		<div id="body">
			<div id="body-inner">
				<div id="inner1">
					<ul>
						<a href="../myPage/viewMember.do">
						<li>
							<h2>마이 페이지</h2>
						</li>
						</a>
						<a href="../myPage/viewMember.do"><li>${sessionScope.MEM_NAME}</li></a>
					</ul>    
				</div>
            
            <div id="inner2">
                <ul>
                    <li class="select-inner"><a href="../myPage/viewMember.do">회원 정보</a></li>
                    <li class="select-inner"><a href="../myPage/milesList.do">상세 마일리지</a></li>
                    <li class="select-inner"><a href="../myPage/mybookList.do">예약 현황</a></li>
                    <li class="select-inner"><a href="../webcheck/openCheckin.do">웹 체크인</a></li>
                    <li id="empty">&nbsp;</li>
                </ul>
            </div>



		<!-- Page Content -->
		<div id="body">
			<div id="body-inner">
				<div id="inner3">
					<div class="row">
						<div class="col-lg-12">
							<h2 class="page-header">WEB CHECKIN STEP2</h2>
						</div>
					</div>
   
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h2>좌석 지정</h2>
								</div>
								<!-- /.panel-heading -->
								<div class="panel-body">

									<div class="row">

										<div class="col-lg-4">
											<div class="panel panel-default">
												<div class="panel-body text-right">
													<h3>좌석을 선택하세요.</h3>
													<form action="webCheckStep3.do" method="POST">
														<div id="dndhkd2"></div>
														<button type="button" id="re" value="7"
															class="seatReset btn btn-primary">좌석 다시선택</button>
														<button type="submit" id="next"
															class="pg1 btn btn-primary">계속</button>
													</form>

												</div>
											</div>
										</div>


										<div class="col-lg-8">
											<div class="panel panel-default">
												<div class="panel-body">

													<div class="seat2">
														<table id="seatTable">
															<tr id="abcLine">
																<td class="line"></td>
																<td class="qls"></td>
																<td class="seat">A</td>
																<td class="seat">B</td>
																<td class="qls">&nbsp;</td>
																<td class="seat">C</td>
																<td class="seat">D</td>
																<td class="seat">E</td>
																<td class="seat">F</td>
																<td class="qls">&nbsp;</td>
																<td class="seat">G</td>
																<td class="seat">H</td>
															</tr>
															
															<c:forEach var="var" items="${list}" varStatus="status">
		
															<tr>
																<td class="line">${status.count}</td>
																<td class="qls"></td>
																<td class="seat">
																	<button id="${status.count}A" value="${status.count}A" class="seatButton abc" /></button>
																</td>
																<td class="seat">
																	<button id="${status.count}B" value="${status.count}B" class="seatButton abc" /></button>
																</td>
																<td class="qls"></td>
																<td class="seat">
																	<button id="${status.count}C" value="${status.count}C" class="seatButton abc" /></button>
																</td>
																<td class="seat">
																	<button id="${status.count}D" value="${status.count}D" class="seatButton abc" /></button>
																</td>
																<td class="seat">
																	<button id="${status.count}E" value="${status.count}E" class="seatButton abc" /></button>
																</td>
																<td class="seat">
																	<button id="${status.count}F" value="${status.count}F" class="seatButton abc" /></button>
																</td>
																<td class="qls"></td>

																<td class="seat">
																	<button id="${status.count}G" value="${status.count}G" class="seatButton abc" /></button>
																</td>
																<td class="seat">
																	<button id="${status.count}H" value="${status.count}H" class="seatButton abc" /></button>
																</td>
															</tr>
															</c:forEach>
															




														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- /.panel-body -->
								</div>
								<div class="panel-footer"></div>
							</div>
							<!-- /.panel -->
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
	</div>
	<!-- /.row -->


	<script>
		var arr = []; //서버에 지정된 좌석
		var arr2 = []; //유저가 선택한 좌석

		var people = 1;
		var peopleCount = ${map.COUNT};
		var num;

		$(document)
				.ready(
						function() {
							reset();

							function reset() {

								$
										.ajax({
											type : "post",
											data : "",
											url : "seatCheck.do",
											success : function(data) {
												//ajax호출해서 좌석만 확인하면 됨. 

												$.each(data, function(index,
														item) {
													arr.push(item);
												});

												$
														.each(
																arr,
																function(index,
																		item) {
																	var seatNo = item;
																	var id = "#"
																			+ seatNo;
																	$(id)
																			.attr(
																					'disabled',
																					true);
																	$(id)
																			.css(
																					'background',
																					'url(/_assets/noneable.jpg) no-repeat');
																	$(id)
																			.css(
																					'background-size',
																					'100%');
																	$(id)
																			.css(
																					'border',
																					'none');
																});
											}

										});

							}
							;

							$('.reserve').click(function() {
								people--;

								$(this).addClass('.abc');
							});

							$('#next')
									.click(
											function() {

												var countNo = $('.reserve').length;

												arr2 = [];

												$.each($('.reserve'), function(
														index) {
													var seatNo = $(this).val();
													arr2[index] = seatNo;
												})

												var str = arr2.join(",");
												str = str + ",";
												$(
														"<input type='hidden' id='seat' name=seat value='"+str+"' />")
														.appendTo('#dndhkd2');
												$("<p>" + str + "</p>").appendTo('#dndhkd2');

											});

							$('.seatButton').click(function() {
								$(this).toggleClass('reserve');
								var str = ($(this).val());

								var id = "#" + $(this).val();
								var id2 = ".li" + num;

								$(this).removeClass('.abc');

								reset();

							});

							$('.abc').click(function() {

								var countNo = $('.reserve').length;

								if (countNo >= peopleCount) {
									$('.abc').attr('disabled', true);
									$(this).addClass('abc');
								} else {
									$('.abc').attr('disabled', false);
								}

								reset();
							});

							$(document).bind('ready ajaxComplete', function() {
								$('.seatReset').click(function() {
									$('#dndhkd2').empty();
									$('.seatButton').attr('disabled', false);
									$('.reserve').removeClass('reserve');
									$('.pg').attr('disabled', false);
									people = 1;
									reset();

									$('.seatButton>b').empty();
								});

							});

						});

		/* $(document).bind('ready ajaxComplete', function(){
			
			$('.reserve').click(function() {
				people--;
				alert(people);
				$(this).addClass('.abc');
			});
			

			$('#next').click( function() {
				
				var countNo = $('.reserve').length;

				arr2 = [];
				
				$.each($('.reserve'), function(index) {
					var seatNo = $(this).val();
					arr2[index] = seatNo;
				})

				var str = arr2.join(",");

				$("<input type='hidden' id='seat' name=seat value='"+str+"' />")
						.appendTo('#dndhkd2');
				$("<p>" + str + "</p>").appendTo('#dndhkd2');

			});
			
			

			$('.seatButton').click(function() {
				$(this).toggleClass('reserve');
				var str = ($(this).val());

				var id = "#" + $(this).val();
				var id2 = ".li" + num;

				
				$(this).removeClass('.abc');
			
				reset(); 
				
			});
			
			$('.abc').click(function() {
				alert("sadf");
				var countNo = $('.reserve').length;
				alert(countNo);
				
				if (countNo >= peopleCount) {
					$('.abc').attr('disabled', true);
					$(this).addClass('abc');
				} else {
					$('.abc').attr('disabled', false);
				}

				reset();
			});
			
			
		}); */

		/*
		 $('.seatReset').click(function(){
		 $('#dndhkd2').empty();
		 $('.seatButton').attr('disabled',false);
		 $('.reserve').removeClass('reserve');
		 $('.pg').attr('disabled',false);
		 people = 1;
		 reset();

		 $('.seatButton>b').empty();
		 });
		


		 $('.pg').click(function(){
		 num = $(this).val();
		 var numid = "#"+num;
		 $('.reserve').attr('disabled',true);
		 $('.seatButton').attr('disabled',false);
		
		 reset();
		 });


		 */
	</script>


	<!-- jQuery -->
	<script src="../_scripts/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../_scripts/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../_scripts/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../_scripts/startmin.js"></script>
</body>
</html>