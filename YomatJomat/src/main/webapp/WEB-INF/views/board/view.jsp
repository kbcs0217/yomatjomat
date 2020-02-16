<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="false" %>


<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "3";
String dp2 = "1"; 
%>
<%@ include file="../inc/top2.jsp" %> 
<div class="doc doc4"> 
<div class="box2">
	<div class="board_top board_top2">
		<p class="board_top_r">
			<a onclick="history.back();">목록으로</a>
		</p> 
	</div>
	<ul class="board_wrap">
		<li> 
			<div class="board_wrap_in"> 
				<p class="board_wrap_l">
					<img src="/images/no_man.jpg">
				</p>
				<dl class="board_wrap_r">
					<dd class="board_wrap_r1">
						<a class="nick_wrap">Red Moon 붉은달 <span>18시간 46분 전</span></a>
						<p class="nick_r_wrap">
							<span><i class="xi xi-heart-o"></i>10</span>
							<span><i class="xi xi-speech-o"></i>21</span>
						</p>
					</dd> 
					<dd class="board_wrap_r2">
						<!-- 노출 텍스트 수 자르기 -->
						<p class="txt">내용이 길게 들어갑니다.내용이 길게 들어갑니다.내용이 길게 들어갑니다.내용이 길게 들어갑니다.내용이 길게 들어갑니다.내용이 길게 들어갑니다.내용이 길게 들어갑니다.내용이 길게 들어갑니다.내용이 길게 들어갑니다.내용이 길게 들어갑니다.내용이 길게 들어갑니다.내용이 길게 들어갑니다.내용이 길게 들어갑니다.
						ㄱ내용이 길게 들어갑니다.내용이 길게 들어갑니다.내용이 길게 들어갑니다.</p>
						<p class="main_img">
							<span class="img_resize_step"><img src="/images/talk_eximg.jpg"></span>
							<span class="img_resize_step"><img src="/images/talk_eximg.jpg"></span>
							<span class="img_resize_step"><img src="/images/talk_eximg.jpg"></span>
						</p>
					</dd>
				</dl>
			</div>
			<div class="Ingre_wrap rp_rep_wrap b_rep_wrap">
				<p class="rep_tit">댓글<span>23</span></p>  
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
						<a class="good_btn" href="">
							<i class="xi-heart xi"></i><span>좋아요</span>
						</a>
					</div>
					<div class="txt_box">
						<span class="txt_box1"><textarea class="text_area" placeholder="요리후기와 댓글을 남겨주세요."></textarea></span>
						<span class="txt_box2"><button class="" type="button" onclick="">등록</button></span>
					</div>
				</div>
			</div>
		</li> 
	</ul>	
</div>
</div>
<script type="text/javascript">

</script> 

<%@ include file="../inc/footer.jsp" %>
 