<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>


    <!-- Page Content -->
    <div id="body">
        <div id="body-inner">
            <div id="inner1">
                  <div class="row">
                    <div class="col-lg-12">
                      <h2 class="page-header">WEB CHECKIN</h2>
                    </div>
                  </div>
            </div>
            
                <div class="row">
                  <div class="col-lg-12">
                    <div class="panel panel-default">
                      <div class="panel-heading">
							예약번호조회
                      </div>
                      <div class="panel-body">
                        <form role="form" action="/khteam1/webcheck/webCheckStep1.do" method="post">
                          <div class="form-group has-success">
                            <label class="control-label" for="inputSuccess">예약번호</label>
                            <select class="form-control" name="BOOK_NO" id="inputSuccess">
                            		<c:forEach items="${result}" var="row">
                                <option>${row.BOOK_NO}</option>
                                </c:forEach>
                            </select>
                          </div>

                          <!-- <div class="form-group has-success">
                            <label class="control-label" for="inputSuccess">탑승일</label>
                            <input type="text" class="form-control" id="inputSuccess" placeholder="2017/12/7">
                          </div>
 -->
                          <div class="col-lg-12">
                            <div class="well">
                              <h4>웹 체크인 대상 및 이용시간</h4>
                              <p>
					                                예약이 확약된 e-티켓 소지 승객</br>
					                                국내선: 항공편 출발 예정 48시간 ~ 40분 전</br>
					                                국제선: 항공편 출발 예정 48시간 ~ 1시간 전</br>
                                (미주/캐나다/영국 : 항공편 출발 예정 24시간 ~ 1시간 전)</p>
                            </div>
                          </div>


                      </div>

                      <div class="panel-footer">
                        <p align="right">
                          
                          <input type="submit" value="계속" class="btn btn-primary"/>
                          
                        </p>
                      </div>
              </form>
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

</body>
</html>