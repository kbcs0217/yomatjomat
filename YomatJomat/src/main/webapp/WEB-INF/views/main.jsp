<%@ page language="java" contentType="text/html; charset=utf-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="./inc/top.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<div id="contents" class="header_mt">

<div class="visual_wrap main_visual">

		<div class="visual">
			<ul class="slides">
				<li class="img" style="background-image:url(/images/main_slide01.jpg);">
				<div class="box1">
					<div class="tit_wrap">
						<p class="pro_tit"><span class="pro_tit_s">MORE VEAUTY</span>FROM YOUR <span class="pro_tit_c">EYES</span></p>
						<p class="pro_txt">언제부턴가 당신을 <span>아름다운 여자</span>로 인식합니다. <br />
						아름다움은 <span>당신의 눈</span>으로부터 시작됩니다.</p>
						<a class="pro_btn" href="<?= $link_5 ?>">READ MORE +</a>
					</div>
				</div>
	

				</li>
				<li class="img" style="background-image:url(/images/main_slide01.jpg);">
				<div class="box1">
					<div class="tit_wrap">
						<p class="pro_tit"><span class="pro_tit_s">MORE VEAUTY</span>FROM YOUR <span class="pro_tit_c">EYES</span></p>
						<p class="pro_txt">언제부턴가 당신을 <span>아름다운 여자</span>로 인식합니다. <br />
						아름다움은 <span>당신의 눈</span>으로부터 시작됩니다.</p>
						<a class="pro_btn" href="">READ MORE +</a>
					</div>
				</div>
				</li>
				
			</ul>
			<script type="text/javascript">
			$(window).load(function(){
			$('.visual_wrap .visual').flexslider({
			animation: "fade",
			directionNav: false,
			controlNav: true,
			pausePlay: false,
			slideshowSpeed: 4000,
			animationSpeed: 2300,
			easing : "easeInCubic"
			});
			})
			
			function Logout() {

    Kakao.Auth.logout();

    location.href = "/";

}
			</script>
		</div>
	</div>

</div>


<jsp:include page="./inc/footer2.jsp" />