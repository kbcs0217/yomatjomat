<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="false" %>


<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "1";
String dp2 = "1"; 
%>
<%@ include file="../inc/top2.jsp" %> 
<div class="doc doc3">
	<div class="rp_v_wrap">
		<div class="box1">
			<div class="rp_v_top rp_v_mimg">
				<p class="rp_v_topin img_resize_prod"><img src="/images/rp_view01.jpg"></p>
			</div>
			<div class="rp_v_top rp_v_mtxt">
				<div class="rp_v_topin">
					<div class="rp_v_prof_wrap">
						<dl class="rp_v_prof" onclick="location.href=''">
							<dt><img src="/images/no_man.jpg"></dt> 
							<dd>뽀라뽀</dd>
						</dl>
						<div class="rp_v_prof2">
							<a href="#" class=""><i class="xi xi-heart"></i><i class="tt">좋아요</i></a>
							<a href="#" class=""><i class="xi xi-flag-o"></i><i class="tt">스크랩</i></a>
							<a href="#" class=""><i class="xi xi-thumbs-down"></i><i class="tt">신고</i></a>
						</div>
					</div>
					<p class="tit">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪ </p>
					<p class="txt">간단한 밑반찬으로 술안주로도 좋은 간식 짜쟌 ~~특별한 날 만든 연어 요리를 소개합니다 두가지 소스가 들어간 달걀안에 다른 식감의 재료를 넣어서 다섯가지 맛을 느낄수 있어요 어르신들과 함께 맛있게 먹었어요</p>
					<!-- txt부분 byte나 글자수 한계를 둬야할 것 같음.. 3줄 안넘게 -->
					<ul class="rp_v_info">
						<li>
							<div class="rp_v_info_in">
								<p class="ico"><img src="/images/rp_ico01.jpg"></p>
								<p class="tt">2인분</p>
							</div>
						</li>
						<li>	
							<div class="rp_v_info_in">
								<p class="ico"><img src="/images/rp_ico02.jpg"></p>
								<p class="tt">30분이내</p>
							</div>
						</li>
						<li>	
							<div class="rp_v_info_in">
								<p class="ico"><img src="/images/rp_ico03.jpg"></p>
								<p class="tt">초급</p>
							</div>
						</li>
					</ul>
				</div>	
			</div>
		</div>
	</div>
	<div class="box1">
		<div class="Ingre_wrap">
			<p class="Ingre_tit">재료 <span>Ingredients</span></p>
			<ul class="Ingre_list">
				<li>
					<dl class="Ingre_list_in">
						<dt><span class="tit">주재료</span></dt>
						<dd class="t_list">
							<p class="t1">마늘쫑</p>
							<p class="t2">1봉지(1줌)</p>
						</dd>
						<dd class="t_list">
							<p class="t1">마늘쫑</p>
							<p class="t2">1봉지(1줌)</p>
						</dd>
					</dl>
				</li>
				<li>
					<dl class="Ingre_list_in">
						<dt><span class="tit">양념재료</span></dt> 
						<dd class="t_list">
							<p class="t1">마늘쫑</p>
							<p class="t2">1봉지(1줌)</p>
						</dd>
						<dd class="t_list">
							<p class="t1">마늘쫑</p>
							<p class="t2">1봉지(1줌)</p>
						</dd>
						<dd class="t_list">
							<p class="t1">마늘쫑</p>
							<p class="t2">1봉지(1줌)</p>
						</dd>
					</dl>
				</li>
			</ul>
		</div> 
		<div class="Ingre_wrap rp_step_wrap">
			<p class="Ingre_tit">조리순서 <span>Steps</span></p> 
			<ul class="rp_step_list">
				<li>
					<dl class="rp_step_in">
						<dd class="t_wrap">
							<div class="rp_step_eh">
								<p class="step">1</p>
								<p class="tt">아삭아삭 식감 좋고 반찬으로 좋은 마늘쫑무침 만들기 ♬♪</p>
							</div>
						</dd>
						<dd class="i_wrap">
							<div class="rp_step_eh">
								<span class="img_resize_step"><img src="/images/rp_step01.jpg"></span>
							</div>
						</dd>
					</dl>
				</li> 
				<li>
					<dl class="rp_step_in">
						<dd class="t_wrap">
							<div class="rp_step_eh">
								<p class="step">1</p>
								<p class="tt">마늘쫑무침 양념
