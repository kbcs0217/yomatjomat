<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="false" %>
 

<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "join";
String dp2 = "01";
%>
<div class="login_wrap mem_wrap">

	
</div>	
<script type="text/javascript">
agreeCheck()

$(document).ready(function(){
	var scrollst = $(".scrollst")
	scrollst.mCustomScrollbar({
		theme:"minimal-dark"
	});
})

<script>









	//모든 공백 체크 정규식
	var empJ = /\s/g;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{6,12}$/;
	var passwordRules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	// 닉네임 정규식
	var nicknameJ = /^[가-힣a-zA-Z0-9]{2,10}$/; //한글 영어 숫자만
	//휴대폰 정규식
	var phoneJ = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
	
	
	// 이메일 중복 검사(1 중복 || 0 사용가능)
	$('#email').blur(function(){
		
		// id = "id_reg" / name = "userId"
		var email = $('#email').val();
		var userData = {"email": email};
		console.log(email);
		
	
	
	    
		if(mailJ.test(email)){
			console.log(mailJ.test($('#email').val()));
			$("#email_check").text("");
			$("#reg_submit").attr("disabled", false);
		} else if(email=="") {
			$('#email_check').text('이메일을 입력해주세요 :)');
			$('#email_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
			$("#email_check").focus();
			return false;
		}else{
			$("#email_check").text("이메일은 @가 들어가야합니당");
			$("#email_check").css('color', 'red');
			$("#reg_submit").attr("disabled", true);
			$("#email_check").focus();
			return false;
		}
		
		
		
		
		
		$.ajax({
			type : 'GET',
			url : "${pageContext.request.contextPath}idCheck?email=" + email,
			dataType : 'json',
			//data : userData,
			success : function(result){
				console.log("1=중복o / 0=중복x : " +result);
			
				
				if(result==1){
					// 1 : 아이디가 중복되는 문구
					console.log("아이디 중복!!!");
					$("#email_check").text("이미 가입된 이메일입니다 :p");
					$("#email_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
				}else{
					console.log("사용 쌉가능");
					$("#email_check").css("color", "blue");
					$("#email_check").text("사용이 가능한 이메일입니다");
					//$('#email_check').html('사용가능한 이메일 입니다 <br/>'+'<input type="button" id="checkmail" onclick="EmailChecked();" value="이메일인증" />');
		
				}
			}, error : function(error) {
				console.log("실패");
			}
		});
		
	});
	    
	    
	    
	    
		
	
		/*
		$.ajax({
			type : 'POST',
			url : "idCheck",
			dataType : 'json',
			data : userData,
			success : function(result){
				console.log("1=중복o / 0=중복x : " +result);
			
				
				if(result==1){
					// 1 : 아이디가 중복되는 문구
					console.log("아이디 중복!!!");
					$("#email_check").text("이미 가입된 이메일입니다 :p");
					$("#email_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
				}else{
					console.log("사용 쌉가능");
					$("#email_check").css("color", "blue");
					$("#email_check").text("사용이 가능한 이메일입니다");
					
		
				}
			}, error : function(error) {
				console.log("실패");
			}
		});
		
	});
	*/



	







	
	
	

		
	

		
		
		
	// 비밀번호 유효성 검사
	// 1-1 정규식 체크
	$('#pwd').blur(function() {
		if (passwordRules.test($('#pwd').val())) {
			console.log('true');
			$('#pw_check').text('');
		} else {
			console.log('false');
			$('#pw_check').text('숫자 문자 특수문자 섞어서 6~12자리 입력');
			$('#pw_check').css('color', 'red');
		}
	});
	
	// 1-2 패스워드 일치 확인
	$('#pwd2').blur(function() {
		if ($('#pwd').val() != $('#pwd2').val()) {
			$('#pw2_check').text('비밀번호가 일치하지 않습니다 :(');
			$('#pw2_check').css('color', 'red');
		} else {
			$('#pw2_check').text('');
		}
	});
			
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
	
	

		
	
		/*
		$.ajax({
			type : 'POST',
			url : "${pageContext.request.contextPath}nickCheck",
			dataType : 'json',
			data : userData,
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
	*/
	

	
		
	
	
	


	

	
	/* function confirm_email(){
		console.log("인증 버튼");
		
		var email = $('#user_email').val();
		console.log("이메일" + email);
		
		$.ajax({
			url : '${pageContext.request.contextPath}/user/regMailConfirm',
			dataType : 'json',
			type : 'post',
			data : {
				"user_email" : email
			},
			success : function(data){
				console.log("dkjdl;kajf;klajfak;djfl;dakjfl;adjfl;akdfja;dklfja");
				console.log(data);
				alert('이메일이 전송되었습니다 :)');
				
			},error : function(error){
				alert(error);
			}
		});
		
	} */
	
	
	// 가입하기 실행 버튼 유효성 검사!
	var inval_Arr = new Array(4).fill(false);
	
	$('#reg_submit').click(function(){
		var phoneJ = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('#pwd').val() == ($('#pwd2').val()))
				&& passwordRules.test($('#pwd').val())) {
			inval_Arr[0] = true;
		} else {
			inval_Arr[0] = false;
		}
		// 닉네임 정규식
		if (nicknameJ.test($('#nickname').val())) {
			inval_Arr[1] = true;	
		} else {
			inval_Arr[1] = false;
		}
		//이메일 정규식
		if (mailJ.test($('#email').val())){
			console.log(mailJ.test($('#email').val()));
			inval_Arr[2] = true;
		} else {
			inval_Arr[2] = false;
		}
		if(phoneJ.test($('#phone').val())){
			
			inval_Arr[3] = true;
		}else{
			inval_Arr[3] = false;
		}

		

		var validAll = true;
		for(var i = 0; i < inval_Arr.length; i++){
			
			if(inval_Arr[i] == false){
				validAll = false;
			}
		}
		
		if(validAll){ // 유효성 모두 통과
			
			alert("이메일에서 인증메일을 확인하세요!");
		} else{
			alert('입력한 정보들을 다시 한번 확인해주세요 :)')
			/* return false; */
			}
	});
	
	
		
	
	 
	
	


</script>	
<style>
</style>
<%@ include file="../inc/footer.jsp" %>