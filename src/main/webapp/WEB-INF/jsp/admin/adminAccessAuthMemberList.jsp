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
    <link href="<c:url value='_css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='_css/metisMenu.min.css'/>" rel="stylesheet">
    <link href="<c:url value='_css/timeline.css'/>" rel="stylesheet">
    <link href="<c:url value='_css/startmin.css'/>" rel="stylesheet">
    <link href="<c:url value='_css/morris.css'/>" rel="stylesheet">
    <link href="<c:url value='_css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
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
            <h1 class="page-header">접근권한관리</h1>

          </div>
        </div>


        <div class="panel panel-default">
          <div class="panel-body">


            <div class="col-lg-12">
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h3>회원목록</h3>
                  <p align="right">
                  <button type="submit" class="btn btn-primary">출력하기</button>
                  </p>
                  <div class="form-group">
                      <select class="form-control">
                          <option>일반회원</option>
                          <option>항공관리</option>
                          <option>회원관리</option>
                          <option>최고관리자</option>
                          <option>PIC/CABIN CREW</option>
                      </select>
                  </div>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>회원번호</th>
                          <th>아이디</th>
                          <th>이름</th>
                          <th>생년월일</th>
                          <th>이메일</th>
                          <th>휴대폰번호</th>
                          <th>회원레벨</th>
                          <th>권한부여</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>1</td>
                          <td>wnsgur4386</td>
                          <td>김준혁</td>
                          <td>950203</td>
                          <td>safasgur438@ncsasac.com</td>
                          <td>01053324386</td>
                          <td>
                            <div class="form-group">
                                <select class="form-control">
                                    <option>일반회원</option>
                                    <option>항공관리</option>
                                    <option>회원관리</option>
                                    <option>최고관리자</option>
                                    <option>PIC/CABIN CREW</option>
                                </select>
                            </div>
                          </td>
                          <td><button type="submit" class="btn btn-primary">변경</button></td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>wnsgur4386</td>
                          <td>김준혁</td>
                          <td>950203</td>
                          <td>safasgur438@ncsasac.com</td>
                          <td>01053324386</td>
                          <td>
                            <div class="form-group">
                                <select class="form-control">
                                    <option>일반회원</option>
                                    <option>항공관리</option>
                                    <option>회원관리</option>
                                    <option>최고관리자</option>
                                    <option>PIC/CABIN CREW</option>
                                </select>
                            </div>
                          </td>
                          <td><button type="submit" class="btn btn-primary">변경</button></td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>wnsgur4386</td>
                          <td>김준혁</td>
                          <td>950203</td>
                          <td>safasgur438@ncsasac.com</td>
                          <td>01053324386</td>
                          <td>
                            <div class="form-group">
                                <select class="form-control">
                                    <option>일반회원</option>
                                    <option>항공관리</option>
                                    <option>회원관리</option>
                                    <option>최고관리자</option>
                                    <option>PIC/CABIN CREW</option>
                                </select>
                            </div>
                          </td>
                          <td><button type="submit" class="btn btn-primary">변경</button></td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>wnsgur4386</td>
                          <td>김준혁</td>
                          <td>950203</td>
                          <td>safasgur438@ncsasac.com</td>
                          <td>01053324386</td>
                          <td>
                            <div class="form-group">
                                <select class="form-control">
                                    <option>일반회원</option>
                                    <option>항공관리</option>
                                    <option>회원관리</option>
                                    <option>최고관리자</option>
                                    <option>PIC/CABIN CREW</option>
                                </select>
                            </div>
                          </td>
                          <td><button type="submit" class="btn btn-primary">변경</button></td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>wnsgur4386</td>
                          <td>김준혁</td>
                          <td>950203</td>
                          <td>safasgur438@ncsasac.com</td>
                          <td>01053324386</td>
                          <td>
                            <div class="form-group">
                                <select class="form-control">
                                    <option>일반회원</option>
                                    <option>항공관리</option>
                                    <option>회원관리</option>
                                    <option>최고관리자</option>
                                    <option>PIC/CABIN CREW</option>
                                </select>
                            </div>
                          </td>
                          <td><button type="submit" class="btn btn-primary">변경</button></td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>wnsgur4386</td>
                          <td>김준혁</td>
                          <td>950203</td>
                          <td>safasgur438@ncsasac.com</td>
                          <td>01053324386</td>
                          <td>
                            <div class="form-group">
                                <select class="form-control">
                                    <option>일반회원</option>
                                    <option>항공관리</option>
                                    <option>회원관리</option>
                                    <option>최고관리자</option>
                                    <option>PIC/CABIN CREW</option>
                                </select>
                            </div>
                          </td>
                          <td><button type="submit" class="btn btn-primary">변경</button></td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>wnsgur4386</td>
                          <td>김준혁</td>
                          <td>950203</td>
                          <td>safasgur438@ncsasac.com</td>
                          <td>01053324386</td>
                          <td>
                            <div class="form-group">
                                <select class="form-control">
                                    <option>일반회원</option>
                                    <option>항공관리</option>
                                    <option>회원관리</option>
                                    <option>최고관리자</option>
                                    <option>PIC/CABIN CREW</option>
                                </select>
                            </div>
                          </td>
                          <td><button type="submit" class="btn btn-primary" >변경</button></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <!-- /.table-responsive -->
                </div>
                <!-- /.panel-body -->
              </div>
              <!-- /.panel -->
            </div>
            <!-- /.row -->
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