【 고춧가루 1 큰 술, 다진 마늘 0.5 큰 술, 고추장 2 큰 술, 진간장 2 큰 술, 매실액 2 큰 술, 올리고당 0.5 큰 술, 설탕 0.5 큰 술 】</p>
							</div>
						</dd>
						<dd class="i_wrap">
							<div class="rp_step_eh">
								<span class="img_resize_step"><img src="/images/rp_step01.jpg"></span>
							</div>
						</dd>
					</dl>
				</li> 
			</ul>
			<ul class="rp_step_date">
				<li>
					<p class="tt t1">
						<span class="">등록일 :</span>
						<span class="val">2020-01-01</span>
					</p>
					<p class="tt t1">
						<span class="">수정일 :</span>
						<span class="val">2020-01-28</span>
					</p>
				</li>
				<li>
					<p class="tt t2">
						<span class=""><i class="xi xi-eye-o"></i>VIEW :</span>
						<span class="val">210</span>
					</p>
				</li>
			</ul>
		</div>	
		<!-- 레시피작성자 정보 + 태그 넣기 -->
		<div class="Ingre_wrap rp_rep_wrap">
			<p class="rep_tit">요리후기 <span>23</span></p> 
			<ul class="rp_rep_list">
				<li>
					<div class="rp_rep_in">
						<p class="rp_rep_l"><span><img src="/images/no_man.jpg"></span></p>
						<ul class="rp_rep_r">
							<li class="rp_rep_line">
								<div class="rp_rep_r_in1">
									<p class="prof">
										<span class="nick">모Con1</span>
										<span class="date">2020-01-27</span>
									</p>
									<p class="txt">환상의 맛이에요 다 먹어서 사진을 못 찍었어요ㅜ 죄송해요ㅜ </p>
								</div>
							</li>
							<li class="">
								<div class="rp_rep_r_in2">
									<p class="prof">
										<span class="nick">요리사</span>
										<span class="date">2020-01-28</span>
									</p>
									<p class="txt">오 맛있게 드셨다니 감사합니다 ^^ </p>
								</div>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="rp_rep_in">
						<p class="rp_rep_l"><span><img src="/images/no_man.jpg"></span></p>
						<ul class="rp_rep_r">
							<li class="rp_rep_line">
								<div class="rp_rep_r_in">
									<p class="prof">
										<span class="nick">모Con1</span>
										<span class="date">2020-01-27</span>
									</p>
									<p class="txt">환상의 맛이에요 다 먹어서 사진을 못 찍었어요ㅜ 죄송해요ㅜ </p>
								</div>
							</li>
							<li class="">
								<div class="rp_rep_r_in2">
									<p class="prof">
										<span class="nick">요리사</span>
										<span class="date">2020-01-28</span>
									</p>
									<p class="txt">오 맛있게 드셨다니 감사합니다 ^^ </p>
								</div>
							</li>
						</ul>
					</div>
				</li>
			</ul>			
			<div class="rp_rep_write">
				<div class="img_btn">
					<div class="img_resize_repl"><img src="/images/rp_rep_noimg.jpg"></div>
				</div>
				<div class="txt_box">
					<span class="txt_box1"><textarea class="text_area" placeholder="요리후기와 댓글을 남겨주세요."></textarea></span>
					<span class="txt_box2"><button class="" type="button" onclick="">등록</button></span>
				</div>
			</div>
		</div>
	</div>	 
	
	
</div>
<script type="text/javascript">
imgResize_prod();
imgResize_step();
imgResize_repl();
$(window).load(function(){
	$(".Ingre_wrap .Ingre_list .Ingre_list_in").equalizeHeights();
	$(".rp_step_wrap .rp_step_list .rp_step_in .rp_step_eh").equalizeHeights();
})

</script>

<%@ include file="../inc/footer.jsp" %>
