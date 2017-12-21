<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KH - Airline</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>

<div id="access">
	<form id="findID">
		이름 : <input name="NAME">
		이메일 : <input name="EMAIL">
		<input type="submit">
	</form>
</div>
<div id="access2">
	<form id="accessCheck" method="post">
	
	</form>
</div>
<div id="close">

</div>

</body>

<script type="text/javascript">
$('#findID').submit(function(event){
	event.preventDefault();

	var param = $(this).serialize();
	$.ajax({
		type: "post",
		url: "findId.do",
		data: param,
		success: function(data){
			if(data == false) {
				alert("이름과 이메일이 맞지 않습니다.");
			} else {
				alert("인증번호를 이메일로 발송했습니다.");
				accessAppend();
			}
		}
		
	});
});

function accessAppend(){
	$("#access").empty();
	$("#accessCheck").append(
		"인증번호 : <input name='accessNo'>" + 
		"<input type='submit'>");
}


$("#accessCheck").submit(function(event){
	event.preventDefault();
	
	var param = $(this).serialize();
	$.ajax({
		type: "post",
		url: "accessCheck.do",
		data: param,
		success: function(data){
			if(data == 'false') {
				alert("인증번호가 다릅니다.");
			} else {
				resultAppend(data);
			}
		}
		
	});
});

function resultAppend(result){
	$("#access2").empty();
	$("#close").append(
		"고객님의 ID는 " + result + " 입니다." +
		"<button id='close'>닫기</button>");
}

$("#close").click(function(){
	self.close();
});

</script>
</html>