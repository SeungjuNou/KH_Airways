<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/include/include-header.jspf" %>
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">     

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">항공편 기간 등록</h1>
                </div>
            </div><!-- /.row -->


            <div class="panel panel-default">
                <div class="panel-body">   

                    <div class="col-lg-7">
                        <div class="panel panel-default">
                            <div class="panel-heading">
	                            <form role="form" action="./flightReg.do" method="post" >
	                            <div class="form-group has-success">
								<label class="control-label" for="inputSuccess">노선</label>
								<select class="form-control" name="ITI_NO">
									<c:forEach var="route" items="${rourte}">
										<option value="${route.ITI_NO}">노선번호 = ${route.ITI_NO} :: 노선 = ${route.DEP} -> ${route.ARR} :: 시간 = ${route.TI_DEP}~${route.TI_ARR}</option>
									</c:forEach>
								</select>
								</div>
								<div class="form-group has-success">
								<label class="control-label" for="inputSuccess">기간</label>
								<input type="date" class="form-control" name="DEP_DATE1"> 
								<label class="control-label" for="inputSuccess"> ~ </label>
								<input type="date" class="form-control" name="DEP_DATE2">
								</div>
								<p align="right">
									<input type="submit" class="btn btn-primary" value="등록">
								</p>
								</form>
                           	</div><!-- /.panel-heading -->
                    	</div>
                    </div>
                    
				</div>
		</div>
	</div>
</div>





</body>
</html>
