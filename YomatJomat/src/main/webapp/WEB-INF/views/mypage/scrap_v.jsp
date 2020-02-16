<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" import="com.yj.domain.BoardListResult"%>

<%
	BoardListResult blr = (BoardListResult)request.getAttribute("listResult");
%>

<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "4";
String dp2 = "2";
%>
<%@ include file="../inc/top2.jsp" %>
<div class="doc4 doc5">
<div class="box1">	
	<div class="mypage_wrap mypage_scrap_v">
		<p class="tit"><i class="xi-folder-check-o xi"></i>폴더명</p>
		<div class="folder_new_btn">
			<a onclick="doAllSelect()" id="allSelectToggle">전체선택</a>
			<a href="">폴더이동</a>
			<a href="">선택삭제</a>
		</div>	
		<ul class="rp_list_btm"><!-- 12개씩 -->
			<li>
				<div class="rp_list_in">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li onclick="location.href='/recipe/content/'">
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>		
						</li>
					</ul>
					<span class="folder_rdo_btn"><input type="checkbox" class=""/></span>
				</div>   
			</li>
			<li>
				<div class="rp_list_in">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li onclick="location.href='/recipe/content/'">
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>		
						</li>
					</ul>
					<span class="folder_rdo_btn"><input type="checkbox" class=""/></span>
				</div>   
			</li>
			<li>
				<div class="rp_list_in">
					<p class="rp_list_in1 img_resize_prod"><img src="/images/rp_img01.jpg"></p>
					<ul class="rp_list_in1 rp_list_in2">
						<li onclick="location.href='/recipe/content/'">
							<p class="t1">간단한 밑반찬으로 술안주로도 좋은 간식</p>
							<p class="t2">비엔나 소세지강정 간단하게 만들어 먹기 좋아요 ♪</p>
							<p class="nick">뽀라뽀님</p>		
						</li>
					</ul>
					<span class="folder_rdo_btn"><input type="checkbox" class=""/></span>
				</div>   
			</li>
		</ul>	
	</div>	
</div>
<script type="text/javascript">
var curAllSel = false;
function doAllSelect(){
    if(curAllSel){
        txts = '전체선택';
        curAllSel = false;
    }else{
        txts = '전체해제';
        curAllSel = true;
    }
    $("#allSelectToggle").html(txts);
  //  $("#allSelectToggle").toggleClass("active");
    $("#allSelectToggle").each(function(){
        $("input[type=checkbox]").prop("checked",curAllSel);
    });
}

</script>
</div>
<%@ include file="../inc/footer.jsp" %>