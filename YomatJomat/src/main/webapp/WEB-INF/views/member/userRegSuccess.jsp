<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>환영합니다!</title>


<style>
* {
	font-family: "BMHANNAPro";
}
</style>

</head>
<body>

	<div style="margin: 100px;">
		 <br>
		<br>
		<h3>안녕하세요, ${param.email} 님</h3>
		<br>
		<p>환영합니다!</p>
		<br>
		<p>회원가입이 정상적으로 이루어 졌습니다.</p>
		<br>
		<p>로그인 하시면 홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</p>
		<br> <a href="${pageContext.request.contextPath}login">로그인 페이지로 이동하기</a>
	</div>

</body>
</html>