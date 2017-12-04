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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<fmt:parseDate value="${map.BIRTH}" var="dateFmt" pattern="yyMMdd"/>
<fmt:formatDate value="${dateFmt}" var="dateFm" pattern="yy-MM-dd"/>

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
               		<li><a href="milesList.do">마일리지<a></li>
                    <li id="select-inner">
                        <div>회원 정보</div>
                    </li>
                    <li>나의 예약</li>
                    <li>웹 체크인</li>
                    <li id="empty">&nbsp;</li>
                </ul>
            </div>

            <div id="inner3">
				 <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                               		<h4><a href="viewMember.do">▶회원정보 보기<a>&nbsp; &nbsp; ▶회원정보 수정<a>&nbsp; &nbsp; <a href="deleteMember.do">▶회원 탈퇴<a></h4>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
								<form action="/khteam1/myPage/updateMember.do" id="update" method="post">
									<h4><table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>&nbsp;<br>${map.NAME}<br>${map.E_FIRST}&nbsp;/&nbsp;${map.E_LAST}<br>&nbsp;<br>&nbsp;<br></th>
												</tr>
											</thead>
											
											<thead>
                                            	<tr>
                                                	<th>&nbsp;<br>회원 아이디<br>${map.ID}<br>&nbsp;<br></th>
                                            	</tr>
                                        	</thead>
                                           
                                            <thead>
                                            	<tr>
													<th>&nbsp;<br>생년 월일<br>${dateFm}<br>&nbsp;<br></th>
												</tr>
											</thead>
											
											<thead>
                                            	<tr>
                                             		<th>&nbsp;<br>비밀번호<br><input type="password" id="PASSWORD" name="PASSWORD"  value="" /><br>&nbsp;<br>&nbsp;<br></th>
                                            	</tr>
                                         	</thead>
                                        
                                        	<thead>
                                            	<tr>
                                             		<th>&nbsp;<br>이메일
                                             		 주소<br><input type="text" id="EMAIL" name="EMAIL"  value="${map.EMAIL}" /><br>&nbsp;<br>&nbsp;<br></th>
                                            	</tr>
                                         	</thead>
                                         	
                                        	 <thead>
                                           		<tr>
                                             		<th>&nbsp;<br>휴대폰 번호<br><input type="text" id="PHONE" name="PHONE"  value="${map.PHONE}" /><br>&nbsp;<br>&nbsp;<br></th>
                                         		</tr>
                                         	</thead>
                                         </table></h4>
					 									<input type="submit" value="수정"/>
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