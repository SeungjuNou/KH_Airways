<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">비활성화된 노선현황</h2>

			</div>
		</div>


		<div class="panel panel-default">
			<div class="panel-body">


				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3>비활성화된 노선현황</h3>
							<p align="right">
								<%-- <a href="<c:url value='/route/openRouteWrite.do'/>" 
										button type="button" class="btn btn-primary">노선등록하기</a> --%>
								<%-- <a href="<c:url value='/route/openRouteDeactList.do'/>" 
										button type="button" class="btn btn-primary">비활성화된 노선확인하기</a> --%>
								<a href="<c:url value='#'/>" button type="button"
									class="btn btn-primary">출력하기</a>
							</p>

						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>노선번호</th>
											<th>DEPARTURE</th>
											<th>ARRIVAL</th>
											<th>출발일시</th>
											<th>도착일시</th>
											<th>소요시간</th>
											<th>좌석수</th>
											<th>기준금액</th>
											<th></th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${list }" var="row">
											<tr>
												<td><a
													href="<c:url value='/route/openRouteDetail.do?ITI_NO=${row.ITI_NO}'/>">${row.ITI_NO}</a>
													<input type='hidden' id='ITI_NO' value='${row.ITI_NO}' /></td>
												<td>${row.DEP}</td>
												<td>${row.ARR}</td>
												<td>${row.TI_DEP}</td>
												<td>${row.TI_ARR}</td>
												<td>${row.TI_FLY}</td>
												<td>${row.SEAT_COUNT}</td>
												<td>${row.PRICE}</td>
												<td><a
													href=<c:url value='/route/openRouteUpdate.do?ITI_NO=${row.ITI_NO}'/>>수정</a>
													<input type='hidden' id='ITI_NO' value='${row.ITI_NO}' /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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
								</body>
								</html>