<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">     

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">항공 관리 현황</h1>

                </div>
            </div>


            <div class="panel panel-default">
                <div class="panel-body">


                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3>항공 현황
                  					<p align="right">
                  						<a href="./flightRegFrom.do">
                  						<button type="button" class="btn btn-primary">새로 등록하기</button>
                  						</a>
                  					</p>
                				</h3>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body" align="center">
                            	<form action="flightAdminSearch.do">
                            	<label>검색</label>
                            	<select class="form-control" style="width: 15%; display: inline;" name="type">
                            		<option value="1">노선번호</option>
                            		<option value="2">코드번호</option>
                            	</select>
                            	<input class="form-control" style="width: 15%; display: inline;" name="search">
                            	<label>기간</label>
                            	<input class="form-control" style="width: 15%; display: inline;" type="date" name="DEP_DATE1">
                            	~
                            	<input class="form-control" style="width: 15%; display: inline;" type="date" name="DEP_DATE2">
                            	<button type="submit" class="btn btn-primary">조회</button>
                            	</form>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped" >
                                        <thead>
                                            <tr>
                                                <th>노선 번호</th>
                                                <th>코드 번호</th>
                        						<th>좌석 갯수</th>
                        						<th>예약 좌석 갯수</th>
                        						<th>운항 날짜</th>
                        						<th>수정 여부</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="flight" items="${flightList}">
                                            <tr>
                                            	<td>${flight.ITI_NO}</td>
                                            	<td>${flight.CODE}</td>
                                            	<td>${flight.SET_COUNT}</td>
                                            	<td>${flight.BOOK_SET}</td>
                                            	<td>${flight.DEP_DATE}</td>
                                            	<td></td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <div align="center">
                                	<a>이전</a>
                                	<a>1</a>
                                	<a>다음</a>
                                </div>
							</div>
						</div>
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
