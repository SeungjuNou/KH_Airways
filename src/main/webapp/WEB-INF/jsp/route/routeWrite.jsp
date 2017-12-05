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

<title>신규노선등록</title>

<link href="<c:url value='../_css/bootstrap.min.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/metisMenu.min.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/timeline.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/startmin.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/morris.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/font-awesome.min.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/ui.css?ver=1'/>" rel="stylesheet" />
</head>

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
				<div class="col-lg-6">
					<h2 class="page-header">노선등록</h2>

				</div>
			</div>

			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-body">


						<div class="panel panel-default">
							<div class="panel-heading">

								<h3>노선정보등록하기</h3>
								<div class="panel-heading">
								<form role="form" action="/khteam1/route/insertRoute.do" method="post">
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess">DEPARTURE</label>
											<input type="text" class="form-control" id="DEP" name="DEP">
										</div>
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess">ARRIVAL</label>
											<input type="text" class="form-control" id="ARR" name="ARR">
										</div>
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess">출발일시</label>
											<input type="date" class="form-control" id="TI_DEP" name="TI_DEP">
										</div>
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess">도착일시</label>
											<input type="date" class="form-control" id="TI_ARR" name="TI_ARR">
										</div>
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess">소요시간</label>
											<input type="text" class="form-control" id="TI_FLY" name="TI_FLY">
										</div>
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess">좌석수</label> 
											<input type="text" class="form-control" id="SEAT_COUNT"name="SEAT_COUNT">
										</div>
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess">기준금액</label>
											<input type="text" class="form-control" id="PRICE" name="PRICE">
										</div>
										
										<p align="right">
										<input type="submit" value="등록하기" class="btn btn-primary"></input>
										<a href="<c:url value='/route/openRouteList.do'/>" 
										button type="button" class="btn btn-primary">목록으로</a>
										</p>
								</div>	
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
