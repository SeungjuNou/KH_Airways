<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<title>KH Airways</title>

<link href="<c:url value='../_css/bootstrap.min.css?ver=1'/>"
	rel="stylesheet" />
<link href="<c:url value='../_css/metisMenu.min.css?ver=1'/>"
	rel="stylesheet" />
<link href="<c:url value='../_css/timeline.css?ver=1'/>"
	rel="stylesheet" />
<link href="<c:url value='../_css/startmin.css?ver=1'/>"
	rel="stylesheet" />
<link href="<c:url value='../_css/morris.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/font-awesome.min.css?ver=1'/>"
	rel="stylesheet" />
<link href="<c:url value='../_css/ui.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/mypage.css?ver=1'/>" rel="stylesheet" />
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

		<!-- Page Content -->
		<div id="body">
			<div id="body-inner">
				<div id="inner3">
					<div class="row">
						<div class="col-lg-12">
							<h2 class="page-header">WEB CHECKIN STEP1</h2>
						</div>
					</div>

					<div class="row">

						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">예약번호 : ${book.BOOK_NO}</div>
								<!-- /.panel-heading -->
								<div class="panel-body">
									<div class="table-responsive">

										<table class="table">
											<thead>
												<tr>
													<th>대표자 성명</th>
													<th>대표자 연락처</th>
													<th>대표자 이메일</th>
													<th>예약일</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>${book.NAME}</td>
													<td>${book.PHONE}</td>
													<td>${book.EMAIL}</td>
													<td>${book.DAY}</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- /.table-responsive -->
								</div>
								<!-- /.panel-body -->

								<!-- /.panel-heading -->

								<div class="panel-body">
									<form role="form" action="/khteam1/webcheck/webCheckStep2.do" method="POST">
										<c:forEach items="${ticket}" var="row">
											<div class="row">
												<div class="col-lg-12">
													<div class="panel panel-success">
														<div class="panel-heading">${row.NAME}/${row.TK_NO}</div>
														<div class="panel-body">



															<div class="row">
																<div class="col-lg-12">

																	<input type="hidden" name="BOOOK_NO" value="${book.BOOK_NO}" /> 
																	<input type="hidden" name="TICKET_NO" value="${book.TK_NO}" /> 
																	<input type="hidden" name="DEP_CODE" value="${map.DEP_CODE}" />
																	<input type="hidden" name="ARR_CODE" value="${map.ARR_CODE}" /> 
																	<input type="hidden" name="EN_NAME" value="${row.NAME}" />
																	
																	<div class="form-group col-lg-6">
																		<label>여권 번호</label> <input class="form-control"
																			name="PP_NO" placeholder="여권번호 앞 문자를 포함해서 입력하세요.">
																	</div>
																	<div class="form-group col-lg-6">
																		<label>여권 만료일</label> <input class="form-control"
																			name="PP_EXP" placeholder="여권 만료일을 - 없이 입력하세요.">
																	</div>
																	<div class="form-group col-lg-6">
																		<label>생년월일</label> <input class="form-control"
																			name="PP_BIRTH" placeholder="6자리의 숫자로 입력하세요.">
																	</div>
																</div>
															</div>

														</div>

													</div>
												</div>
											</div>
										</c:forEach>



										<!-- /.table-responsive -->
								</div>

								<!-- /.panel-body -->
								<div class="panel-footer">
									<p align="right">
										<input type="submit" class="btn btn-primary" value="계속">

									</p>
								</div>

								</form>
							</div>
							<!-- /.panel -->
						</div>
						<!-- /.col-lg-6 -->
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