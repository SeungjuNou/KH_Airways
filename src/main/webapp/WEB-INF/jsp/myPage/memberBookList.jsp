<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>

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
												<th>예약인원</th>
												<th>결제수단</th>
												<th>총산출금액</th>
												<th>예약자이름</th>
												<th>이메일주소</th>
												<th>핸드폰번호</th>
												<th>예약일자</th>
												<th>멤버십번호</th>
												<th></th>
												<th></th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${list }" var="row">
												<tr>
													<td>${row.BOOK_NO}</td>
													<td>${row.COUNT}</td>
													<td>${row.PAY}</td> 
													<td>${row.PRICE}</td>
													<td>${row.NAME}</td>
													<td>${row.EMAIL}</td>
													<td>${row.PHONE}</td>
													<td>${row.DAY}</td>
													<td>${row.MEM_ID}</td>
													<td><a
														href=<c:url value='/admin/openBookUpdate.do?BOOK_NO=${row.BOOK_NO}'/>>예약번호수정</a>
														<input type='hidden' id='BOOK_NO' value='${row.BOOK_NO}' /></td>
													<td><a
														href=<c:url value='/admin/bookDelete.do?BOOK_NO=${row.BOOK_NO}'/>>예약번호삭제</a>
														<input type='hidden' id='BOOK_NO' value='${row.BOOK_NO}' /></td>	
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