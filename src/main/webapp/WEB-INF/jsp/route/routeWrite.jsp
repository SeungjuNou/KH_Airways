<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">

			<div class="row">
				<div class="col-lg-10">
					<h2 class="page-header">노선등록</h2>

				</div>
			</div>

			<div class="col-lg-10">
				<div class="panel panel-default">
					<div class="panel-body">


						<div class="panel panel-default">
							<div class="panel-heading">

								<h3>노선정보등록하기</h3>
								<div class="panel-heading">
								<form role="form" action="/khteam1/admin/insertRoute.do" method="post">
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess">DEPARTURE</label>
											<input type="text" class="form-control" id="DEP" name="DEP">
										</div>
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess">ARRIVAL</label>
											<input type="text" class="form-control" id="ARR" name="ARR">
										</div>
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess">출발일시</label>
											<input type="date" class="form-control" id="TI_DEP" name="TI_DEP">
										</div>
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess">도착일시</label>
											<input type="date" class="form-control" id="TI_ARR" name="TI_ARR">
										</div>
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess">소요시간</label>
											<input type="text" class="form-control" id="TI_FLY" name="TI_FLY">
										</div>
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess">좌석수</label> 
											<input type="text" class="form-control" id="SEAT_COUNT"name="SEAT_COUNT">
										</div>
										<div class="form-group has-success">
											<label class="control-label" for="inputSuccess">기준금액</label>
											<input type="text" class="form-control" id="PRICE" name="PRICE">
										</div>
										
										<p align="right">
										<input type="submit" value="등록하기" class="btn btn-primary"></input>
										<a href="<c:url value='/admin/openRouteList.do'/>" 
										button type="button" class="btn btn-primary">목록으로</a>
										</p>
								</div>	
								</form>
							</div>
						</div>
					</div>
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
