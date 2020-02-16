<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=1200" />
<title>요맛조맛</title>

<meta property="og:type" content="website" />
<meta property="og:site_name" content="요맛조맛" />
<meta property="og:title" content="요맛조맛" />
<meta property="og:description" content="" />
<meta property="og:image" content="../images/inc/logo.png" />
<meta property="og:url" content="" />
<meta name="keyword" content="" />


<link rel="stylesheet" href="/css/xeicon.min.css">
<link href="/css/font.css" rel="stylesheet" type="text/css" />
<link href="/css/inc.css?after" rel="stylesheet" type="text/css" />
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/board.css" rel="stylesheet" type="text/css" />
<link href="/css/owl.carousel.css" rel="stylesheet" type="text/css" />
<link href="/css/slick.css" rel="stylesheet" type="text/css" />
<link href="/css/summernote-lite.css" rel="stylesheet" type="text/css" /> 

<script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/jquery.slimscroll.js"></script>
<!-- <script type="text/javascript" src="/js/jquery.fullPage.js"></script>-->
<script type="text/javascript" src="/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="/js/inc.js"></script>
<script type="text/javascript" src="/js/trim.js"></script>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/jquery.word-break-keep-all.js"></script>
<script type="text/javascript" src="/js/owl.carousel.js"></script>
<script type="text/javascript" src="/js/owl.carousel.js"></script>
<script type="text/javascript" src="/js/summernote-lite.js"></script>

<!-- <link rel="shortcut icon" href="../images/inc/favicon.ico" /> -->

<script type="text/javascript" src="/js/jquery.mCustomScrollbar.js"></script>
<link href="/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" /> 


