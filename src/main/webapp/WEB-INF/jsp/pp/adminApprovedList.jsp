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
						<h1 class="page-header">여권정보변경 신청내역</h1>

					</div>
				</div>


				<div class="panel panel-default">
					<div class="panel-body">


						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3>승인 내역</h3>

								</div>

								
								<div class="row">
									<div class="col-lg-12" align="right">
										<a href="/khteam1/admin/approvedList.do">승인</a>
										<a href="/khteam1/admin/unapprovedList.do">미승인</a>
									</div>
								</div>

								<!-- /.panel-heading -->
								<div class="panel-body">
									<div class="table-responsive">

										<table class="table table-striped">
											<thead>
												<tr>
													<th>번호</th>
													<th>이름</th>
													<th>변경할 내용</th>
													<th>신청일자</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var="list" items="${list}">
													<tr>
														<td><a href="ppModifyApplyView.do?BOARD_IDX=${list.IDX}">${list.IDX}</a></td>
														<td>${list.TITLE}</td>
														<td>${list.CONTENTS}</td>
														<td>${list.CREA_DTM}</td>
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