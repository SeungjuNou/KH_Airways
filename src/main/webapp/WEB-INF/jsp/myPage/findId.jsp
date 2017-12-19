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

<link href="../_css/bootstrap.min.css" rel="stylesheet">
<link href="../_css/metisMenu.min.css" rel="stylesheet">
<link href="../_css/startmin.css" rel="stylesheet">
<link href="../_css/morris.css" rel="stylesheet">
<link href="../_css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<link rel="stylesheet" type="text/css" href="../_css/mypage.css" />

<script type="text/javascript" src="<c:url value='../_scripts/jquery-2.0.2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='../_scripts/jquery-ui-1.10.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='../_scripts/jquery-2.0.2.min.js'/>"></script>

</head>
<body>

	<!--  top_header -->
	<div id="wrapper">

		<div id="top-1"></div>

		<div id="top-2">
			<div id="logo">
				<img src="<c:url value='../_assets/icon.png'/>" alt="" />
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

		<div id="body">
			<div id="body-inner">
				<div id="inner1">
					<ul>
						<li>
							<h2>마이 페이지</h2>
						</li>
						<li>${map.NAME}</li>
						<li>회원번호 : ${map.NO}</li>
						<li>마일리지 : ${map2.MILES} miles</li>
					</ul>
				</div>
            
            <div id="inner2">
                <ul>
                    <li id="select-inner">
                        <div>마일리지</div>
                    </li>
                    <li><a href="<c:url value=''/>">회원 정보</a></li>
                    <li>나의 예약</li>
                    <li>웹 체크인</li>
                    <li id="empty">&nbsp;</li>
                </ul>
            </div>

            <div id="inner3">
				
                
                
                <!--  여기에  폼 생 -->



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