<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">

			<div class="row">
				<div class="col-lg-11">
					<h2 class="page-header">예약번호 목록</h2>

				</div>
			</div>


			<div class="panel panel-default">
				<div class="panel-body">


					<div class="col-lg-11">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>예약번호 수정하기</h3>
								<div class="panel-heading">
								<form role="form" action="/khteam1/admin/bookUpdate.do" method="post">
									<div class="form-group has-success">
										<label class="control-label" for="inputSuccess">예약번호</label>
										${map.BOOK_NO}
									</div>
									<div class="form-group has-success">
										<label class="control-label" for="inputSuccess">예약인원</label>
										<input type="text" class="form-control" id="COUNT" name="COUNT" value="${map.COUNT }" />
									</div>
									<div class="form-group has-success">
										<label class="control-label" for="inputSuccess">출발편코드</label>
										<input type="text" class="form-control" id="DEP_CODE" name="DEP_CODE" value="${map.DEP_CODE }" />
									</div>
									<div class="form-group has-success">
										<label class="control-label" for="inputSuccess">도착편코드</label> 
										<input type="text" class="form-control" id="ARR_CODE" name="ARR_CODE" value="${map.ARR_CODE }" />
									</div>
									<div class="form-group has-success">
										<label class="control-label" for="inputSuccess">결제수단</label> 
										<input type="text" class="form-control" id="PAY" name="PAY" value="${map.PAY }" />
									</div>
									<div class="form-group has-success">
										<label class="control-label" for="inputSuccess">총산출금액</label> 
										<input type="text" class="form-control" id="PRICE" name="PRICE" value="${map.PRICE }" />
									</div>
									<div class="form-group has-success">
										<label class="control-label" for="inputSuccess">예약자이름</label> 
										<input type="text" class="form-control" id="NAME" name="NAME" value="${map.NAME }" />
									</div>
									<div class="form-group has-success">
										<label class="control-label" for="inputSuccess">이메일주소</label> 
										<input type="text" class="form-control" id="EMAIL" name="EMAIL" value="${map.EMAIL }" />
									</div>
									<div class="form-group has-success">
										<label class="control-label" for="inputSuccess">핸드폰번호</label> 
										<input type="text" class="form-control" id="PHONE" name="PHONE" value="${map.PHONE }" />
									</div>
									<div class="form-group has-success">
										<label class="control-label" for="inputSuccess">예약일자</label> 
										<input type="text" class="form-control" id="DAY" name="DAY" value="${map.DAY }" />
									</div>
									<div class="form-group has-success">
										<label class="control-label" for="inputSuccess">멤버십번호</label> 
										<input type="text" class="form-control" id="MEM_NO" name="MEM_NO" value="${map.MEM_NO }" />
									</div>
									<br />
									<p align="right">
										<input type="submit" value="수정하기" class="btn btn-primary"></input>

										<a href="<c:url value='/admin/bookList.do'/>" 
										button type="button" class="btn btn-primary">목록으로</a> 
										<a href="<c:url value='/admin/bookDelete.do?BOOK_NO=${map.BOOK_NO}'/>"
										button type="button" class="btn btn-primary">예약번호삭제</a> 
										<input type='hidden' id='BOOK_NO' value='${map.BOOK_NO}'>
									</p>
								</form>
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