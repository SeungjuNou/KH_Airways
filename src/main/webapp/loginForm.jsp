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

<title>Mobile_login</title>


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

<!-- Custom Fonts -->
<link href="_css/font-awesome.min.css?ver=1" rel="stylesheet"
	type="text/css" />

<link href="_css/main.css?ver=1" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css"
	href="_css/Icomoon/style.css?ver=1" />

</head>
<body>

	<div id="wrapper">


		<!-- Page Content -->

		<div class="container-fluid">

			<div class="row">
				<div class="col-lg-12"></div>
				<div class="col-lg-4">
					<div class="panel panel-default"></div>
				</div>
				<p align="center">
					<!-- /.panel-heading -->
				<div class="col-lg-3">
					<div class="panel panel-default">
						


							<div class="panel panel-default">
								<div class="panel-heading">
									<h2 class="page-header">로그인</h2>
								</div>
								<div class="panel-body ">
									<p align="center">
									<form role="form" action="/khteam1/login/loginCheck.do"
										id="loging" method="post">

										<div class="form-group has-success col-lg-12">
											
											<p align="center"><input
												type="text" class="form-control" id="ID" name="ID"
												required="required" placeholder="ID"></p>
											<p align="center"><input
												type="password" class="form-control" id="PASSWORD"
												name="PASSWORD" required="required" placeholder="PASSWORD"></p>
										</div>
 

										<p align="center"><input type="submit" value="로그인" class="btn btn-primary col-lg-12"></input></p>

									</form>
									</p>
								</div>
							</div>
						   
						<p class="text-danger">※ 로그인이 필요한 서비스 입니다.</p>
					</div>
				</div>
			</div>
			</p>


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


	<script>
	alert("로그인이 필요한 서비스 입니다.");
		$("#loging").bind("submit", function(event) {
			event.preventDefault();
			var url = $(this).attr("action");
			var loginData = $(this).serialize();
			$.ajax({
				url : url,
				type : "POST",
				data : loginData,
				success : function(data) {
					if (data == false) {
						alert("ID 또는 PASSWORD가 다릅니다.")
					} else {
						location.href = "main.do";
					}
				}
			});
		});
		
	
	</script>
</body>
</html>




