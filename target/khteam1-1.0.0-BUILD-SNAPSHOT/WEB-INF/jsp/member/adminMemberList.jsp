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
									<h3>회원목록</h3>

								</div>

								
								<div class="row">
									<div class="col-lg-12" align="right">
										<a href="/admin2/memberList.do">일반회원</a>
									</div>
								</div>

								<!-- /.panel-heading -->
								<div class="panel-body">
									<div class="table-responsive">

										<table class="table table-striped">
											<thead>
												<tr>
													<th>회원번호</th>
													<th>아이디</th>
													<th>이름</th>
													<th>영문성</th>
													<th>영문이름</th>
													<th>생년월일</th>
													<th>이메일</th>
													<th>휴대폰번호</th>
													<th>회원등급</th>
													<th>마일리지번호</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var="list" items="${list}">
													<tr>
														<td>${list.NO}</td>
														<td>${list.ID}</td>
														<td>${list.NAME}</td>
														<td>${list.E_FIRST}</td>
														<td>${list.E_LAST}</td>
														<td>${list.BIRTH}</td>
														<td>${list.EMAIL}</td>
														<td>${list.PHONE}</td>
														<td>${list.GRADE}</td>
														<td><a href="milesList.do?MILE_NO=${list.MILE_NO}">${list.MILE_NO}</a></td>
														<td><a href="updateMemberForm.do?ID=${list.ID}">수정</a>
																<p>
																<a href="deleteMember.do?ID=${list.ID}">삭제</a>
																</td>
															
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
						<div class="col-lg-3">
							<form action="/admin2/memberList.do" method="post">
								<div class="input-group custom-search-form">
									<input type="text" name="keyword" class="form-control"
										placeholder="회원이름을 입력하세요"> <span
										class="input-group-btn">
										<button class="btn btn-primary" type="submit">
											<i class="fa fa-search"></i>
										</button>
									</span>
								</div>
							</form>


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