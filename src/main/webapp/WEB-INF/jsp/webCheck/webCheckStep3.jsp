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

<title>KH Airways </title>

<link href="<c:url value='../_css/bootstrap.min.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/metisMenu.min.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/timeline.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/startmin.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/morris.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/font-awesome.min.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/ui.css?ver=1'/>" rel="stylesheet" />
<link href="<c:url value='../_css/mypage.css?ver=1'/>" rel="stylesheet" />
</head>
<body>

  <!--  top_header -->
  <div id="wrapper">

    <div id="top-1">
    </div>

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
          <h2 class="page-header">WEB CHECKIN SUCCESS</h2>
        </div>
      </div>

      <div class="row">

        <div class="col-lg-12">
          <div class="panel panel-default">
            <div class="row">
                <div class="col-lg-12">
                    <div class="well">
                        <h3>체크인이 완료되었습니다. </h3>
                        <p> 탑승권 발급 : 각 승객별로 '탑승권 조회/인쇄' 버튼을 클릭하여 탑승권을 다운로드(출력)한 후, 출발 당일 공항에서 제시하여 주시기 바랍니다.<br/>
                            수하물 위탁 : 위탁 수하물을 소지하신 고객님께서는 항공기 출발 1시간 전까지 탑승권 표기된 웹 체크인 전용카운터를 이용해 주십시오.(전용 카운터 정보가 없는 경우 일반 카운터 이용)<br/>
                            위탁 수하물이 없는 경우 카운터를 거치지 않고 출국장 입장이 가능합니다.<br/>
                            항공기 탑승 : 항공기 정시 출발을 위해 출발 10분전에 탑승이 마감되며, 해당시간까지 탑승하지 않으면 수속이 취소되므로 유의 하여 주시기 바랍니다. <br/>
                        </p>
                    </div>
                </div>
            </div>
            <!-- /.panel-heading -->


            <div class="panel-body">
              <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th>탑승객 성명</th> 
                      <th>항공편명 (가는편/오는편)</th>
                      <th>선택좌석</th>
                      <th>탑승권</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${result}" var="row">
                      <tr>
                        <td>${row.EN_NAME}</td>
                        <td>${map.DEP_CODE} / ${map.ARR_CODE}</td>
                        <td>${row.SEAT}</td>
                        <td><a href="<c:url value='/route/openRouteList.do'/>"  type="button" class="btn btn-primary">다운로드</a>
                        <a href="<c:url value='/route/openRouteList.do'/>"  type="button" class="btn btn-primary">이메일로 전송</a></td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.panel-body -->

          </div>
          <!-- /.panel -->
        </div>
        <!-- /.col-lg-6 -->
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