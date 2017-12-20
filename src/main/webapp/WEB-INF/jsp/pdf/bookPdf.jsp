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
		<li>티켓</li>
		<li>예약번호</li>
		<li>${bookMap.BOOK_NO}</li>
		<li>티켓번호</li>
		<li>${ticketMap.TK_NO}</li>
		<li>이름</li>
		<li>${ticketMap.NAME}</li>
		<li>출발지</li>
		<li>${map.DEP}</li>
		<li>출발시간</li>
		<li>${map.TIME1_1}</li>
		<li>도착시간</li>
		<li>${map.TIME1_2}</li>
		<li>도착지</li>
		<li>${map.ARR}</li>
		<li>출발시간</li>
		<li>${map.TIME2_1}</li>
		<li>도착시간</li>
		<li>${map.TIME2_2}</li>
	</ul>
</body>
</html>