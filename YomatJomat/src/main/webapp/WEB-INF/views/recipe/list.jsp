<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="false" %>


<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "1";
String dp2 = "1"; 
%>
<%@ include file="../inc/top2.jsp" %> 
<div class="doc doc2">
<div class="box1">
	<div class="cate_s_wrap">
		<ul class="cate_search">
			<li>
				<div class="cate_search_in">
					<select class="search_select re_select">
			            <option value="">종류별 선택</option>
			            <option>1</option>
			            <option>2</option>
			        </select>
				</div>
			</li>  
			<li>
				<div class="cate_search_in">
					<select class="search_select re_select">
			            <option value="">상황별 선택</option>
			            <option>1</option>
			            <option>2</option>
			        </select>
				</div>
			</li>
			<li>
				<div class="cate_search_in">
					<select class="search_select re_select">
			            <option value="">상황별 선택</option>
			            <option>1</option>
			            <option>2</option>
			        </select>
				</div>
			</li>
			<li>
				<div class="cate_search_in">
					<select class="search_select re_select">
			            <option value="">상황별 선택</option>
			            <option>1</option>
			            <option>2</option>
			        </select>
				</div>
			</li>
		</ul>
		<p class="cate_key">
			<span onclick="">#집반찬</span><span>#혼술</span><span>#맥주안주</span>
			<span>#집반찬</span><span>#혼술</span><span>#맥주안주</span>
		</p>
	</div>
</div>		 
<div class="rp_list_wrap">
	<div class="box1">
		<div class="rp_list_top">
			<p class="rp_list_t rp_list_tl">총 <span>1,000</span>개의 맛한 레시피가 있습니다.</p>
			<ul class="rp_list_t rp_list_tr">
				<li><p class="on">최신순</p></li>
				<li><p>추천순</p></li>
				<li><p>댓글순</p></li>
			</ul>
		</div>  
		<ul class="rp_list_btm">
			<li>
				<div class="rp_list_in" onclick="location.href='/recipe/content/'">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
						<li class="rp_list_in2_btm">
							<p class="tt"><i class="xi xi-time-o"></i>30분</p>
							<p class="tt"><i class="xi xi-heart"></i>103명</p>
							<p class="tt"><i class="xi xi-share-alt-o"></i>공유</p>
						</li>
					</ul>
				</div>   
			</li>
			<li>
				<div class="rp_list_in">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
						<li class="rp_list_in2_btm">
							<p class="tt"><i class="xi xi-time-o"></i>30분</p>
							<p class="tt"><i class="xi xi-heart"></i>103명</p>
							<p class="tt"><i class="xi xi-share-alt-o"></i>공유</p>
						</li>
					</ul>
				</div>   
			</li>
			<li>
				<div class="rp_list_in">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
						<li class="rp_list_in2_btm">
							<p class="tt"><i class="xi xi-time-o"></i>30분</p>
							<p class="tt"><i class="xi xi-heart"></i>103명</p>
							<p class="tt"><i class="xi xi-share-alt-o"></i>공유</p>
						</li>
					</ul>
				</div>   
			</li>   
			<li>
				<div class="rp_list_in">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
						<li class="rp_list_in2_btm">
							<p class="tt"><i class="xi xi-time-o"></i>30분</p>
							<p class="tt"><i class="xi xi-heart"></i>103명</p>
							<p class="tt"><i class="xi xi-share-alt-o"></i>공유</p>
						</li>
					</ul>
				</div>   
			</li>  
			<li>  
				<div class="rp_list_in">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
						<li class="rp_list_in2_btm">
							<p class="tt"><i class="xi xi-time-o"></i>30분</p>
							<p class="tt"><i class="xi xi-heart"></i>103명</p>
							<p class="tt"><i class="xi xi-share-alt-o"></i>공유</p>
						</li>
					</ul>
				</div>   
			</li>
			<li>
				<div class="rp_list_in" >
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
						<li class="rp_list_in2_btm">
							<p class="tt"><i class="xi xi-time-o"></i>30분</p>
							<p class="tt"><i class="xi xi-heart"></i>103명</p>
							<p class="tt"><i class="xi xi-share-alt-o"></i>공유</p>
						</li>
					</ul>
				</div>   
			</li>
			<li>
				<div class="rp_list_in">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
						<li class="rp_list_in2_btm">
							<p class="tt"><i class="xi xi-time-o"></i>30분</p>
							<p class="tt"><i class="xi xi-heart"></i>103명</p>
							<p class="tt"><i class="xi xi-share-alt-o"></i>공유</p>
						</li>
					</ul>
				</div>   
			</li>
			<li>
				<div class="rp_list_in">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
						<li class="rp_list_in2_btm">
							<p class="tt"><i class="xi xi-time-o"></i>30분</p>
							<p class="tt"><i class="xi xi-heart"></i>103명</p>
							<p class="tt"><i class="xi xi-share-alt-o"></i>공유</p>
						</li>
					</ul>
				</div>   
			</li>   
			<li>
				<div class="rp_list_in">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
						<li class="rp_list_in2_btm">
							<p class="tt"><i class="xi xi-time-o"></i>30분</p>
							<p class="tt"><i class="xi xi-heart"></i>103명</p>
							<p class="tt"><i class="xi xi-share-alt-o"></i>공유</p>
						</li>
					</ul>
				</div>   
			</li>  
			<li>
				<div class="rp_list_in">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li>
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>
						</li>
						<li class="rp_list_in2_btm">
							<p class="tt"><i class="xi xi-time-o"></i>30분</p>
							<p class="tt"><i class="xi xi-heart"></i>103명</p>
							<p class="tt"><i class="xi xi-share-alt-o"></i>공유</p>
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
</div>
<script type="text/javascript">
$(window).load(function(){
	$(".rp_list_btm .rp_list_in .rp_list_in1").equalizeHeights();
})
var list_st = $('.rp_list_wrap .rp_list_tr li');
list_st.click(function(){
	$(this).find('p').addClass("on");
	list_st.not($(this)).find('p').removeClass("on");
});
imgResize_prod();

</script>

<%@ include file="../inc/footer.jsp" %>
