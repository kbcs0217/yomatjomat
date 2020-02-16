<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" %>

<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "4";
String dp2 = "1";
String dp3 = "1";
%>
<%@ include file="../inc/top2.jsp" %>
<div class="doc4 doc5">
<div class="box1">	
	<div class="mypage_wrap">
		<%@ include file="../mypage/list_tab1.jsp" %>  
		<div class="rp_list_top mp_list_top">
			<ul class="rp_list_t rp_list_tr">
				<li><p class="on">공개중</p></li>
				<li><p>저장중</p></li>
			</ul>
		</div>  
		<ul class="rp_list_btm">
			<!-- 12개씩 노출 -->
			<!-- 뷰페이지 -->
			<li>
				<div class="rp_list_in" onclick="location.href='/recipe/write/'">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
					</ul>
				</div>   
			</li>
			<li>
				<div class="rp_list_in" onclick="location.href='/recipe/content/'">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
					</ul>
				</div>   
			</li>
			<li>
				<div class="rp_list_in" onclick="location.href='/recipe/content/'">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
					</ul>
				</div>   
			</li>
			<li>
				<div class="rp_list_in" onclick="location.href='/recipe/content/'">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
					</ul>
				</div>   
			</li>
			<li>
				<div class="rp_list_in" onclick="location.href='/recipe/content/'">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
					</ul>
				</div>   
			</li>
			<li>
				<div class="rp_list_in" onclick="location.href='/recipe/content/'">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
					</ul>
				</div>   
			</li>
		</ul>
		<div class="board_paging">
			<button class="icon" onclick="javascript:location.href='#'">&#x000AB;</button>
			<button class="icon" onclick="javascript:location.href='#'">&#x02039;</button>
			<button class="on">1</button>
			<button onclick="javascript:location.href='#'">2</button>
			<button onclick="javascript:location.href='#'">3</button>
			<button onclick="javascript:location.href='#'">4</button>
			<button onclick="javascript:location.href='#'">5</button>
			<button onclick="javascript:location.href='#'">6</button>
			<button onclick="javascript:location.href='#'">7</button>
			<button onclick="javascript:location.href='#'">8</button>
			<button onclick="javascript:location.href='#'">9</button>
			<button onclick="javascript:location.href='#'">10</button>
			<button class="icon" onclick="javascript:location.href='#'">&#x0203A;</button>
			<button class="icon" onclick="javascript:location.href='#'">&#x000BB;</button>
		</div>
	</div>		
</div>
<script type="text/javascript">
$(".rp_list_btm .rp_list_in .rp_list_in1").equalizeHeights();
</script>
</div>
<%@ include file="../mypage/list_js.jsp" %> 
<%@ include file="../inc/footer.jsp" %>