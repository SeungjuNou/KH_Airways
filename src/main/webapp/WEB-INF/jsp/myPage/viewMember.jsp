<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KH - Airline</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" type="text/css" href="<c:url value='../_css/mypage.css?ver=1'/>" />
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

<!--  top_header -->
<div id="wrapper">

    <div id="top-1">
    </div>

    <div id="top-2">
        <div id="logo">
            <img src="<c:url value='../_assets/icon.png'/>" alt="" />
        </div>
       
            <div id="menu">
            <ul>
                <li id="empty2"></li>
                <li>항공권 예매</li>
                <li>웹 체크인</li>
                <li>Seungju nou</li>
            </ul>
            </div>
       
    </div>

    <div id="body">
        <div id="body-inner">
            <div id="inner1">
                <ul>
                    <li>
                        <h1>마이 페이지</h1>
                    </li>

                    <li>
                        ${map.NAME} 
                    </li>
                    <li>회원번호 : ${map.NO}</li>
                    <li>마일리지 : ${map2.MILES} miles</li> 
                </ul>
            </div>
            
            <div id="inner2">
                <ul>
                    <li id="select-inner">
                        <div>마일리지</div>
                    </li>
                    <li><a href="viewMember.do">회원 정보<a></li>
                    <li>나의 예약</li>
                    <li>웹 체크인</li>
                    <li id="empty">&nbsp;</li>
                </ul>
            </div>

            <div id="inner3">
				
                
                
                 <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            
                            <div class="col-lg-12">
                        <div class="panel tabbed-panel panel-primary">
                            <div class="panel-heading clearfix">
                                <div class="panel-title pull-left">Tabbed Panel Primary</div>
                                <div class="pull-right">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#tab-primary-1" data-toggle="tab">Page 1</a></li>
                                        <li><a href="#tab-primary-2" data-toggle="tab">Page 2</a></li>
                                        <li><a href="#tab-primary-3" data-toggle="tab">Page 3</a></li>
                                        <li class="dropdown">
                                            <a href="#" data-toggle="dropdown">More <span class="caret"></span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="tab-pane fade in active" id="tab-primary-1">Page 1</div>
                                    <div class="tab-pane fade" id="tab-primary-2">Page 2</div>
                                    <div class="tab-pane fade" id="tab-primary-3">Page 3</div>
                                    <div class="tab-pane fade" id="tab-primary-4">Page 4</div>
                                    <div class="tab-pane fade" id="tab-primary-5">Page 5</div>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-6 -->
                        </div>
                        <!-- /.panel -->
                    </div>
                </div>
                <!-- /.row -->



            </div>
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