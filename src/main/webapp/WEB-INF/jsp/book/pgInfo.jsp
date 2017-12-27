<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>KH - Airline</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="../_css/bootstrap.min.css" rel="stylesheet">
<link href="../_css/metisMenu.min.css" rel="stylesheet">
<link href="../_css/startmin.css" rel="stylesheet">
<link href="../_css/morris.css" rel="stylesheet">
<link href="../_css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<link rel="stylesheet" type="text/css" href="../_css/mypage.css" />

<script type="text/javascript">
	var handled = flase;
	function Upper(e,r) {
		r.value = r.value.toUpperCase();
	}

	$(document).ready(function(){
		location.reload();
	});
</script>

</head>
<body>

	<!--  top_header -->
	<div id="wrapper">

		<div id="top-1"></div>

		<div id="top-2">
			<div id="logo">
			<a href="../main.do"><img src="../_assets/icon.png" alt="" /></a>
			</div>
			<ul>
				<div id="menu">
					<li id="empty2"></li>
					<a href="../main.do"><li>항공권 예매</li></a>
					<li>${sessionScope.MEM_NAME}</li>
				</div>
			</ul>
		</div>

		<div id="body">
			<div id="body-inner">
				<div id="inner2">
					<ul>
					</ul>
				</div>

				<div id="inner3">

					<form action="/khteam1/book/bookSuccess.do" method="POST" onsubmit="if (handled) return false">
						<div class="row">
							<div class="col-lg-12">

								<div class="col-lg-9 left_fix">
									<div class="panel panel-default">

										<div class="panel-heading">
											<h2>탑승자 정보 입력</h2>
										</div>
										<!-- .panel-heading -->

										<div class="panel-body">
											<!-- 반복요소 시작 -->
											<c:forEach items="${list}" var="row" varStatus="status">
												<div class="panel panel-default">
													<div class="panel-heading">
														<h4 class="panel-title">
															<c:set var="collName" value="${row}"></c:set>
															<c:set var="tag2" value="#" />
															<a data-toggle="collapse" data-parent="#accordion"
																href="<c:out value='${tag2}${collName}'/>">
																<h3>
																	탑승자 ${status.count}
																	<c:if test="${(status.count) eq '1'}">(예약 대표자)</c:if>
																</h3>
															</a>
														</h4>
													</div>

													<div id="${row}"
														class="panel-collapse collapse <c:if test="${(status.count) eq '1'}">in</c:if>">
														<div class="panel-body"> 
															<div class="form-group col-lg-6">
																<label>
																	성별<text class="text-danger">*</text>
																</label> 
																<select name="sex${status.count}" class="form-control">
																	<option value="M" selected="selected">남성</option>
																	<option value="F">여성</option>
																</select>
															</div>
															
															<div class="form-group col-lg-6">
																<label>
																	나이구분<text class="text-danger">*</text>
																</label> 
																<select name="age${status.count}" class="form-control">
																	<option value="A" selected="selected">성인</option>
																	<option value="C">유아</option>
																	<option value="C">소아</option>
																</select>
															</div>

															<div class="form-group col-lg-6">
																<label>
																	<h4>
																		성
																		<text class="text-danger">*</text>
																	</h4>
																</label> <input name="fmName${status.count}" class="form-control" placeholder="예 : HONG"
																	onkeyup="Upper(event,this)"
																	onkeydown="if (event.ketCode == 13) handled = true"
																	onblur="handled = false" />
															</div>

															<div class="form-group col-lg-6">
																<label>
																	<h4>
																		이름
																		<text class="text-danger">*</text>
																	</h4>
																</label> <input name="lastName${status.count}" class="form-control"
																	placeholder="예 : GUILDONG" onkeyup="Upper(event,this)"
																	onkeydown="if (event.ketCode == 13) handled = true"
																	onblur="handled = false" />
															</div>

															<c:if test="${(status.count) eq '1'}">
																<div class="form-group col-lg-6">
																	<label>
																		<h4>
																			연락처
																			<c:if test="${(status.count) eq '1'}">
																				<text class="text-danger">*</text>
																			</c:if>
																		</h4>
																	</label>
																	<div class="form-group input-group">
																		<span class="input-group-addon">+82</span> 
																		<input name="phone" value="${map.phone}" 
																			class="form-control" placeholder="예 : 1098765432">
																	</div>
																	<p class="help-block">"-"를 제외한 숫자로만 작성하시기 바랍니다.</p>
																</div>

																<div class="form-group col-lg-6">
																	<label>
																		<h4>
																			이메일
																			<text class="text-danger">*</text>
																		</h4>
																	</label>
																	<div class="form-group input-group">
																		<span class="input-group-addon">@</span> 
																		<input name="email" value="${map.email}" 
																			class="form-control"
																			placeholder="예 : 1234@khairways.com">
																	</div>
																	<p class="help-block">&nbsp;</p>
																</div>
															
															</c:if>
															
															<div class="form-group col-lg-6">
																<label>
																	추가 수하물 <text class="text-danger">*</text>
																</label> 
																<select name="ck_bag${status.count}" class="form-control">
																	<option value="0" selected="selected">추가 수하물 없음</option>
																	<option value="1">24kg 1개 + 130,000</option>
																	<option value="2">24kg 2개 + 260,000</option>
																</select>
															</div>
															
															<div class="form-group col-lg-6">
																<label>
																	기내식 <text class="text-danger">*</text>
																</label> 
																<select name="meal${status.count}" class="form-control">
																	<option value="1" selected="selected" >일반 기내식</option>
																	<option value="2">차일드밀 선택(아동식)</option>
																	<option value="3">채식주의 식사</option>
																	<option value="4">글루텐 프리</option>
																</select>
															</div>


														</div>
													</div>
												</div>
											</c:forEach>
											<!-- 반복요소 종료 -->
										</div>
									</div>
								</div>
								<!-- .left contents -->


								<!-- /.col-lg-4 -->
								<div class="col-lg-3 total_next">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h3>전체 예약 정보</h3>
										</div>
										<div class="panel-body">

											<h4>${map.DEP} -> ${map.ARR}</h4>
											<p>${map.DEP_DATE1}</p>
											<p></p>
											<h4>${map.ARR} -> ${map.DEP}</h4>
											<p>${map.DEP_DATE2}</p>
											<p></p>
											<h3>항공운임 등 총계</h3>
											<h4>
												<p class="text-right text-info comma"></p>
											</h4>

											<blockquote>
												<p>유류할증료와 세금을 포함한 총 운임으로 구매 시점과 환율에 따라 변동 될 수 있습니다.</p>
											</blockquote>
											<ul id ="alert2">
											</ul>
										</div>
										<div class="panel-footer">
											<p class="text-right text-info">
												<button type="submit" name="pay" value="pay" 
													class="btn btn-outline btn-primary btn-lg btn-block">
													구매하기</button>
												<button type="submit" name="pay" value="miles" id="mileButton"
													class="btn btn-outline btn-primary btn-lg btn-block">
													마일리지 구매</button>
											</p>
										</div>
										<!-- footer end -->
									</div>
								</div>
								<!-- col3 end -->

							</div>
							<!-- col 12 end -->
						</div>
						<!-- /.row -->
					</form>

				</div>
			</div>
		</div>
	</div>



	<!-- jQuery -->
	<script src="../_scripts/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../_scripts/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../_scripts/metisMenu.min.js"></script>


	<!-- Custom Theme JavaScript -->
	<script src="../_scripts/startmin.js"></script>


<script>
$(document).ready(function(){
	
		
	
	var miles = parseInt("<c:out value="${miles.MILES}" />");
	var price = parseInt("<c:out value="${map.PRICE}" />");
	
	
	
	if(miles < price) {
		$("#mileButton").attr('disabled',true);
		$("<li>"+ "잔여 마일리지가 부족합니다." +"</li>").appendTo("#alert2");
		$("<li>"+ "현재 마일리지 : " + miles +"</li>").appendTo("#alert2");
	}
	
});
</script>


<script>
	$(document).ready(

	function() {

		var price = parseInt("<c:out value="${map.PRICE}" />");

		var result = numberWithCommas(price);
		$("<h4>" + result + "</h4>").appendTo(".comma");

		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	});
	
</script>


</body>
</html>