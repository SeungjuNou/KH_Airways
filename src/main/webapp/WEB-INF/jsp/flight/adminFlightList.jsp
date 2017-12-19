<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>KH Airways - admin page</title>
    <link href="_css/bootstrap.min.css" rel="stylesheet">
    <link href="_css/metisMenu.min.css" rel="stylesheet">
    <link href="_css/timeline.css" rel="stylesheet">
    <link href="_css/startmin.css" rel="stylesheet">
    <link href="_css/morris.css" rel="stylesheet">
    <link href="_css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>



<body>
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
                                <a href="#">회원목록</a>
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
                                <a href="#">마일리지회원관리</a>
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
                    <h1 class="page-header">항공 관리 현황</h1>

                </div>
            </div>


            <div class="panel panel-default">
                <div class="panel-body">


                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3>항공 현황
                  					<p align="right">
                  						<a href="./flightRegFrom.do">
                  						<button type="button" class="btn btn-primary">새로 등록하기</button>
                  						</a>
                  					</p>
                				</h3>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body" align="center">
                            	<form action="flightAdminSearch.do">
                            	<label>검색</label>
                            	<select class="form-control" style="width: 15%; display: inline;" name="type">
                            		<option value="1">노선번호</option>
                            		<option value="2">코드번호</option>
                            	</select>
                            	<input class="form-control" style="width: 15%; display: inline;" name="search">
                            	<label>기간</label>
                            	<input class="form-control" style="width: 15%; display: inline;" type="date" name="DEP_DATE1">
                            	~
                            	<input class="form-control" style="width: 15%; display: inline;" type="date" name="DEP_DATE2">
                            	<button type="submit" class="btn btn-primary">조회</button>
                            	</form>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped" >
                                        <thead>
                                            <tr>
                                                <th>노선 번호</th>
                                                <th>코드 번호</th>
                        						<th>좌석 갯수</th>
                        						<th>예약 좌석 갯수</th>
                        						<th>운항 날짜</th>
                        						<th>수정 여부</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="flight" items="${flightList}">
                                            <tr>
                                            	<td>${flight.ITI_NO}</td>
                                            	<td>${flight.CODE}</td>
                                            	<td>${flight.SET_COUNT}</td>
                                            	<td>${flight.BOOK_SET}</td>
                                            	<td>${flight.DEP_DATE}</td>
                                            	<td></td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <div align="center">
                                	<a>이전</a>
                                	<a>1</a>
                                	<a>다음</a>
                                </div>
							</div>
						</div>
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
