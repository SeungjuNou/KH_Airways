<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/include-header2.jspf"%>

            <div id="inner3">
				
                
                
                 <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            
                            <div class="col-lg-12">
                        <div class="panel tabbed-panel panel-primary">
                            <div class="panel-heading clearfix">
                                <div class="panel-title pull-left"></div>
                                <div class="pull-right">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#tab-primary-1" data-toggle="tab">회원정보</a></li>
                                        <li><a href="#tab-primary-2" data-toggle="tab">수정하기</a></li>
                                        <li><a href="#tab-primary-3" data-toggle="tab">여권정보변경신청</a></li>
                                        <li><a href="#tab-primary-4" data-toggle="tab">탈퇴하기</a></li>
                                    </ul>
                                </div>
                            </div>
							<div class="panel-body">
								<div class="tab-content">
									<div class="tab-pane fade in active" id="tab-primary-1">
										<div class="col-lg-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<h4>회원정보보기</h4>
												</div>
												<!-- /.panel-heading -->
												<div class="panel-body">
													<div class="table-responsive">
														<div class="col-lg-12">
															<table class="table">
																<thead>
																	<tr>
																		<th>${map.NAME }</th>
																		<th>${map.E_FIRST }/${map.E_LAST }</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>마일리지번호</td>
																		<td>${map.MILE_NO }</td>
																	</tr>
																	<tr>
																		<td>생년월일</td>
																		<td>${map.BIRTH }</td>
																	</tr>
																	<tr>
																	<%-- <td>비밀번호</td>
																		<td>${map.PASSWORD }</td> --%>
																	</tr>
																	<tr>
																		<td>이메일주소</td>
																		<td>${map.EMAIL }</td>
																	</tr>
																	<tr>
																		<td>전화번호</td> 
																		<td>${map.PHONE }</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<!-- /.table-responsive -->
												</div>
												<!-- /.panel-body -->
											</div>
											<!-- /.panel -->
										</div>
										<!-- /.col-lg-6 -->
									</div>

									<div class="tab-pane fade" id="tab-primary-2">
										<div class="col-lg-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<h4>회원정보수정</h4>
												</div>
												<!-- /.panel-heading -->
												<div class="panel-body">
													<div class="table-responsive">
														<div class="col-lg-12">
															<table class="table">
															<form role="form" action="/khteam1/myPage/updateMember.do" method="post">
																<thead>
																	<tr>
																		<th>${map.NAME }</th>
																		<th>${map.E_FIRST }/${map.E_LAST }</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td><input type="hidden" name="NO" value="${map.NO }"/></td>
																	</tr>	
																	<tr>
																		<td>마일리지번호</td>
																		<td><input type="hidden" name="MILE_NO" value="${map.MILE_NO }"/>${map.MILE_NO }</td>
																	</tr>
																	<tr>
																		<td>생년월일</td>
																		<td><input type="hidden" name="BIRTH" value="${map.BIRTH }"/>${map.BIRTH }</td>
																	</tr>
																	<tr>
																		<td>비밀번호</td>
																		<td><input type="text" name="PASSWORD" value="${map.PASSWORD }"/></td>
																	</tr>
																	<tr>
																		<td>이메일주소</td>
																		<td><input type="text" name="EMAIL" value="${map.EMAIL }"/></td>
																	</tr>
																	<tr>
																		<td>전화번호</td>
																		<td><input type="text" name="PHONE" value="${map.PHONE }"/></td>
																	</tr>
																</tbody>
															</table>
															
															<p align="right">
															<input type="submit" value="수정하기" class="btn btn-primary"></input>
															</form>	
														</div>
													</div>
													<!-- /.table-responsive -->
												</div>
												<!-- /.panel-body -->
											</div>
											<!-- /.panel -->
										</div>
										<!-- /.col-lg-6 -->
									</div>
									<div class="tab-pane fade" id="tab-primary-3">
										<div class="col-lg-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<h4>요청고객정보</h4>
												</div>
												<!-- /.panel-heading -->
												<div class="panel-body">
													<div class="table-responsive">
														<div class="col-lg-12">
															<table class="table">
																	<tr>
																		<td>성명</td>
																		<td>${map.E_FIRST}/${map.E_LAST}</td>
																	</tr>
																	<tr>
																		<td>회원 아이디</td>
																		<td>${map.ID}</td>
																	</tr>
																
																	<tr>
																		<td>마일리지번호</td>
																		<td>${map.MILE_NO}</td>
																	</tr>
																	<tr>
																		<td>이메일주소</td>
																		<td>${map.EMAIL}</td>
																	</tr>
																	<tr>
																		<td>전화번호</td>
																		<td>${map.PHONE}</td>
																	</tr>
															</table>
														</div>
													</div>
													<!-- /.table-responsive -->
												</div>
												<!-- /.panel-body -->
											</div>
											<div class="panel panel-default">
												<div class="panel-heading">
													<h4>변경신청</h4>
												</div>
												<!-- /.panel-heading -->
												<div class="panel-body">
													<div class="table-responsive">
														<div class="col-lg-12">
															<table class="table">
															<form role="form" action="/khteam1/mypage/ppModifyApplyBoard.do" method="post" enctype="multipart/form-data" >
																	
																	<tr>
																		<td>이름</td>
																		<td><input type="text" name="TITLE" value="${map.TITLE}"/><input type="hidden" name="IDX" value="${map.IDX}"/></td>
																	</tr>
																	<tr>
																		<td>변경할 내용<br>
																		<td><input type="text" name="CONTENTS" value="${map.CONTENTS}"/></td>
																	</tr>
																	<tr>
																		<td>파일첨부</td>
																		<td><input type="file" name="file" value="파일선택"/></td>
																	</tr>
																
															</table>
														</div>
													</div>
													<!-- /.table-responsive -->
												</div>
												<!-- /.panel-body -->
											</div>
											<!-- /.panel -->
										</div>
												<p align="right">
														<input type="submit" value="신청하기" class="btn btn-primary"></input>
															</form>	
														</div>
											<!-- /.panel -->
										</div>
										<!-- /.col-lg-6 -->
									
									</div>
									<div class="tab-pane fade" id="tab-primary-4">
										<div class="col-lg-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<h4>회원탈퇴하기</h4>
												</div>
												<!-- /.panel-heading -->
												<div class="row">
									                <div class="col-lg-9">
									                    <div class="well">
									                      
									                        <p> [회원탈퇴하기] 버튼을 누르면 웹 페이지 및 마일리지 회원의 탈퇴 처리가 완료 됩니다.<br/>
																 회원 탈퇴시 등록된 개인 정보는 모두 삭제되며, 누적된 마일리지는 자동으로 소멸됩니다.<br/>
									                        </p>
									                    </div>
									                </div>
									            
												

												</div>
												<p align="right">
													<a href="<c:url value='/myPage/viewMember.do'/>" 
														button type="button" class="btn btn-primary">리스트로 돌아가기</a> 												
													<a href="<c:url value='/myPage/deleteMember.do?ID=${sessionScope.ID}'/>" 
														button type="button" class="btn btn-primary">회원탈퇴하기</a> 
											</div>
											<!-- /.panel -->
										</div>
										<!-- /.col-lg-6 -->
									
									</div>
									
								</div>
							</div>
						</div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-6 -->
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