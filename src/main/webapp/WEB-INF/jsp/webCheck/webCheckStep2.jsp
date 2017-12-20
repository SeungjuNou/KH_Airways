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
				<img src="_assets/icon.png" alt="" />
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
				<div id="inner1">
					<div class="row">
						<div class="col-lg-12">
							<h2 class="page-header">WEB CHECKIN STEP2</h2>
						</div>
					</div>

					<div class="row">

						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">좌석지정  예약번호 : ${map.BOOK_NO}</div>
								<!-- /.panel-heading -->
								<div class="panel-body">
									
										
									
								
								</div>

							</div>
						</div>
					</div>

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

	<!-- Custom Theme JavaScript -->
	<script src="_scripts/startmin.js"></script>

</body>
</html>