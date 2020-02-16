<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




<style>
*{
	font-size: 20px;
	font-family: 'BMHANNAPro';
}
input{
	font-family: sans-serif;
}
html, body {
	height: 100%;
}
body {
	margin: 0;
}
.container {
	min-height: 100%;
	width: 28.9%;
}
.titleStyle {
	padding: 30px;
	margin-top: 10px;
	margin-bottom: 10px;
	/* color: #2E64FE; */
	color: black;
}
.container h1 {
	font-family: "Righteous";
	font-size: 80px;
	text-align: center;
}
.reg_button {
	padding: 20px;
	text-align: center;
}
.select_pick{
	display:inline;
    width: 35%;
    height: 40px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.0;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 15px;
}
</style>



</head>

<body>



<div class="container">
		<div class="titleStyle">
			<h2>회원정보수정</h2>
		</div>
		<p>
		닉네임과 휴대폰번호만 변경이 가능합니다. 비밀번호는  <a href="pwdupdate">비밀번호변경</a>  을 이용하세요!
		</p>
		<form method="POST" name="fofo">
		<input type="hidden" value="${userSession.email}">


			
			<!-- 닉네임-->
			<div class="form-group">
				<label for="nickname">닉네임</label>
				
					<input type="text" class="form-control" id="nickname" name="nickname" placeholder="NickName"  required>
				<div class="check_font" id="nickname_check"></div>
			</div>
			<!-- 휴대폰번호-->
			<div class="form-group">
				<label for="phone">휴대폰번호</label>
					<input type="text" class="form-control" id="phone" name="phone" placeholder="PhoneNumber"  required>
				<div class="check_font" id="phone_check"></div>
			</div>
			
			


			
	
			
		
			<div class="reg_button">
			
				<button class="btn btn-primary px-3" id="reg_submit">
					
					<i class="fa fa-heart pr-2" aria-hidden="true"></i>정보수정
					
					
				</button>
			</div>
		</form>
	</div>
</body>

<script>









	//모든 공백 체크 정규식
	var empJ = /\s/g;
	
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{6,12}$/;
	var passwordRules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	// 닉네임 정규식
	var nicknameJ = /^[가-힣a-zA-Z0-9]{2,10}$/; //한글 영어 숫자만
	//휴대폰 정규식
	var phoneJ = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
	
	
			
	$('#phone').blur(function(){
		var phoneJ = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
		// id = "id_reg" / name = "userId"
		var phone = $('#phone').val();
		var userData = {"phone": phone};
		console.log(phone);
		
	
	  
	    
	    

	    

	   
	    
		if(phoneJ.test(phone)){
			$("#phone_check").text("");
			$("#reg_submit").attr("disabled", false);
		} else if(phone=="") {
			$('#phone_check').text('휴대폰번호를 입력해주세요 :)');
			$('#phone_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
			$("#phone_check").focus();
			return false;
		}else{
			$("#phone_check").text("-를 붙여서 숫자만입력해주세요!!!");
			$("#phone_check").css('color', 'red');
			$("#reg_submit").attr("disabled", true);
			$("#phone_check").focus();
			return false;
		}
		
});
	// 닉네임에 특수문자 들어가지 않도록 설정
	$("#nickname").blur(function() {
		
		// id = "id_reg" / name = "userId"
		var nickname = $('#nickname').val();
		var userData = {"nickname": nickname};
		console.log(nickname);
		var token = $("input[name='_csrf']").val();
		var header = "X-CSRF-TOKEN";
		$(document).ajaxSend(function(e, xhr, options) {
		   xhr.setRequestHeader(header, token);
		});
		
	
	   
	    
		// 이메일
		if(nicknameJ.test(nickname)){
			console.log(nicknameJ.test($('#nickname').val()));
			$("#nickname_check").text("");
			$("#reg_submit").attr("disabled", false);
		} else if(nickname=="") {
			$('#nickname_check').text('닉네임을 입력해주세요 :)');
			$('#nickname_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
			$("#nickname_check").focus();
			return false;
		}else{
			$("#nickname_check").text("닉네임을 확인해주세요");
			$("#nickname_check").css('color', 'red');
			$("#reg_submit").attr("disabled", true);
			$("#nickname_check").focus();
			return false;
			
			
		}
		
		
		
		$.ajax({
			type : 'GET',
			url : "nickCheck?nickname=" + nickname,
			dataType : 'json',
			//data : userData,
			success : function(result){
				console.log("1=중복o / 0=중복x : " +result);
				
				if(result==1){
					// 1 : 아이디가 중복되는 문구
					console.log("닉네임 중복!!!");
					$("#nickname_check").text("이미 있는 닉네임 입니다 :p");
					$("#nickname_check").css("color", "red");
					$("#nickname_check").attr("disabled", true);
				} else{
					console.log("사용 쌉가능");
					$("#nickname_check").css("color", "blue");
					$("#nickname_check").text("사용이 가능합니다 :p");
				
				}
				
			}, error : function(error) {
				console.log("실패");
			}
		});
		
	});
	
	

		

	// 가입하기 실행 버튼 유효성 검사!
	var inval_Arr = new Array(2).fill(false);
	
	$('#reg_submit').click(function(){
		var phoneJ = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		
		// 닉네임 정규식
		if (nicknameJ.test($('#nickname').val())) {
			inval_Arr[0] = true;	
		} else {
			inval_Arr[0] = false;
		}
		
		if(phoneJ.test($('#phone').val())){
			
			inval_Arr[1] = true;
		}else{
			inval_Arr[1] = false;
		}

		

		var validAll = true;
		for(var i = 0; i < inval_Arr.length; i++){
			
			if(inval_Arr[i] == false){
				validAll = false;
			}
		}
		
		if(validAll){ // 유효성 모두 통과
			
			alert('회원정보수정성공, 다시 로그인해주세요');
			document.fofo.submit;
		} else{
			alert('입력한 정보들을 다시 한번 확인해주세요 :)')
			/* return false; */
			}
	});
	
	
		
	
	 
	
	
</script>
</html>



