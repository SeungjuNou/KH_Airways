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
                                <h3>회원정보수정</h3>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
								<form action="/admin2/updateMember.do" method="post">
									<table class="table table-striped table-bordered table-hover">
										<tr>
											<td>회원번호 : ${map.NO} <input type="hidden" name="NO" value="${map.NO}"/></td>
										</tr>
										<tr>
											<td>아이디 : ${map.ID}</td>
										</tr>
										<tr>
											<td>비밀번호 :<input type="password" name="PASSWORD" value="${map.PASSWORD}"/></td>
										</tr>
										<tr>
											<td>이름 : ${map.NAME}</td>
										</tr>
										<tr>
											<td>영문이름 : ${map.E_FIRST}${map.E_LAST}</td>
										</tr>
										<tr>
											<td>생년월일 : ${map.BIRTH}</td>
										</tr>
										<tr>
											<td>이메일 : <input type="text" name="EMAIL" value="${map.EMAIL}"/></td>
										</tr>
										<tr>
											<td>휴대폰번호 : <input type="text" name="PHONE" value="${map.PHONE}"/></td>
										</tr>
										<tr>
											<td>마일리지번호 : ${map.MILE_NO}</td>
										</tr>
										<tr>
											<td>회원등급 : ${map.GRADE}<input type="hidden" name="GRADE" value="${map.GRADE}"/></td>
										</tr>	
                                    </table>
					 				<input type="submit" id="update" value="수정"/>
								</form>
								</div>
                                    
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