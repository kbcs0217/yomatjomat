<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>

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
	height: 50%;
	position: relative;
}
.full {
	background-color: black;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 100%;
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
.sub_title {
	padding-bottom: 2px;
	margin-bottom: 15px;
	font-size: 23px;
	border-bottom: 1px solid #cecece;
}
.select_pick{
	display:inline;
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
.layout_search{
	mar
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/modal/userIdSearchModal.jsp" %>

	<div class="full">
		<div class="container">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-white">
					<h3>아이디/비밀번호 찾기</h3>
					<p>인증된 이메일만 정보 찾기가 가능합니다 :)</p>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold text-white" for="search_2">비밀번호 찾기</label>
				</div>
				<div id="searchI">
				
					<div class="form-group">
						<label class="font-weight-bold text-white" for="phone">휴대폰번호</label>
						<div>
							<input type="text" class="form-control" id="phone" name="phone" placeholder="ex) 010-1234-5678">
						</div>
					</div>
			
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
					</div>
				</div>
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="email">아이디</label>
						<div>
							<input type="text" class="form-control" id="email" name="email" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
				
				
					<div class="form-group">
						<button id="searchBtn2" type="button" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	
	//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";
			
			
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
			
			
		}
	}
	$(document).ready(function() {
		/////////모///달///기///능///////////
		// 1. 모달창 히든 불러오기
		$('#searchBtn').click(function() {
			console.log("modal1");
			$('#background_modal').show();
		});
		// 2. 모달창 닫기 버튼
		$('.close').on('click', function() {
			console.log("modal2");
			$('#background_modal').hide();
		});
		// 3. 모달창 위도우 클릭 시 닫기
		$(window).on('click', function() {
			console.log("modal3");
			if (event.target == $('#background_modal').get(0)) {
	            $('#background_modal').hide();
	           
	         }
		});
		
	});
	
	// 아이디 & 스토어 값 저장하기 위한 변수
	var idV = "";
	/* var storeV = ""; */
	// 아이디 값 받고 출력하는 ajax
	
	var idSearch_click = function(){
		
		var phone= $('#phone').val();
		var userData = {"phone": phone};
		console.log(phone);
		 var token = $("input[name='_csrf']").val();
		    var header = "X-CSRF-TOKEN";
		    $(document).ajaxSend(function(e, xhr, options) {
		        xhr.setRequestHeader(header, token);
		    });
		
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}userSearch",
			datatype:'json',
			data: userData,
			success:function(data){
				console.log("값을 확인합니다:"+data);
				
				if(data == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");	
				} else {
					$('#id_value').text(data);
					// 아이디값 별도로 저장
					idV = data;
					/* storeV = $("#store_id1 option:selected").val(); */
				}
				},error : function(error){
					console.log("실패");
				}
			});
	}
	
	// 비밀번호 찾기 이메일로 보내기
	$('#searchBtn2').click(function(){
		alert("잠시만 기다려주시면 곧 보내드리겠습니다");
		console.log("패스워드 찾기 : ajax 들어가기 전");
		console.log($('#email').val());
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}searchPassword?email="
					+ $('#email').val(),
			success : function(data){
					
						alert("해당 이메일로 임시 비밀번호를 발송하였습니다.");
			}
			
		});
		
	});
	
	// 비밀번호 찾기 눌렀을 때
	// 1 패스워드 찾기 창으로 이어진 후 2 패스워드 창에 아이디가 적힘
	// 3 모달창 종료
	$('#pwSearch_btn').click(function(){		
		
		/* var idV = $('#id_value').val(); // 오류 뜸 */
		console.log(idV);
		/* console.log(storeV); */
		
		// 1. 패스워드 찾기 창으로 이어지고
		$('#search_2').prop("checked", true);
		
		// 메서드 호출
		search_check(2);
		
		// 2.아이디 & 매장 자동 저장
		$('#email').attr("value", idV);
		/* $('#store_id2').val(storeV).prop("selected", true); */
		
		// 마지막으로 모달창 종료
		$('#background_modal').hide();
	});
	
	
	
</script>
</html>