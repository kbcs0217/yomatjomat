<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" %>
 

<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "4";
String dp2 = "4";
%>
<%@ include file="../inc/top2.jsp" %>
<div class="mem_wrap join2_wrap">
	<div class="join_wrap">
		<div class="join_con">
			<div class="agree_wrap join2"> 
				<div class="agree"> 
					<div class="join2_box">
						<h1 class="mem_tit fl">이메일</h1>
						<input name="" type="text" class="inp" placeholder="test@test.com" readonly>
					</div>
					<div class="join2_box">
						<h1 class="mem_tit fl">휴대폰번호</h1>
						<input name="" type="text" class="inp" placeholder="01012341234" readonly>
					</div>
					<div class="join2_box mb5">
						<h1 class="mem_tit fl">비밀번호 변경</h1>
						<input name="" type="password" class="inp" placeholder="현재 비밀번호">
					</div>
					<div class="join2_box mb5">
						<input name="" type="password" class="inp" placeholder="새로운 비밀번호">
					</div>
					<div class="join2_box">
						<input name="" type="password" class="inp" placeholder="새로운 비밀번호 확인">
					</div>
					<div class="join2_box">
						<h1 class="mem_tit fl">닉네임 변경</h1>
						<input name="" type="text" class="inp" placeholder="비트남">
					</div>
					<p class="modify_btn">
						<a class="" onclick="layerOpen('/mypage/pop_mdfy','550','450')">회원탈퇴</a>
					</p>
				</div>	 
			</div>
			<div class="agree_btn_wrap">
				<input type="button" class="btn" value="정보 변경하기" onclick="location.href='#'" />
			</div>
		</div>
	</div>
</div>	
<script type="text/javascript">

function layerOpen(url,popW,popH){
	var bg = '<div class="layer_bg" onclick="layerClose()"></div>'
	var frame ='<div class="layer_frame"><iframe class="ifr" src="'+url+'" frameborder="0" scrolling="no"></iframe><a class="close" href="javascript:layerClose()">&Cross;</a></div>'
	var wrap = '<div class="layer_wrap">'+bg+frame+'</div>'
	
	$("body").append(wrap);
	
	$(".layer_wrap").each(function(){
		var idx = $(this).index()-2
		$(this).attr("idx",idx)
	})
	//$(".layer_wrap2").not("[idx=1]").find(".layer_bg2").css("opacity",0)
	
	$("html").css("overflow-y","hidden");
	$(".layer_frame").animate({opacity:1},500)
	$(".layer_bg").fadeIn(800);
	sizing()
	$(window).resize(function(){
	sizing()
	})
	function sizing(){
		var winW = $(window).width()
		var winH = $(window).height()
		if(winW > popW){
			var W = popW
			var H = popH
			var mgL = "-"+popW/2+"px"
			var mgT = "-"+popH/2+"px"
			var L = "50%"
			var T = "50%"
		}else{
			var W = winW*.9
			var H = winH*.9
			var mgL = "0"
			var mgT = "0"
			var L = "5%"
			var T = "5%"
		}
		$(".layer_wrap:last-child").find(".layer_frame").css({width:W, height:H, marginLeft:mgL, marginTop:mgT, left:L, top:T})
	}
};
function layerClose(){
	$(".layer_wrap:last-child").find(".layer_frame").fadeOut(500)
	$(".layer_wrap:last-child").find(".layer_bg").fadeOut(500,function(){
		$(".layer_wrap:last-child").remove()
		$("html").css("overflow-y","scroll");
	})
};
function popResize(){
  var bodyH = $("body").height()
  var H = $(".pop_wrap").height()
  if(H < bodyH){
	$(".layer_frame", parent.document).css({height:H+30})
  }
}

</script>	
<style>
</style>
<%@ include file="../inc/footer.jsp" %>