<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" %>

<div id="footer">
	<!--<div class="cs_wrap">
	    <div class="box1">
	        <div class="cs_info">
	            <div class="in">
	                <p class="logo">Pets &amp; 美</p>
	                <p class="tit">Customer Center</p>
	                <p class="tel"><i class="xi xi-call"></i> <i><?=$site_tel?></i></p>
	                <p class="tt"><?=$site_time?><br />
	                <?=$site_time2?><br />
	                <?=$site_time3?>
	                </p>
	            </div>
	        </div>
	        <div class="cs_gnb">
	            ﻿<? include "../inc/lnb.php" ?>  
	        </div>
	        <div class="cs_link">
	            <ul class="quick_list">
	                <li><a href="<?=$link_customer_review?>"><i class="xi xi-comment"></i><i class="tt">구매후기</i></a></li>
	                <li><a href="<?=$link_mypage_orderlist?>"><i class="xi xi-truck"></i><i class="tt">배송조회</i></a></li>
	                <li><a href="<?=$link_customer_faq?>"><i class="xi xi-forum"></i><i class="tt">FAQ</i></a></li>
	                <li><a href="<?=$link_customer_event?>"><i class="xi xi-gift-o"></i><i class="tt">이벤트</i></a></li>
	            </ul>
	            <? include "../inc/foot_sns.php" ?>            
	        </div>
	        <p class="cl"></p>
	    </div>
	</div>-->
    
    <div class="info_wrap">
    	<div class="box1">
            <ul class="info di_wrap">
                <li>요맛조맛</li>
                <li>서울특별시 신천 신촌 신창</li>
                <li>대표자 : 모팀장</li>
                <li>사업자등록번호 : 123-12-12345</li>
                <br />
                <li>대표전화 : 000-0000-0000</li>
                <!--<li>팩스번호 : <?=$site_fax?></li> -->
                <li>이메일 : abcd@abcd.abc</li>
                <li>개인정보관리책임자 : 공씨</li>
                <li class="copyright">COPYRIGHT(C) 요맛조맛. All RIGHTS RESERVED.</li>
            </ul>
        </div>
    </div>
</div>
<!--footer end -->

<script type="text/javascript">
//<![CDATA[
$(function(){
	var t = "<%=dp1%>";
	var b = "<%=dp2%>";
	
	$("#header .gnb_wrap .gnb .m_"+t+" .dp1").addClass("on");
	$(".lnb_wrap .gnb .m_"+t+" .dp2").addClass("on");
	$(".lnb_wrap .gnb .m_"+t+" .dp2 .sm_"+b).addClass("on");
});

$(document).ready(function(){
	var scrollst = $(".scrollst")
	scrollst.mCustomScrollbar({
		theme:"minimal-dark"
	});
})
/*$(document).ready(function(){
	var scrollst = $(".scrollst")
	scrollst.mCustomScrollbar({
		theme:"minimal-dark"
	});
})

$(window).scroll(function(){
	var scrollY = $(window).scrollTop()
	if(scrollY > 0){
		$("body").addClass("scroll")
	}else{
		$("body").removeClass("scroll")
	}
})*/



//]]>
</script>
</body>
</html>