</head>	
<body>
	<div id="header">
		<div class="top_wrap">
			<div class="box1">
				<h1 class="logo left">													    
	<c:if test="${not empty sessionScope.userSession and sessionId==null && kname==null}">
		<h3>안녕하세요. ${userSession.email}님!</h3>
		
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout"><i class="fa fa-unlock-alt" aria-hidden="true"></i>로그아웃</a></li>
		</c:if>
		<c:if test="${knickname!=null and empty sessionScope.userSession && sessionId==null}">
        <h1>카카오로그인 성공</h1>
        <h3>'${knickname}'님 환영합니다!!</h3>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout"><i class="fa fa-unlock-alt" aria-hidden="true"></i>로그아웃</a></li>
        </c:if>
        <c:if test="${sessionId!=null and empty sessionScope.userSession && kname==null}">
		<h2>네이버 아이디 로그인 성공!!</h2>
		<h3>'${sessionId}'님 환영합니다!</h3>
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout"><i class="fa fa-unlock-alt" aria-hidden="true"></i>네이버로그아웃</a></li>
		</c:if>
    <a href=".." class="va_wrap"><span class="va"></span><img src="/images/m_logo.png" alt="로고" /></a></h1>
 
				<div class="search center va_wrap">
					<span class="va"></span>
					<div class="va_tt">
						<input id="tK" name="top_keyword" type="text" class="inp" placeholder="검색어를 입력해 주세요" tabindex="11" msg="검색어를" value="" >
						<button type="submit" class="btn"><i class="xi xi-search"></i></button>

					</div>
					
				</div>
				

				<div class="menu_st right">
				
				
					<ul class="menu di_wrap">
					<c:if test="${knickname==null and empty sessionScope.userSession && sessionId==null}">
					
						<li><a href="#" alt="로그인" class="cl1" id="aa"><i class="xi xi-user"></i></a></li>
							
						</c:if>
						<c:if test="${not empty sessionScope.userSession and sessionId==null && kname==null}">
							<li><a href="../../mypage/list" alt="마이페이지" class="cl1"><i class="xi xi-user"></i></a></li>
						</c:if>
						
						<c:if test="${knickname!=null and empty sessionScope.userSession && sessionId==null}">
						<li><a href="../../member/join1" alt="마이페이지" class="cl1"><i class="xi xi-user"></i></a></li>
						
						</c:if>
						<c:if test="${sessionId!=null and empty sessionScope.userSession && kname==null}">
						<li><a href="../../member/join1" alt="마이페이지" class="cl1"><i class="xi xi-user"></i></a></li>
						</c:if>
						
						<li><a href="" alt="알림" class="cl2"><i class="xi xi-bell"></i></a></li>
						<c:if test="${knickname==null and empty sessionScope.userSession && sessionId==null}">
							<li><a href="../../member/login" alt="로그인" class="cl3"><i class="xi xi-border-color"></i></a></li>
						</c:if>
						<c:if test="${knickname!=null and empty sessionScope.userSession && sessionId==null}">
						<li><a href="../../recipe/write" alt="레시피등록" class="cl3"><i class="xi xi-border-color"></i></a></li>
						</c:if>
						<c:if test="${not empty sessionScope.userSession and sessionId==null && kname==null}">
						<li><a href="../../recipe/write" alt="레시피등록" class="cl3"><i class="xi xi-border-color"></i></a></li>
						</c:if>
						<c:if test="${sessionId!=null and empty sessionScope.userSession && kname==null}">
						<li><a href="../../recipe/write" alt="레시피등록" class="cl3"><i class="xi xi-border-color"></i></a></li>
						</c:if>
						<li><a href="../../notice/list" alt="공지문의" class="cl4">?</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="gnb_wrap">
			<div class="box1">
				<div class="gnb">
					<ul class="menu">
						<li class="m_1">
							<a href="../../recipe/list" class="dp1">레시피<span class="icon"></span></a>
							<ul class="dp2">
					            <li class="sm_1"><a href="../recipe/list">추천레시피<span class="icon"></span></a></li>
					            <li class="sm_2"><a href="">최신레시피<span class="icon"></span></a></li>
					            <li class="sm_3"><a href="">방송레시피<span class="icon"></span></a></li>
					        </ul> 
						</li>
						<li class="m_2">
							<a href="../../ranking/list" class="dp1">랭킹<span class="icon"></span></a>
							<ul class="dp2">
					            <li class="sm_1"><a href="../ranking/list">인기레시피<span class="icon"></span></a></li>
					            <li class="sm_2"><a href="">열혈요리사<span class="icon"></span></a></li>
					        </ul>  
						</li>
						<li class="m_3">
							<a href="../../board/list" class="dp1">요리톡<span class="icon"></span></a>
						</li>
						<li class="m_4">
						<c:if test="${not empty sessionScope.userSession and sessionId==null && kname==null}">
							<a href="../../mypage/list" class="dp1">마이페이지<span class="icon"></span></a>
							<ul class="dp2">
					            <li class="sm_1"><a href="../../mypage/list" class="">마이홈<span class="icon"></span></a></li>
					            <li class="sm_2"><a href="../../mypage/scrap" class="">스크랩레시피<span class="icon"></span></a></li>
					            <li class="sm_3"><a href="../../mypage/following" class="">구독요리사<span class="icon"></span></a></li>
					            
					            <li class="sm_4"><a href="../../member/infocheck" class="">정보수정<span class="icon"></span></a></li>
					            
					        </ul> 
					        </c:if>  
					        <c:if test="${knickname==null and empty sessionScope.userSession && sessionId==null}">
					        <a href="../../member/login" class="dp1">마이페이지<span class="icon"></span></a>
							<ul class="dp2">
					            <li class="sm_1"><a href="../../member/login" class="">마이홈<span class="icon"></span></a></li>
					            <li class="sm_2"><a href="../../member/login" class="">스크랩레시피<span class="icon"></span></a></li>
					            <li class="sm_3"><a href="../../member/login" class="">구독요리사<span class="icon"></span></a></li>
					            
					            <li class="sm_4"><a href="../../member/login" class="">정보수정<span class="icon"></span></a></li>
					            
					        </ul> 
					        </c:if>
					        <c:if test="${knickname!=null and empty sessionScope.userSession && sessionId==null}">
					        <a href="#" class="dp1" id="bb">마이페이지<span class="icon"></span></a>
							<ul class="dp2">
					            <li class="sm_1"><a href="../../member/join1" class="" id="bb">마이홈<span class="icon"></span></a></li>
					            <li class="sm_2"><a href="../../member/join1" class="" id="bb">스크랩레시피<span class="icon"></span></a></li>
					            <li class="sm_3"><a href="../../member/join1" class="" id="bb">구독요리사<span class="icon"></span></a></li>
					            
					            <li class="sm_4"><a href="../../member/join1" class="" id="bb">정보수정<span class="icon"></span></a></li>
					            
					        </ul> 
					        </c:if>
					        <c:if test="${sessionId!=null and empty sessionScope.userSession && kname==null}">
					             <a href="#" class="dp1" id="bb">마이페이지<span class="icon"></span></a>
							<ul class="dp2">
					            <li class="sm_1"><a href="../../member/join1" class="" id="bb">마이홈<span class="icon"></span></a></li>
					            <li class="sm_2"><a href="../../member/join1" class="" id="bb">스크랩레시피<span class="icon"></span></a></li>
					            <li class="sm_3"><a href="../../member/join1" class="" id="bb">구독요리사<span class="icon"></span></a></li>
					            
					            <li class="sm_4"><a href="../../member/join1" class="" id="bb">정보수정<span class="icon"></span></a></li>
					            
					        </ul>
					        </c:if>
						</li>
					</ul>
				</div>	
				
				<p class="cl"></p>
<script type="text/javascript">
$("#aa").on("click", function(e){
	e.preventDefault();
	alert("로그인을 먼저해주세요!");
	location.href = "../../member/login";
	
});
$("#bb").on("click", function(e){
	e.preventDefault();
	alert("가입을해주셔야합니다!");
	location.href = "../../member/join1";
	
});



$("#header .gnb_wrap .gnb .menu > li").mouseenter(function(){
	//$("#header .gnb_wrap .gnb .menu .dp2").addClass("on");
	$(this).find(".dp2").addClass("on");
	
}).mouseleave(function(){
	$(this).find(".dp2").removeClass("on");
});






</script>
			</div>
			<!-- <div class="all_wrap pc_hide">
			<a href="javascript:void(0)" class="all_btn js-toggle-nav va_wrap">
			<span class="va"></span><span class="va_tt"><i class="tt">Menu</i><i class="xi xi-bars"></i></span>
			</a></div> -->
		</div>


		
	</div>
	<!--header end-->
	