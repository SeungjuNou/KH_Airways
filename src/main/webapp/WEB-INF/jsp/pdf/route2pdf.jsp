<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>pdf</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
</head>
<body style="font-family:MalgunGothic;">
		logo
	<ul>
		<li>노선정보현황</li>
		<li></li>
	</ul>
	<ul>
		<li>노선번호&nbsp;&nbsp;출발&nbsp;&nbsp;도착&nbsp;&nbsp;출발일시&nbsp;&nbsp;&nbsp;도착일시&nbsp;&nbsp;&nbsp;소요시간&nbsp;&nbsp;좌석수&nbsp;기준금액&nbsp;&nbsp;&nbsp;</li>
		<li></li>
	</ul>
	<c:forEach items="${list }" var="row">
	<ul>
		<li>${row.ITI_NO}&nbsp;${row.DEP}&nbsp;&nbsp;${row.ARR}&nbsp;&nbsp;${row.TI_DEP}&nbsp;&nbsp;${row.TI_ARR}&nbsp;&nbsp;${row.TI_FLY}&nbsp;&nbsp;${row.SEAT_COUNT}&nbsp;&nbsp;${row.PRICE}</li>
		<li></li>
	</ul>
	</c:forEach>
</body>
</html>