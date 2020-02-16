<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>MS</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>




<style>
* {
	font-size: 20px;
	font-family: 'BMHANNAPro';
}
input {
	font-family: sans-serif;
}
html, body {
	background-color: black;
	height: 100%;
}
body {
	margin: 0;
}
.container {
	min-height: 80%;
	position: relative;
}
.full { <%--
	background-image:
		url("<%=request.getContextPath()%>/images/login-back.jpg"); --%>
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 70%;
}
.a_none {
	font-size: 16px;
	font-weight: bolder;
}
.interval_height {
	margin-bottom: 5px;
}
.area_inputs {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	width: 30%;
	height: 30%;
}
.select_pick {
	display: inline;
	width: 70%;
	height: 40px;
	padding: 6px 12px;
	font-size: 17px;
	line-height: 1.0;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 15px;
}
.socialimage{
	height: 63.5px;
	display: inline-block;
}
</style>
</head>

<body>





	<!-- Cookie가 비어있지 않을 때 checked 속성을 줌 -->
	<c:if test="${not empty cookie.user_check}">
		<c:set value="checked" var="checked"/>
	</c:if>
	<div class="full">
		
		<div class="container">
			<div class="area_inputs wow fadeIn">
				<div class="form-group">
				<a href="/">메인으로</a>
					<label class="font-weight-bold text-white" for="inputId">이메일</label>
					<div>
						<input type="text" class="form-control" id="inputId" name="email" value="${cookie.user_check.value}" placeholder="이메일">
					</div>
				</div>
				<div class="form-group">
					<label class="font-weight-bold text-white" for="inputPassword">비밀번호</label>
					<div>
						<input type="password" class="form-control" id="inputPassword" name="pwd" placeholder="비밀번호">
					</div>
				</div>
				<div class="form-group">
					<span class="font-weight-bold text-white bg-dark"
						id="spanLoginCheck"></span>
				</div>
				<div class="form-group">
					<label class="font-weight-bold text-white"> 
						<input type="checkbox" id="remember_us" name="remember_userId" ${checked}> 아이디 기억하기
						
					</label>
					<!--  
					<div class="interval_height a_none">
						<a href="${pageContext.request.contextPath}idfindform">&nbsp; 아이디찾기</a>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</div>
					-->
					<div class="interval_height a_none">
						<a href="${pageContext.request.contextPath}userSearch">&nbsp; 아이디 / 비밀번호 찾기</a>
						
					</div>
					<div>
					
						<button id="loginBtn" type="button"	class="btn btn-primary btn-block">로그인</button>
						
						
					</div>
				</div>
				<div class="form-group">
					<a class="btn btn-deep-orange btn-block" href="${pageContext.request.contextPath}signup">회원가입</a>
				</div>
				<!-- 네이버 로그인 창으로 이동 -->
				<div id="naver_id_login" style="text-align:center"><a href="${url}">
					<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
					<br>
					<div id="kakao_id_login" style="text-align: center"> <a href="${kakao_url}">
					 <img width="223" src="/resources/images/kakao_account_login_btn_medium_narrow.png" /></a> </div>
					
				


			
				
				
				
				
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