<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>


		<!-- Page Content -->
		<div id="body">
			<div id="body-inner">
				<div id="inner3">
					<div class="row">
						<div class="col-lg-12">
							<h2 class="page-header">WEB CHECKIN STEP1</h2>
						</div>
					</div>

					<div class="row">

						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">예약번호 : ${book.BOOK_NO}</div>
								<!-- /.panel-heading -->
								<div class="panel-body">
									<div class="table-responsive">

										<table class="table">
											<thead>
												<tr>
													<th>대표자 성명</th>
													<th>대표자 연락처</th>
													<th>대표자 이메일</th>
													<th>예약일</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>${book.NAME}</td>
													<td>${book.PHONE}</td>
													<td>${book.EMAIL}</td>
													<td>${book.DAY}</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- /.table-responsive -->
								</div>
								<!-- /.panel-body -->

								<!-- /.panel-heading -->

								<div class="panel-body">
									<form role="form" action="/khteam1/webcheck/webCheckStep2.do" method="POST">
										<c:forEach items="${ticket}" var="row" varStatus="status">
											<div class="row">
												<div class="col-lg-12">
													<div class="panel panel-success">
														<div class="panel-heading">${row.NAME}/${row.TK_NO}</div>
														<div class="panel-body">

	
				
															<div class="row">
																<div class="col-lg-12">  
																	<input type="hidden" name="TK_NO${status.index}" value="${row.TK_NO}" />
																	<input type="hidden" name="EN_NAME${status.index}" value="${row.NAME}" />
																	 
																	<div class="form-group col-lg-6">
																		<label>여권 번호</label> <input class="form-control"
																			name="PP_NO${status.index}" placeholder="여권번호 앞 문자를 포함해서 입력하세요.">
																	</div>
																	<div class="form-group col-lg-6">
																		<label>여권 만료일</label> <input class="form-control"
																			name="PP_EXP${status.index}" placeholder="여권 만료일을 - 없이 입력하세요.">
																	</div>
																	<div class="form-group col-lg-6">
																		<label>생년월일</label> <input class="form-control"
																			name="PP_BIRTH${status.index}" placeholder="6자리의 숫자로 입력하세요.">
																	</div>
																</div>
															</div>

														</div>

													</div>
												</div>
											</div>
										</c:forEach>



										<!-- /.table-responsive -->
								</div>

								<!-- /.panel-body -->
								<div class="panel-footer">
									<p align="right">
										<input type="submit" class="btn btn-primary" value="계속">

									</p>
								</div>

								</form>
							</div>
							<!-- /.panel -->
						</div>
						<!-- /.col-lg-6 -->
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