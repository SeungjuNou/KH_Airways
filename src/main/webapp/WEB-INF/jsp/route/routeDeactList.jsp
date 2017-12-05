<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<title>비활성화된 노선정보현황</title>

<link href="<c:url value='../_css/bootstrap.min.css?ver=1'/>"
	rel="stylesheet" />
<link href="<c:url value='../_css/metisMenu.min.css?ver=1'/>"
	rel="stylesheet" />
<link href="<c:url value='../_css/timeline.css?ver=1'/>"
	rel="stylesheet" />
<link href="<c:url value='../_css/startmin.css?ver=1'/>"
	rel="stylesheet" />
<link href="<c:url value='../_css/morris.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/font-awesome.min.css.ver=1'/>"
	rel="stylesheet" />
<link href="<c:url value='../_css/ui.css?ver=1'/>" rel="stylesheet" />
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand" href="#">KH Airways</a>
	</div>



	<!-- Top Navigation: Left Menu -->
	<ul class="nav navbar-nav navbar-left navbar-top-links">
		<li><a href="#"><i class="fa fa-home fa-fw"></i> Website</a></li>
	</ul>

	<!-- Sidebar -->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">

			<ul class="nav" id="side-menu">
				<li><a href="#" class="active"><i
						class="fa fa-dashboard fa-fw"></i> Dashboard</a></li>


				<li><a href="#"><i class="fa fa-sitemap fa-fw"></i> 항공 관리 <span
						class="fa arrow"></span></a>

					<ul class="nav nav-second-level">
						<li><a href="#">노선등록</a></li>
						<li><a href="#">항공편관리</a></li>
						<li><a href="#">운항정보<span class="fa arrow"></a>
							<ul class="nav nav-second-level">
								<li><a href="#">날짜별 운항리스트<span class="fa arrow"></span></a>
									<ul class="nav nav-third-level">
										<li><a href="#">항공편별 운항통계</a></li>
									</ul></li>
								<li><a href="morris.html">오늘의 운항현황</a></li>
							</ul></li>
					</ul></li>

				<li><a href="#"><i class="fa fa-sitemap fa-fw"></i> 회원 관리 <span
						class="fa arrow"></span></a>

					<ul class="nav nav-second-level">
						<li><a href="#">회원목록</a></li>
						
						<li><a href="#">마일리지회원관리</a></li>
						<li><a href="#">예약관리 <span class="fa arrow"></a>
							<ul class="nav nav-third-level">
								<li><a href="#">출발일별 예약현황</a></li>
								<li><a href="#">오늘날짜 예약현황</a></li>
							</ul></li>
					</ul></li>

				<li><a href="#"><i class="fa fa-sitemap fa-fw"></i> 사이트 관리
						<span class="fa arrow"></span></a>

					<ul class="nav nav-second-level">
						<li><a href="#">접근권한 관리</a></li>
						<li><a href="#">메인페이지 관리</a></li>

					</ul></li>

			</ul>

		</div>
	</div>
	</nav>
	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">

			<div class="row">
				<div class="col-lg-12">
					<h2 class="page-header">비활성화된 노선현황</h2>

				</div>
			</div>


			<div class="panel panel-default">
				<div class="panel-body">


					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>비활성화된 노선현황</h3>
								<p align="right">
									<%-- <a href="<c:url value='/route/openRouteWrite.do'/>" 
										button type="button" class="btn btn-primary">노선등록하기</a> --%> 
									<%-- <a href="<c:url value='/route/openRouteDeactList.do'/>" 
										button type="button" class="btn btn-primary">비활성화된 노선확인하기</a> --%>
									<a href="<c:url value='#'/>" 
										button type="button" class="btn btn-primary">출력하기</a>	
								</p>

							</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>노선번호</th>
												<th>DEPARTURE</th>
												<th>ARRIVAL</th>
												<th>출발일시</th>
												<th>도착일시</th>
												<th>소요시간</th>
												<th>좌석수</th>
												<th>기준금액</th>
												<th></th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${list }" var="row">
												<tr>
													<td><a
														href="<c:url value='/route/openRouteDetail.do?ITI_NO=${row.ITI_NO}'/>">${row.ITI_NO}</a>
														<input type='hidden' id='ITI_NO' value='${row.ITI_NO}' /></td>
													<td>${row.DEP}</td>
													<td>${row.ARR}</td>
													<td>${row.TI_DEP}</td>
													<td>${row.TI_ARR}</td>
													<td>${row.TI_FLY}</td>
													<td>${row.SEAT_COUNT}</td>
													<td>${row.PRICE}</td>
													<td><a
														href=<c:url value='/route/openRouteUpdate.do?ITI_NO=${row.ITI_NO}'/>>수정</a>
														<input type='hidden' id='ITI_NO' value='${row.ITI_NO}' /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<%-- 	<a href="<c:url value='/route/openRouteWrite.do'/>">노선등록하기</a> --%>
</body>
</html>
</body>
</html>