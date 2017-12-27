<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KH - Airline</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" type="text/css"
	href="<c:url value='../_css/mypage.css?ver=1'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='../_css/bootstrap.min.css?ver=1'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='../_css/metisMenu.min.css?ver=1'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='../_css/timeline.css?ver=1'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='../_css/startmin.css?ver=1'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='../_css/morris.css?ver=1'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='../_css/font-awesome.min.css?ver=1'/>" />

<script type="text/javascript"
	src="<c:url value='../_scripts/jquery-2.0.2.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='../_scripts/jquery-ui-1.10.4.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='../_scripts/jquery-2.0.2.min.js'/>"></script>

</head>
<body>

	<!--  top_header -->
	<div id="wrapper">

		<div id="top-1"></div>

		<div id="top-2">
			<div id="logo">

				<a href="../main.do"> <img
					src="<c:url value='../_assets/icon.png'/>" alt="" />
				</a>
			</div>
			<ul>
				<div id="menu">
					<li id="empty2"></li>
					<li>항공권 예매</li>
					<li>웹 체크인</li>
					<li>${sessionScope.MEM_NAME}</li>
				</div>
			</ul>
		</div>

		<div id="body">
			<div id="body-inner">
				<div id="inner1">
					<ul>
						<li>
							<h2>마이 페이지</h2>
						</li>
						<li>${sessionScope.MEM_NAME}</li>
					</ul>
				</div>

				<div id="inner2">
					<ul>
						<li class="select-inner"><a href="../myPage/viewMember.do">회원
								정보</a></li>
						<li class="select-inner"><a href="../myPage/milesList.do">상세
								마일리지</a></li>
						<li class="select-inner"><a href="../myPage/mybookList.do">예약
								현황</a></li>
						<li class="select-inner"><a
							href="/khteam1/webcheck/openCheckin.do">웹 체크인</a></li>
						<li id="empty">&nbsp;</li>
					</ul>
				</div>
				<!-- Page Content -->
				<div id="body">
					<div id="body-inner">
						<div id="inner1">

							<div class="row">
								<div class="col-lg-12">
									<h2 class="page-header">WEB CHECKIN SUCCESS</h2>
								</div>
							</div>

							<div class="row">

								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="row">
											<div class="col-lg-12">
												<div class="well">
													<h3>체크인이 완료되었습니다.</h3>
													<p>
														탑승권 발급 : 각 승객별로 '탑승권 조회/인쇄' 버튼을 클릭하여 탑승권을 다운로드(출력)한 후, 출발
														당일 공항에서 제시하여 주시기 바랍니다.<br /> 수하물 위탁 : 위탁 수하물을 소지하신 고객님께서는
														항공기 출발 1시간 전까지 탑승권 표기된 웹 체크인 전용카운터를 이용해 주십시오.(전용 카운터 정보가
														없는 경우 일반 카운터 이용)<br /> 위탁 수하물이 없는 경우 카운터를 거치지 않고 출국장 입장이
														가능합니다.<br /> 항공기 탑승 : 항공기 정시 출발을 위해 출발 10분전에 탑승이 마감되며,
														해당시간까지 탑승하지 않으면 수속이 취소되므로 유의 하여 주시기 바랍니다. <br />
													</p>
												</div>
											</div>
										</div>
										<!-- /.panel-heading -->


										<div class="panel-body">
											<div class="table-responsive">
												<table class="table">
													<thead>
														<tr>
															<th>탑승객 성명</th>
															<th>항공편명 (가는편/오는편)</th>
															<th>선택좌석</th>
															<th>탑승권</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${result}" var="row"  varStatus="status" >
																					
															<tr>
																<td>${row.EN_NAME}</td>
																<td>${map.DEP_CODE}/ ${map.ARR_CODE}</td>
																<td>${row.SEAT}</td>
																
																<td><a
																	href=" 
															<c:url value='/pdfMake.do?reqName=webcheck/bpPdf&BOOK_NO=${map.BOOK_NO}&name=${row.BOOK_NO}&fname=file_BP&TK_NO=${row.TICKET_NO}' />"
																	type="button" class="btn btn-primary">출력</a> <a
																	href="
															<c:url value='/pdfMake.do?reqName=webcheck/bpPdf&BOOK_NO=${map.BOOK_NO}&name=${row.BOOK_NO}&fname=file_BP&email=email&TK_NO=${row.TICKET_NO}' />"
																	type="button" class="btn btn-primary">이메일 발송</a></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<!-- /.table-responsive -->
										</div>
										<!-- /.panel-body -->

									</div>
									<!-- /.panel -->
								</div>
								<!-- /.col-lg-6 -->
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- jQuery -->
			<script src="_scripts/jquery.min.js"></script>

			<!-- Bootstrap Core JavaScript -->
			<script src="_scripts/bootstrap.min.js"></script>

			<!-- Metis Menu Plugin JavaScript -->
			<script src="_scripts/metisMenu.min.js"></script>

			<!-- Flot Charts JavaScript -->
			<script src="_scripts/flot/excanvas.min.js"></script>
			<script src="_scripts/flot/jquery.flot.js"></script>
			<script src="_scripts/flot/jquery.flot.pie.js"></script>
			<script src="_scripts/flot/jquery.flot.resize.js"></script>
			<script src="_scripts/flot/jquery.flot.time.js"></script>
			<script src="_scripts/flot/jquery.flot.tooltip.min.js"></script>
			<script src="_scripts/flot-data.js"></script>

			<!-- Custom Theme JavaScript -->
			<script src="_scripts/startmin.js"></script>
</body>
</html>