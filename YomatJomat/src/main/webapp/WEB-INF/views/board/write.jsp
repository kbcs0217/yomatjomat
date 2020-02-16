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

	<ul class="board_wrap board_w_wrap">
		<li> 
			<div class="board_wrap_in"> 
				<p class="b_info_t">소소한 일상 등 여러 이야기를 편하게 올려요.</p>
				<textarea class="text_area" placeholder="내용을 입력해주세요." id="summernote" value=""></textarea>
			</div>
		</li>
		<li> 
			<div class="board_wrap_in"> 
				<p class="rp_w_t_ps"><i class="xi xi-info-o"></i> +버튼을 눌러 이미지를 첨부할 수 있습니다. (파일갯수: 최대 5개 / 파일크기: 최대 5.0MB)</p>
				<ul class="b_img_wrap">
					<li>
						<span class="img_resize_repl"><img src="/images/rp_rep_noimg.jpg"></span>
					</li>
					<li>
						<span class="img_resize_repl"><img src="/images/rp_rep_noimg.jpg"></span>
					</li>
					<li>
						<span class="img_resize_repl"><img src="/images/rp_rep_noimg.jpg"></span>
					</li>
					<li>
						<span class="img_resize_repl"><img src="/images/rp_rep_noimg.jpg"></span>
					</li>
					<li>
						<span class="img_resize_repl"><img src="/images/rp_rep_noimg.jpg"></span>
					</li>
				</ul>
			</div>
		</li>
	</ul>
	<div class="rp_w_btn">
		<a class="btn1">등록</a>
		<a class="btn3" onclick="history.back();">취소</a>
	</div>
</div>
<script type="text/javascript" src="/js/summernote-ko-KR.js"></script>
<script type="text/javascript">
imgResize_repl();
$(document).ready(function() {
	  $('#summernote').summernote('insertText', "내용을 입력해주세요.");
	});
</script>
</div>
<%@ include file="../inc/footer.jsp" %>
