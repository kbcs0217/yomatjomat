<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" %>


<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	request.getSession().setAttribute("email",email);
%>

<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>Home</title>
	
</head>
<body>


    <c:if test="${kname!=null and empty sessionScope.userSession && sessionId==null}">
        <h1>카카오로그인 성공입니다</h1>
        <h3>'${kname}'님 환영합니다!!</h3>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}member/logout.do"><i class="fa fa-unlock-alt" aria-hidden="true"></i>로그아웃</a></li>
    </c:if>

	<c:if test="${sessionId!=null and empty sessionScope.userSession && kname==null}">
		<h2>네이버 아이디 로그인 성공!!</h2>
		<h3>'${sessionId}'님 환영합니다!</h3>
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}member/logout.do"><i class="fa fa-unlock-alt" aria-hidden="true"></i>로그아웃</a></li>
		</c:if>
		
		
		
<c:if test="${not empty sessionScope.userSession and sessionId==null && kname==null}">
		<h3>안녕하세요. ${sessionScope.userSession.email}님!</h3>
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}member/logout.do"><i class="fa fa-unlock-alt" aria-hidden="true"></i>로그아웃</a></li>
		</c:if>
		







<h1>
	Hello world!  
</h1>


<P>  The time on the server is ${serverTime}. </P>
	<a href="notice/list">공지사항</a>
	<a href="help/list">레시피</a>
	<br><br>
	<a href="ranking/list">랭킹</a>
	<a href="recipe/list">레시피</a>
	<a href="board/list">게시판</a>
	<br><br>
	<a href="mypage/list">마이페이지</a>
	
	<a href="main/">메인</a>

	
	<a href="member/login">로그인</a>
	<a href="member/signup">회원가입</a>

	
	

</body>
<script>
//실시간 세션 확인
var sessionConfirm = setInterval(function (){
	
	$.ajax({				
		url: '${pageContext.request.contextPath}member/redundantout', 
		type: 'get',
		
		success:function(data){
			console.log("실시간 세션 확인중 : [ " + data + " ]") 
							
			if(data == -1){
				alert('다른 기기에서 로그인 되었습니다');
				location.href="${pageContext.request.contextPath}/";
			}
		} // end success  
	}); // end ajax
}, 1000);
</script>
</html>
