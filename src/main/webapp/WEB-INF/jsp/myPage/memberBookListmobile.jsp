<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Mobile_bookList</title>

    <!-- Bootstrap Core CSS -->
    <link href="_css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="_css/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="_css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="_css/startmin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="_css/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="_css/font-awesome.min.css" rel="stylesheet" type="text/css">

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

        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>

        <!-- Top Navigation: Left Menu -->
        <ul class="nav navbar-nav navbar-left navbar-top-links">
            <li><a href="/khteam1/main.do"><i class="fa fa-home fa-fw"></i> Website</a></li>
        </ul>

        <!-- Top Navigation: Right Menu -->
        <ul class="nav navbar-right navbar-top-links">
        <c:if test="${empty session.ID}">
          <li>
            <a href="#"><i class="fa fa-sign-out fa-fw"></i> Login</a>
          </li>
        </c:if>
        <c:if test="${not empty session.ID}">
          <li class="dropdown">
                  <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                      <i class="fa fa-user fa-fw"></i> ${map.NAME} <b class="caret"></b>
                  </a>
                  <ul class="dropdown-menu dropdown-user">
                      <li><a href="/khteam1/myPage/viewMemberMobile.do"><i class="fa fa-user fa-fw"></i> 회원정보보기</a>
                      </li>
                      <li class="divider"></li>
                      <li><a href=""><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                      </li>
                  </ul>
          </li>
        </c:if>
        </ul>

        <!-- Sidebar -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">

                <ul class="nav" id="side-menu">

                    <li>
                        <a href="#"> 나의 예약정보보기 <span class="fa arrow"></span></a>
                    </li>
                    <li>
                        <a href="#"> 나의 체크인 내역보기 <span class="fa arrow"></span></a>
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
          <h2 class="page-header">예약현황</h2>

        </div>
      </div>


      <div class="panel panel-default">
        <div class="panel-body">


          <div class="col-lg-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3>나의 예약 현황보기</h3>
              </div>
              <!-- /.panel-heading -->
              <div class="panel-body">
                <div class="table-responsive">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>예약번호</th>
                        <th>출발일</th>
                        <th>출발지</th>
                        <th>도착지</th>
                      </tr>
                    </thead>
                    <tbody>

                      <c:forEach items="${list }" var="row">
                        <tr>
                          <td><a
                            href="<c:url value='/webcheck/checkinList.do??BOOK_NO=${row.BOOK_NO}'/>">${row.BOOK_NO}</a>
                            </td>
                          <td>출발일</td>
                          <td>출발지</td>
                          <td>도착지</td>
                        </tr>
                      </c:forEach>
                    </tbody>

                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.panel-body -->
              <br />

            </div>
            <!-- /.panel -->
          </div>
          <!-- /.row -->
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

<!-- Custom Theme JavaScript -->
<script src="_scripts/startmin.js"></script>

</body>
</html>