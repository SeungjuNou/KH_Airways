<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>


<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">월간 리포트</h1>
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
								<div>매출현황</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left"></span> <span class="pull-right"><i
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
									<h4>${salesMap.salesCount}</h4>
								</div>
								<div>예약 건수</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left"></span> <span class="pull-right"><i
								class="fa fa-arrow-circle-right"></i></span>

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
									<h4>${salesMap.people}</h4>
								</div>
								<div>출발 승객</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left"></span> <span class="pull-right"><i
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
								<div class="huge">
									<h4>15</h4>
								</div>
								<div>웹 체크인 완료</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left"></span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<!-- /.row -->
		
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">월간 매출 그래프</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div id="curve_chart"></div>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-6 -->

		</div>
		<!-- /.row -->
		

		<div class="row">
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">승객 비율</div>
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
					<div class="panel-heading">예약 현황</div>
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
		$("<h4>" + result + "</h4>").appendTo(".comma");

		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	});
	
</script>

<script>
	$(document).ready(

	function() {

		var comma = $
		{
			salesMap.sales
		}
		;

		var result = numberWithCommas(comma);
		$("<h4>" + result + "</h4>").appendTo(".comma");

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
		var when = {
			"when" : "week"
		};
		var jsonData = $.ajax({
			url : "monthMaleFemale.do",
			data : when,
			dataType : "string",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			async : false
		}).responseText;

		var data = new google.visualization.DataTable(jsonData);

		var options = {
			slices : {
				0 : {
					color : '#7bacce'
				},
				1 : {
					color : '#cc5555'
				}
			}
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));

		chart.draw(data, options);
		data = null;
	}

	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart2);

	function drawChart2() {
		var when = {
			"when" : "month"
		};
		var jsonData = $.ajax({
			url : "salesPie.do",
			type : "POST",
			data : when,
			dataType : "string",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			async : false
		}).responseText;

		var data = new google.visualization.DataTable(jsonData);
		var options = {
			slices : {
				0 : {
					color : '#cc5555'
				},
				1 : {
					color : '#7bacce'
				}
			}
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart2'));

		chart.draw(data, options);
	}

	
	
	
	google.charts.load('current', {
		'packages' : [ 'corechart', 'bar' ]
	});
	google.charts.setOnLoadCallback(drawChart3);

	function drawChart3() {

		var jsonData = $.ajax({
			url : "salesChart.do",
			type : "POST",
			dataType : "string",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			async : false
		}).responseText;

		var data = new google.visualization.DataTable(jsonData);

		var options = {
			title : 'Company Performance',
			hAxis: {
		          format: 'yy-MM-dd',
		        },
		        vAxis: {
		          title: 'Rating (scale of 1-10)'
		        }
			
		};

		var chart = new google.visualization.ColumnChart(
		        document.getElementById('curve_chart'));

		chart.draw(data, options);
	}
</script>


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
