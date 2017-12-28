<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

	<fmt:parseDate value="${map.BIRTH}" var="dateFmt" pattern="yyMMdd" />
	<fmt:formatDate value="${dateFmt}" var="dateFm" pattern="yy-MM-dd" />


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
                                <h3>마일리지회원관리</h3>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                            	<th>번호</th>
                                            	<th>마일리지번호</th>
                                               	<th>마일리지 내역(miles)</th>
                                                <th>사용 마일리지(miles)</th>
                                                <th>적립 마일리지(miles)</th>
                                                <th>잔여 마일리지(miles)</th>
                                                <th>일시</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
 										<c:forEach var="list" items="${list}">
 									
                                            <tr>
                                            	<td>${list.NO}</td>
                                                <td>${list.MILE_NO}</td>
                                                <th>${list.MILES_TEXT}</th>
                                                <td>${list.USE_MILES}</td>
                                                <td>${list.SAVE_MILES}</td>
                                                <td>${list.MILES}</td>
                                                <td>${list.USE_DATE}</td>
                                           	</tr>
                                        </c:forEach>
												
                                        </tbody>
                                    </table>
                                   <form action="/khteam1/admin2/milesList.do" method="post">
                           					<input type="text" name="MILE_NO" />
                           					<input type="submit" value="검색" />
                           			</form>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                          
                    </div>
                     
                <!-- /.row -->
                </div>
            </div>
		</div>
	</div>


<!-- jQuery -->
		<script type="text/javascript"
			src="<c:url value='../_scripts/jquery.min.js'/>"></script>
		<!-- Bootstrap Core JavaScript -->
		<script type="text/javascript"
			src="<c:url value='../_scripts/bootstrap.min.js'/>"></script>
		<!-- Metis Menu Plugin JavaScript -->
		<script type="text/javascript"
			src="<c:url value='../_scripts/metisMenu.min.js'/>"></script>
		<!-- Custom Theme JavaScript -->
		<script type="text/javascript"
			src="<c:url value='../_scripts/startmin.js'/>"></script>
</body>
</html>