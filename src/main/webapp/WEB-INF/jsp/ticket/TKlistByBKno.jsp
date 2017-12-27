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
								<h3> ${list[1].BOOK_NO} &nbsp;의 항공권목록</h3>
								<p align="right">
									<a href="<c:url value=''/>" type="button" class="btn btn-primary">항공권번호수동생성</a> 
									
								</p>

							</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>예약번호</th>
												<th>항공권번호</th>
												<th>승객성명</th>
												<th>케어</th>
												<th>bag</th>
												<th>기내식</th>
												<th>나이</th>
												<th>성별</th>
												<th>&nbsp;</th>
												<th>&nbsp;</th>
												<th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${list }" var="row">
												<tr>
													<td>${row.BOOK_NO}<input type='hidden' id='BOOK_NO' value='${row.BOOK_NO}' /></td>
													<td>${row.TK_NO}</td>
													<td>${row.NAME}</td>
													<td>${row.CARE}&nbsp;/&nbsp;${row.CARE_KD}</td>
													<td>${row.CH_BAG}</td> 
													<td>${row.MEAL}</td>
													<td>${row.ADULT}</td>
													<td>${row.GENDER}</td>
													<td><a
														href=<c:url value='.do?/pdfMake.do?reqName=admin/pdfTicket&name=route&fname=file_ST'/>>항공권출력</a>
														<input type='hidden' id='TK_NO' value='${row.TK_NO}' /></td>
													<td><a
														href=<c:url value='.do?TK_NO=${row.TK_NO}'/>>수정</a>
														<input type='hidden' id='TK_NO' value='${row.TK_NO}' /></td>
													<td><a
														href=<c:url value='.do?TK_NO=${row.TK_NO}'/>>삭제</a>
														<input type='hidden' id='TK_NO' value='${row.TK_NO}' /></td>	
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