<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>

            <div id="inner3">
				 <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                               		 마일리지 현황
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                
                                	 <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>마일리지 내역(miles)</th>
                                                <th>사용 마일리지(miles)</th>
                                                <th>적립 마일리지(miles)</th>
                                                <th>잔여 마일리지(miles)</th>
                                                <th>일시</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
 									<c:forEach var="list" items="${list}" varStatus="status">
 									
                                            <tr>
                                                <td>${status.count}</td>
                                                <th>${list.MILES_TEXT}</th>
                                                <td>${list.USE_MILES}</td>
                                                <td>${list.SAVE_MILES}</td>
                                                <td>${list.MILES}</td>
                                                <td>${list.USE_DATE}</td>
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
                </div>
                <!-- /.row -->



            </div>
        </div>
    </div>


</div>



<!-- jQuery -->
<script type="text/javascript" src="<c:url value='../_scripts/jquery.min.js'/>"></script>
<!-- Bootstrap Core JavaScript -->
<script type="text/javascript" src="<c:url value='../_scripts/bootstrap.min.js'/>"></script>
<!-- Metis Menu Plugin JavaScript -->
<script type="text/javascript" src="<c:url value='../_scripts/metisMenu.min.js'/>"></script>
<!-- Flot Charts JavaScript -->
        <script src="_scripts/flot/excanvas.min.js"></script>
        <script src="_scripts/flot/jquery.flot.js"></script>
        <script src="_scripts/flot/jquery.flot.pie.js"></script>
        <script src="_scripts/flot/jquery.flot.resize.js"></script>
        <script src="_scripts/flot/jquery.flot.time.js"></script>
        <script src="_scripts/flot/jquery.flot.tooltip.min.js"></script>
        <script src="_scripts/flot-data.js"></script>

<!-- Custom Theme JavaScript -->
<script type="text/javascript" src="<c:url value='../_scripts/startmin.js'/>"></script>


</body>
</html>