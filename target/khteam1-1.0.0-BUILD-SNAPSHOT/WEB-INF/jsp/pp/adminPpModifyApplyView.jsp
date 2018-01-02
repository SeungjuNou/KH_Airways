<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>


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
							<h3>이미지 보기</h3>

						</div>


						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="table-responsive">

								<table class="table table-striped">
									<tbody>
										<tr>
											<td>
											<c:forEach var="row" items="${list}">
											<td><a href="/common/downloadFile.do?IDX=${row.IDX}">${row.ORIGINAL_FILE_NAME } (${row.FILE_SIZE }kb)</a></td>
                  							</c:forEach>
                  							</td>
										</tr>
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