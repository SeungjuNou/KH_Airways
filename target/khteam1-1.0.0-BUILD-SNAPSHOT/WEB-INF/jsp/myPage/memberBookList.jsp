<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>

            <div id="inner3">
				 <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                               		 <h2>예약현황</h2>
                            </div>
                            
                            <div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>예약번호</th>
												<th>예약인원</th>
												<th>총산출금액</th>  
												<th>예약자이름</th>
												<th>예약일자</th>
												<th>멤버십번호</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${list }" var="row">
												<tr>
													<td>${row.BOOK_NO}</td>
													<td>${row.COUNT}</td>
													<td>${row.PRICE}</td>
													<td>${row.NAME}</td>
													<td>${row.DAY}</td>
													<td>${row.MEM_ID}</td>
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