<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Mobile_main</title>

<!-- Bootstrap Core CSS -->
<link href="_css/bootstrap.min.css?ver=1" rel="stylesheet" />

<!-- MetisMenu CSS -->
<link href="_css/metisMenu.min.css?ver=1" rel="stylesheet" />

<!-- Timeline CSS -->
<link href="_css/timeline.css?ver=1" rel="stylesheet" />

<!-- Custom CSS -->
<link href="_css/startmin.css?ver=1" rel="stylesheet" />

<!-- Morris Charts CSS -->
<link href="_css/morris.css?ver=1" rel="stylesheet" />

<link href="_css/mobile.css?ver=1" rel="stylesheet" />

<!-- Custom Fonts -->
<link href="_css/font-awesome.min.css?ver=1" rel="stylesheet"
	type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">KH - Airways</a>
		</div>

		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

		<!-- Top Navigation: Left Menu -->
		<ul class="nav navbar-nav navbar-left navbar-top-links">
			<li><a href="/khteam1/main.do"><i class="fa fa-home fa-fw"></i>
					Website</a></li>
		</ul>

		<!-- Top Navigation: Right Menu -->
		<ul class="nav navbar-right navbar-top-links">
			<c:if test="${empty sessionScope.ID}">
				<li><a href="/khteam1/loginmobile.jsp"><i
						class="fa fa-sign-out fa-fw"></i> Login</a></li>
			</c:if>
			<c:if test="${!empty sessionScope.ID}">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						${map.NAME} <b class="caret"></b>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="/khteam1/myPage/viewMember.do"><i
								class="fa fa-user fa-fw"></i> 회원정보보기</a></li>
						<li class="divider"></li>
						<li><a href="/khteam1/login/logOut.do"><i
								class="fa fa-sign-out fa-fw"></i> Logout</a></li>
					</ul></li>
			</c:if>
		</ul>

		<!-- Sidebar -->
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<c:if test="${!empty sessionScope.ID}">
					<ul class="nav" id="side-menu">

						<li><a href="/khteam1/myPage/mybookList.do"> 나의 예약정보보기 <span
								class="fa arrow"></span></a></li>
						<!--  <li>
                        <a href="#"> 나의 체크인 내역보기 <span class="fa arrow"></span></a>
                    </li> -->
					</ul>
				</c:if>

			</div>
		</div>
		</nav>

		<div id="page-wrapper" class="bgcolor">
			<c:if test="${empty sessionScope.ID}">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel-body"></div>
					</div>
				</div>

				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">모바일 페이지 안내</div>
						<div class="panel-body">
							<p>1. 로그인이 필요한 서비스들로 이루어 져 있습니다.</p>
							<p>2. 지난 탑승권 확인은 불가능합니다.</p>
							<p>3. 로그인 시 탑승 예정 탑승권을 확인할 수 있습니다.</p>
							<p>모바일에서는 회원 정보 확인과 로그인만 가능합니다.</p>
							<p>회원가입과 상세 조회등은 PC를 참고하시기 바랍니다.</p>
						</div>
						<div class="panel-footer">KH Airways</div>
					</div>
				</div>
			</c:if>



			<c:if test="${!empty sessionScope.ID}">
				<div class="container-fluid">




					<div class="row">
						<div class="col-lg-12">
							<div class="panel-body"></div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-12">

							<c:forEach var="qrList" items="${list2}" varStatus="status">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3>탑승 예정 항공권 입니다.</h3>
										<br>
										<h5>- ${qrList.EN_NAME}-</h5>
									</div>
								</div> 

								<div class="panel panel-default">
									<div class="panel-heading"></div>
									<div class="panel-body text-center">

										<div class="row">
											<img alt=""
												src="file_QR/${qrList.BP_NO}.png">
										</div>

									</div>
									<div class="panel-footer">해당 탑승권의 출발일은 ${qrList.BO_DAY}
										입니다.</div>
								</div>
							</c:forEach>

							<c:if test="${size eq 0}">
								<div class="col-lg-12">
									<div class="panel panel-primary">
										<div class="panel-heading">모바일 페이지 안내</div>
										<div class="panel-body">
											<p>탑승 예정 항공권이 없습니다.</p>
											<p>예약을 하신경우 웹체크인을 진행해 주세요.</p>
										</div>
										<div class="panel-footer">KH Airways</div>
									</div>
								</div>
							</c:if>


							<img src="" alt="">


						</div>
					</div>



				</div>
			</c:if>
		</div>




	</div>

	<!-- jQuery -->
	<script src="_scripts/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="_scripts/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="_scripts/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="_scripts/startmin.js"></script>

</body>

</html>