<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>


<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">일간 리포트</h1>
			</div>
		</div>
		<!-- /.row -->


		<div class="row">
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-money fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge comma"></div>
								<div>오늘의 매출현황</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">일자별 매출 확인</span> <span class="pull-right"><i
								class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-green">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-shopping-cart fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">
									<h2>${salesMap.salesCount}</h2>
								</div>
								<div>오늘의 예약 건수</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">일자별 예약현황 확인</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-yellow">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-male fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">
									<h2>${salesMap.people}</h2>
								</div>
								<div>오늘 출발 승객</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">오늘 탑승자 확인</span> <span class="pull-right"><i
								class="fa fa-arrow-circle-right"></i></span>

							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-red">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-support fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">dummy</div>
								<div>웹 체크인 완료</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">웹 체크인 현황 확인</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">오늘의 승객 비율</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div id="piechart" class="flot-chart"></div>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-6 -->

			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">매출 현황</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div id="piechart2" class="flot-chart"></div>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-6 -->

		</div>
		<!-- /.row -->





	</div>
</div>

<script>
	$(document).ready(

	function() {

		var comma = ${salesMap.sales};

		var result = numberWithCommas(comma);
		$("<h2>" + result + "</h2>").appendTo(".comma");

		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	});
	
</script>

<script>

google.charts.load('current', {
	'packages' : [ 'corechart' ]
});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	var jsonData = 
		$.ajax({
		url : "maleFemale.do",
		dataType : "string",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async : false
	}).responseText;
	
	var 	data = new google.visualization.DataTable(jsonData);

	var options = {
		slices: {
            0: { color: '#7bacce' },
            1: { color: '#cc5555' }
          }
	};

	var chart = new google.visualization.PieChart(document
			.getElementById('piechart'));

	chart.draw(data, options);
	data = null;
}



google.charts.load('current', { 'packages' : [ 'corechart' ] });
google.charts.setOnLoadCallback(drawChart2);

function drawChart2() {
	var jsonData = 
		$.ajax({
		url : "salesPie.do",
		dataType : "string",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async : false
	}).responseText; 
	
	var 	data = new google.visualization.DataTable(jsonData);
	alert("test");
	var options = {
		slices: {
            0: { color: '#cc5555' },
            1: { color: '#7bacce' }
          } 
	};

	var chart = new google.visualization.PieChart(document
			.getElementById('piechart2'));

	chart.draw(data, options);
}


</script>


</body>
</html>
