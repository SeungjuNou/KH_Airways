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
			<a href="../main.do"><img src="../_assets/icon.png" alt="" /></a>
			</div>
			<ul>
				<div id="menu">
					<li id="empty2"></li>
					<a href="../main.do"><li>항공권 예매</li></a>
					<li>${sessionScope.MEM_NAME}</li>
				</div>
			</ul>
		</div>

		<div id="body">
			<div id="body-inner">
				<div id="inner1">
					<ul>
						<li>
							<h1>예약 확인 페이지</h1>
						</li>

					
					</ul>
				</div>

				<div id="inner2">
					<ul>
						<li id="select-inner">
							
						</li>

						<li id="empty">&nbsp;</li>
					</ul>
				</div>

				<div id="inner3">
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">예약완료</div>
								<!-- /.panel-heading -->
								<div class="panel-body">
									<div class="table-responsive">
										
										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>항공권 번호</th>
													<th>승객성명</th>
													<th>성별</th>
													<th>케어</th>
													<th>수하물</th>
													<th>기내식</th>
													<th>출력</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var="list" items="${successList}" varStatus="status">
													<tr>
														<td>${list.TK_NO}</td>
														<td>${list.NAME}</td>
														<td>${list.GENDER}</td>
														<td>${list.CARE}&nbsp;/&nbsp;${list.CARE_KD}</td>
														<td>${list.CH_BAG}</td> 
														<td>${list.MEAL}</td> 
														<td>
															<a href="
															<c:url value='/pdfMake.do?reqName=book/pdfEticket&BOOK_NO=${list.BOOK_NO}&name=${list.TK_NO}&fname=file_ET' />" 
										 					type="button" class="btn btn-primary">출력</a>
										 					<a href="
															<c:url value='/pdfMake.do?reqName=book/pdfEticket&BOOK_NO=${list.BOOK_NO}&name=${list.TK_NO}&fname=file_ET&email=email' />" 
										 					type="button" class="btn btn-primary">이메일 발송</a>
										 					<a href="
															<c:url value='../myPage/viewMember.do' />" 
										 					type="button" class="btn btn-primary">마이페이지</a>
														</td>
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
					</div>
					<!-- /.row -->



				</div>
			</div>
		</div>


	</div>



	<!-- jQuery -->
	<script type="text/javascript"
		src="<c:url value='../_scripts/jquery.min.js'/>"></script>
	<!-- Bootstrap Core JavaScript -->
	<script type="text/javascript"
		src="<c:url value='../_scripts/bootstrap.min.js'/>"></script>
	<!-- Metis Menu Plugin JavaScript -->
	<script type="text/javascript"
		src="<c:url value='../_scripts/metisMenu.min.js'/>"></script>
	<!-- Flot Charts JavaScript -->
	<script src="_scripts/flot/excanvas.min.js"></script>
	<script src="_scripts/flot/jquery.flot.js"></script>
	<script src="_scripts/flot/jquery.flot.pie.js"></script>
	<script src="_scripts/flot/jquery.flot.resize.js"></script>
	<script src="_scripts/flot/jquery.flot.time.js"></script>
	<script src="_scripts/flot/jquery.flot.tooltip.min.js"></script>
	<script src="_scripts/flot-data.js"></script>

	<!-- Custom Theme JavaScript -->
	<script type="text/javascript"
		src="<c:url value='../_scripts/startmin.js'/>"></script>


</body>
</html>