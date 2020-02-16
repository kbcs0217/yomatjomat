<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" %>
<%@ include file="../inc/god.jsp" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<body class="login_wrap mem_wrap">
<!-- Cookie가 비어있지 않을 때 checked 속성을 줌 -->
	<c:if test="${not empty cookie.user_check}">
		<c:set value="checked" var="checked"/>
	</c:if>
	<p class="mem_logo" onclick="location.href='../'">
		<img src="/images/m_logo.png">
	</p>
	<div class="login_wrapin">
		<div class="box1">
			<div class="login_box">
				<dl class="mem">
                    <dt class="tit"><span class="t1">회원정보확인</span></dt>
                    <dd class="inp_wrap"><i class="xi xi-user-o"></i><input id="inputId" name="email" type="text" class="inp" value="${userSession.email}" disabled="true"></dd>
                    <dd class="inp_wrap"><i class="xi xi-lock-o"></i><input id="inputPassword" name="pwd" type="password" class="inp" placeholder="비밀번호를 입력하세요"></dd>
					<div class="form-group">
					<span class="font-weight-bold text-white bg-dark"
						id="spanLoginCheck"></span>
					</div>
					<div class="form-group">
			
				
				<!-- 네이버 로그인 창으로 이동 -->
			



					
                    <dd class="btn_wrap"><input id="loginBtn" type="submit" class="btn" value="회원정보확인"></dd>
               
                </dl>
			</div>
		</div>
	</div>

</body>

<script>
	$(document).ready(function(){
		//애니메이션 메서드
		new WOW().init();
		
		
		
		
		
		//아이디input에서 엔터입력시 비밀번호input으로 포커스이동
		$('#inputId').keydown(function(event){
			if(event.keyCode == 13){
				$('#inputPassword').focus();
			}
		});
		//비밀번호input에서 엔터입력시 로그인버튼 클릭됨
		$('#inputPassword').keydown(function(event) {
			if(event.keyCode == 13){
				$('#loginBtn').trigger('click');
			}
		});
	});
	
	// 로그인 id / pw 유효성 검사
	$('#loginBtn').click(function() {
		var id = $('#inputId').val();
		var pw = $('#inputPassword').val();
		
		
		
	    console.log(id);
	    console.log(pw);
	    
			$.ajax({
			type : 'post',
			url : 'infocheck',
			dataType : 'json',
			data : {
				email : id,
				pwd : pw,
				
				},
				success : function(result) {
					if (result == 0) { //로그인 실패시
						console.log(result);
						$('#spanLoginCheck').text('확인정보를 정확히 입력해주세요.');
					} else { //로그인 성공시
						console.log(result);
						location.href = '/member/update';
					}
				}, error : function(error) {
					console.log("실패");
				}
			});
		});
</script>
</html>