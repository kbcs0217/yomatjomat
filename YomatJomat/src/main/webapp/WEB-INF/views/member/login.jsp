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
                    <dt class="tit"><span class="t1">회원로그인</span></dt>
                    <dd class="inp_wrap"><i class="xi xi-user-o"></i><input id="inputId" name="email" type="text" class="inp" placeholder="이메일을 입력하세요"value="${cookie.user_check.value}"></dd>
                    <dd class="inp_wrap"><i class="xi xi-lock-o"></i><input id="inputPassword" name="pwd" type="password" class="inp" placeholder="비밀번호를 입력하세요"></dd>
					<div class="form-group">
					<span class="font-weight-bold text-white bg-dark"
						id="spanLoginCheck"></span>
					</div>
					<div class="form-group">
					<label class="font-weight-bold text-white"> 
						<input type="checkbox" id="remember_us" name="remember_userId" ${checked}> 아이디 기억하기
						
					</label>
			
				
				<!-- 네이버 로그인 창으로 이동 -->
				<div id="naver_id_login" style="text-align:center"><a href="${url}">
					<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
					<br>
					<div id="kakao_id_login" style="text-align: center"> <a href="${kakao_url}">
					 <img width="223" src="/resources/images/kakao_account_login_btn_medium_narrow.png" /></a> </div>





					
                    <dd class="btn_wrap"><input id="loginBtn" type="submit" class="btn" value="회원 로그인"></dd>
                    <dd class="btn_wrap2">
                    	<p class="log_join">
                    	<a class="" href="join1">회원가입</a>
                    	</p>
                    	<p class="log_pwf">
                    	<a class="" href="${pageContext.request.contextPath}userSearch">아이디/비밀번호 찾기</a>
                    	</p>

                    </dd>
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
		
		var remember_us = $('#remember_us').is(':checked');
		
	    console.log(id);
	    console.log(pw);
	    console.log(remember_us);
			$.ajax({
			type : 'post',
			url : 'login',
			dataType : 'json',
			data : {
				email : id,
				pwd : pw,
				remember_userId : remember_us
				},
				success : function(result) {
					if (result == 0) { //로그인 실패시
						console.log(result);
						$('#spanLoginCheck').text('로그인 정보를 정확히 입력해주세요.');
					} else if (result == -2) { //인증하지 않았다면?
						console.log(result);
						$('#spanLoginCheck').text('이메일 인증을 해주셔야 합니다!');						
					} else if (result == -3) { // 아이디가 사용중이라면?
						console.log(result);
						location.href = '${pageContext.request.contextPath}redundant?email=' + id + '&pwd=' + pw + '&remember_userId=' + remember_us;						
					} else { //로그인 성공시
						console.log(result);
						location.href = '/';
					}
				}, error : function(error) {
					console.log("실패");
				}
			});
		});
</script>
</html>