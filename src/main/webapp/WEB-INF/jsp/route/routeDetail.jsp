<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
	
	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">

			<div class="row">
				<div class="col-lg-12">
					<h2 class="page-header">상세보기</h2>

				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3>노선상세정보</h3>
						</div>
						<div class="panel-body">
							
								<div class="form-group has-success">
									<label class="control-label" for="inputSuccess">노선번호</label>
									${map.ITI_NO}
								</div>
								<div class="form-group has-success">
									<label class="control-label" for="inputSuccess">DEPARTURE</label>
									${map.DEP}
								</div>
								<div class="form-group has-success">
									<label class="control-label" for="inputSuccess">ARRIVAL</label>
									${map.ARR }
								</div>
								<div class="form-group has-success">
									<label class="control-label" for="inputSuccess">출발일시</label>
									${map.TI_DEP }
								</div>
								<div class="form-group has-success">
									<label class="control-label" for="inputSuccess">도착일시</label>
									${map.TI_ARR }
								</div>
								<div class="form-group has-success">
									<label class="control-label" for="inputSuccess">소요시간</label>
									${map.TI_FLY }
								</div>
								<div class="form-group has-success">
									<label class="control-label" for="inputSuccess">좌석수</label>
									${map.SEAT_COUNT }
								</div>
								<div class="form-group has-success">
									<label class="control-label" for="inputSuccess">기준금액</label>
									${map.PRICE }
								</div>
							
						</div>
						<div class="panel-footer">
							<p align="right">
								<a href="<c:url value='/admin/openRouteList.do'/>" 
								button type="button" class="btn btn-primary">목록으로</a> 
								
								<a href="<c:url value='/admin/openRouteUpdate.do?ITI_NO=${map.ITI_NO}'/>"
								button type="button" class="btn btn-primary">노선정보변경하기</a>
							</p>
						</div>
							
					</div>
				</div>
			</div>
			
		</div>
	</div>	
	
<!-- jQuery -->
		<script type="text/javascript"
			src="<c:url value='../_scripts/jquery.min.js'/>"></script>
		<!-- Bootstrap Core JavaScript -->
		<script type="text/javascript" src="../_scripts/bootstrap.min.js"></script>
		<!-- Metis Menu Plugin JavaScript -->
		<script type="text/javascript"
			src="<c:url value='../_scripts/metisMenu.min.js'/>"></script>
		<!-- Custom Theme JavaScript -->
		<script type="text/javascript"
			src="<c:url value='../_scripts/startmin.js'/>"></script>
	
	</body>	
</html>