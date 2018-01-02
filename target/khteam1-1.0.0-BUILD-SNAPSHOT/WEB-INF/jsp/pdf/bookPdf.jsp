<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>pdf</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css" href="_css/pdfCss?ver=1"/>
</head>
<body style="font-family:MalgunGothic;">
		
	<table class="mainTable">
		<tr>
			<td colspan="3" id="plane"> <p>logo</p> </td>
			<td colspan="3" id="barcode2" style="font-family:barcode;"><p id="barcode">${ticketMap.TK_NO}</p></td>
		</tr>
		<tr>
			<td colspan="6" class="title">전자항공권 (E-TICKET)</td>
		</tr>
		<tr>
			<td colspan="6" class="line"></td>
		</tr>
		<tr>
			<td class="named">NAME</td>
			<td class="named2" colspan="2">&nbsp;${ticketMap.NAME}</td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td class="named">BOOK No</td>
			<td class="named2" colspan="2">&nbsp;${bookMap.BOOK_NO}</td>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td class="named">TICKET No</td>
			<td class="named2" colspan="2">&nbsp;${ticketMap.TK_NO}</td>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td colspan="6" class="line"></td>
		</tr>
		<tr>
			<td class="named">출국편</td>
			<td class="named2">${depMap.ITI_NO} / ${depMap.DEP}</td>
			<td class="named">출발시간</td>
			<td class="named2">${depMap.TI_DEP}</td>
			<td class="named">도착시간</td>
			<td class="named2">${depMap.TI_ARR}</td>
		</tr>
		<tr>
			<td colspan="6" class="line"></td>
		</tr>
		<tr>
			<td class="named">귀국편</td>
			<td class="named2">${arrMap.ITI_NO} / ${arrMap.DEP}</td>
			<td class="named">출발시간</td>
			<td class="named2">${arrMap.TI_DEP}</td>
			<td class="named">도착시간</td>
			<td class="named2">${arrMap.TI_ARR}</td>
		</tr>

		<tr>
			<td colspan="6"></td>
		</tr>
		
		<tr>
			<td colspan="6" class="title"><p>수하물 규정 안내</p></td>
		</tr>
		<tr>
			<td colspan="6">
				위탁 수하물Checked Baggage의 기본 수하물 규정이 적용됩니다. Basic regulations apply.
			</td>
		</tr>
		<tr>
			<td colspan="6">
				기내 휴대 수하물 Carry-on Baggage *실제 탑승 항공사의 규정이 적용됩니다. 
			</td>
		</tr>
		<tr>
			<td colspan="6">
				Each operating carrier’s regulations apply.
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<p>상기의 수하물 허용량 및 수하물 요금은 참고용으로 제공되고 있습니다.</p> 
				<p>다음과 같은 특정 사항에 해당 시 추가 할인이 제공될 수 있습니다.</p> 
				<p>(예. 항공사 우수회원, 군인, 항공권 구매 시 지불 수단 등.)</p>
				<p>&nbsp;</p>
				<p>소지하신 전자 항공권에는 각각의 유효 기간 및 이용 조건이 적용됩니다. </p>
				<p>보다 자세한 사항은 항공사의 운임규정을 확인하시기 바랍니다.</p>
				<p>&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<p>Baggage allowance and charges are provided for information only. 
				Additional discounts may apply depending on specific factors. 
				(e.g. frequent flyer status, military, credit card used for purchase,
				early purchase over the internet, etc.)</p>
				<p>&nbsp;</p>
				<p>Most carrier's e-tickets have expiration dates and conditions of use.
				Check the carrier's fare rules for more information.</p>
			</td>
		</tr>
		

	</table>
</body>
</html>