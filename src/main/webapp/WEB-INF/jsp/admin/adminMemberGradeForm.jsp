<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>KH Airways - admin page</title>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<link rel="stylesheet" type="text/css" href="<c:url value='../_css/bootstrap.min.css?ver=1'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='../_css/metisMenu.min.css?ver=1'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='../_css/timeline.css?ver=1'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='../_css/startmin.css?ver=1'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='../_css/morris.css?ver=1'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='../_css/font-awesome.min.css?ver=1'/>" />


<script type="text/javascript" src="<c:url value='../_scripts/jquery-2.0.2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='../_scripts/jquery-ui-1.10.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='../_scripts/jquery-2.0.2.min.js'/>"></script>

</head>
<body>

<fmt:parseDate value="${map.BIRTH}" var="dateFmt" pattern="yyMMdd"/>
<fmt:formatDate value="${dateFmt}" var="dateFm" pattern="yy-MM-dd"/>

<div id="wrapper">

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
                    <li>
                        <a href="#" class="active"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                    </li>


                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i> 항공 관리 <span class="fa arrow"></span></a>

                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">노선등록</a>
                            </li>
                            <li>
                                <a href="#">항공편관리</a>
                            </li>
							<li>
                                <a href="#">운항정보<span class="fa arrow"> </a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="#">날짜별 운항리스트<span class="fa arrow"></span></a>
										<ul class="nav nav-third-level">
											<li>
												<a href="#">항공편별 운항통계</a>
											</li>
										</ul>
                                    </li>
                                    <li>
                                        <a href="morris.html">오늘의 운항현황</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i> 회원 관리 <span class="fa arrow"></span></a>

                        <ul class="nav nav-second-level">
                            <li>
                                <a href="memberList.do">회원목록</a>
                            </li>
                            <li>
                                <a href="#">여권정보수정 <span class="fa arrow"> </a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="#">미승인</a>
                                    </li>
                                    <li>
                                        <a href="#">승인</a>
                                    </li>
                                </ul>
                            </li>
							<li>
                                <a href="milesManage.do">마일리지회원관리</a>
                            </li>
                            <li>
                                <a href="#">예약관리 <span class="fa arrow"> </a>
								<ul class="nav nav-third-level">
									<li>
                                        <a href="#">출발일별 예약현황</a>
                                    </li>
                                    <li>
                                        <a href="#">오늘날짜 예약현황</a>
                                    </li>
								</ul>
                            </li>
                        </ul>
                    </li>

					 <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i> 사이트 관리 <span class="fa arrow"></span></a>

                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">접근권한 관리</a>
                            </li>
                            <li>
                                <a href="#">메인페이지 관리</a>
                            </li>

                        </ul>
                    </li>

                </ul>

            </div>
        </div>
    </nav>
                            <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">회원관리</h1>

                </div>
            </div>


            <div class="panel panel-default">
                <div class="panel-body">


                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3>회원목록</h3>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
								<form action="/khteam1/admin/updateMember.do" method="post">
									<table class="table table-striped table-bordered table-hover">
										<tr>
											<td>회원번호 : ${map.NO} <input type="hidden" name="NO" value="${map.NO}"/></td>
										</tr>
										<tr>
											<td>아이디 : ${map.ID}</td>
										</tr>
										<tr>
											<td>비밀번호 :<input type="password" name="PASSWORD" value="${map.PASSWORD}"/></td>
										</tr>
										<tr>
											<td>이름 : ${map.NAME}</td>
										</tr>
										<tr>
											<td>영문이름 : ${map.E_FIRST}${map.E_LAST}</td>
										</tr>
										<tr>
											<td>생년월일 : ${map.BIRTH}</td>
										</tr>
										<tr>
											<td>이메일 : <input type="text" name="EMAIL" value="${map.EMAIL}"/></td>
										</tr>
										<tr>
											<td>휴대폰번호 : <input type="text" name="PHONE" value="${map.PHONE}"/></td>
										</tr>
										<tr>
											<td>마일리지번호 : ${map.MILE_NO}</td>
										</tr>
										<tr>
											<td>회원등급 : ${map.GRADE}<input type="text" name="GRADE" value="${map.GRADE}"/></td>
										</tr>	
                                    </table>
					 				<input type="submit" id="update" value="수정"/>
								</form>
								</div>
                                    
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

<!-- jQuery -->
<script type="text/javascript" src="<c:url value='../_scripts/jquery.min.js'/>"></script>
<!-- Bootstrap Core JavaScript -->
<script type="text/javascript" src="<c:url value='../_scripts/bootstrap.min.js'/>"></script>
<!-- Metis Menu Plugin JavaScript -->
<script type="text/javascript" src="<c:url value='../_scripts/metisMenu.min.js'/>"></script>
<!-- Flot Charts JavaScript -->
        <script src="_scripts/flot/excanvas.min.js"></script>
        <script src="_scripts/flot/jquery.flot.js"></script>
        <script src="_scripts/flot/jquery.flot.pie.js"></script>
        <script src="_scripts/flot/jquery.flot.resize.js"></script>
        <script src="_scripts/flot/jquery.flot.time.js"></script>
        <script src="_scripts/flot/jquery.flot.tooltip.min.js"></script>
        <script src="_scripts/flot-data.js"></script>

<!-- Custom Theme JavaScript -->
<script type="text/javascript" src="<c:url value='../_scripts/startmin.js'/>"></script>

</body>
</html>