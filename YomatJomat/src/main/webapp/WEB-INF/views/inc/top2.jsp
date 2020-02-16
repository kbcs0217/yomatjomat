<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" %>

		<div class="lnb_wrap">
			<div class="s_visual_wrap"></div>  
			<div class="gnb">
			<div class="box1">
				<ul class="menu">
					<li class="m_1">
						<a href="recipe/list" class="dp1">레시피<span class="icon"></span></a>
						<ul class="dp2">
				            <li class="sm_1"><a href="recipe/list">추천레시피<span class="icon"></span></a></li>
				            <li class="sm_2"><a href="">최신레시피<span class="icon"></span></a></li>
				            <li class="sm_3"><a href="">방송레시피<span class="icon"></span></a></li>
				        </ul>   
					</li>
					<li class="m_2">
						<a href="ranking/list" class="dp1">랭킹<span class="icon"></span></a>
						<ul class="dp2">
				            <li class="sm_1"><a href="">인기레시피<span class="icon"></span></a></li>
				            <li class="sm_2"><a href="">열혈요리사<span class="icon"></span></a></li>
				        </ul>  
					</li>
					<li class="m_3">
						<a href="./sub/1_1.jsp" class="dp1">요리톡<span class="icon"></span></a>
					</li>
					<li class="m_4">
					<c:if test="${not empty sessionScope.userSession and sessionId==null && kname==null}">
						<a href="./sub/1_1.jsp" class="dp1">마이페이지<span class="icon"></span></a>
						</c:if>
						<ul class="dp2">
						<c:if test="${not empty sessionScope.userSession and sessionId==null && kname==null}">
				            <li class="sm_1"><a href="/mypage/list" class="">마이홈<span class="icon"></span></a></li>
				            <li class="sm_2"><a href="/mypage/scrap" class="">스크랩레시피<span class="icon"></span></a></li>
				            <li class="sm_3"><a href="/mypage/following" class="">구독요리사<span class="icon"></span></a></li>
				            <li class="sm_4"><a href="/member/infocheck" class="">정보수정<span class="icon"></span></a></li>
				            </c:if>
				            <c:if test="${sessionId!=null and empty sessionScope.userSession && kname==null}">
				            <li class="sm_1"><a href="#" class="" id="aa">마이홈<span class="icon"></span></a></li>
				            <li class="sm_2"><a href="#" class="" id ="aa">스크랩레시피<span class="icon"></span></a></li>
				            <li class="sm_3"><a href="#" class="" id="aa">구독요리사<span class="icon"></span></a></li>
				            <li class="sm_4"><a href="#" class="" id="aa">정보수정<span class="icon"></span></a></li>
				            </c:if>
				            <c:if test="${kname!=null and empty sessionScope.userSession && sessionId==null}">
				            <li class="sm_1"><a href="#" class="" id="aa">마이홈<span class="icon"></span></a></li>
				            <li class="sm_2"><a href="#" class="" id ="aa">스크랩레시피<span class="icon"></span></a></li>
				            <li class="sm_3"><a href="#" class="" id="aa">구독요리사<span class="icon"></span></a></li>
				            <li class="sm_4"><a href="#" class="" id="aa">정보수정<span class="icon"></span></a></li>
				            </c:if>
				        </ul>   
					</li>
					<li class="m_5">
                  <a href="./sub/1_1.jsp" class="dp1">공지<span class="icon"></span></a>
                  <ul class="dp2">
                        <li class="sm_1"><a href="/notice/list" class="">공지<span class="icon"></span></a></li>
                        <c:if test="${not empty sessionScope.userSession}">
                        <li class="sm_2"><a href="/help/list" class="">문의<span class="icon"></span></a></li>
                        </c:if>
                        <c:if test="${sessionId!=null and empty sessionScope.userSession && knickname==null}">
                        <li class="sm_2"><a href="../../member/join1" class="" id= "aa" >문의<span class="icon"></span></a></li>
                        </c:if>
                        <c:if test="${knickname!=null and empty sessionScope.userSession && sessionId==null}">
                        <li class="sm_2"><a href="../../member/join1" class="" id= "aa" >문의<span class="icon"></span></a></li>
                        </c:if>
                    </ul>   
               </li>
				</ul>
				</div>
			</div>
		</div>		
		
<script type="text/javascript">

$("#aa").on("click", function(e){
	e.preventDefault();
	alert("가입을해주셔야합니다!");
	location.href = "../../member/join1";
	
});










</script>