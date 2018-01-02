<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>boarding</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css" href="_css/pdfCss2?ver=1"/>
</head>
<body style="font-family:MalgunGothic;">
		
	<table class="mainTable2">
		<tr>
			<td class="title5" >${ticketMap.NAME}</td>
			<td class="title5" >${dep.DEP_DATE}</td>
			<td  id="plane" class="title5"> <p>logo</p> </td>
		</tr>
		<tr>
			<td class="line5"></td>
		</tr>
		<tr>
			<td rowspan="2" class="named3">KH ${depMap.ITI_NO}</td>
			<td class="named21">Departing</td>
			<td	class="named21">Seat</td>
		</tr>
		<tr>
			<td rowspan="2" class="named31">${depMap.TI_DEP}</td>
			<td rowspan="2" class="named31">${checkin.SEAT}</td>
		</tr>
		<tr>
			<td class="named21">to ${depMap.DEP}</td>
		</tr>
		<tr>
			<td class="line5"></td>
		</tr>
		<tr>
			<td rowspan="2" class="named31">Terminal 2</td>
			<td class="named21">Gate</td>
			<td rowspan="3" id="barcode26" style="font-family:barcode;"><p id="barcode6">${ticketMap.TK_NO}</p></td>
		</tr>
		<tr>
			<td rowspan="2" class="named31">D10</td>
		</tr>
		<tr>
			<td class="named21">Boarding area D</td>
		</tr>
	</table>

	<table class="mainTable2">
		<tr>
			<td class="title5" >${ticketMap.NAME}</td>
			<td class="title5" >${arr.DEP_DATE}</td>
			<td  id="plane" class="title5"> <p>logo</p> </td>
		</tr>
		<tr>
			<td class="line5"></td>
		</tr>
		<tr>
			<td rowspan="2" class="named3">KH ${arrMap.ITI_NO}</td>
			<td class="named21">Departing</td>
			<td	class="named21">Seat</td>
		</tr>
		<tr>
			<td rowspan="2" class="named31">${arrMap.TI_DEP}</td>
			<td rowspan="2" class="named31">${checkin.SEAT}</td>
		</tr>
		<tr>
			<td class="named21">to ${arrMap.DEP}</td>
		</tr>
		<tr>
			<td class="line5"></td>
		</tr>
		<tr>
			<td rowspan="2" class="named31">Terminal 2</td>
			<td class="named21">Gate</td>
			<td rowspan="3" id="barcode26" style="font-family:barcode;"><p id="barcode6">${ticketMap.TK_NO}</p></td>
		</tr>
		<tr>
			<td rowspan="2" class="named31">D10</td>
		</tr>
		<tr>
			<td class="named21">Boarding area D</td>
		</tr>
	</table>

	

</body>
</html>