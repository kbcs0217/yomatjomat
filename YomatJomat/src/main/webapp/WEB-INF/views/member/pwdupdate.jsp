<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" %>
<%@ include file="../inc/god.jsp" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<form action="/member/pwdupdate" method="post">
<body class="login_wrap mem_wrap">

	<p class="mem_logo" onclick="location.href='../'">
		<img src="/images/m_logo.png">
	</p>
	<div class="login_wrapin">
		<div class="box1">
			<div class="login_box">
				<dl class="mem">
                    <dt class="tit"><span class="t1">비밀번호변경</span></dt>
                    <dd class="inp_wrap"><i class="xi xi-user-o"></i><input id="email" name="email" type="hidden" class="inp" value="${userSession.email}"></dd>
                    <dd class="inp_wrap"><i class="xi xi-lock-o"></i><input id="pwd" name="pwd" type="password" class="inp" placeholder="비밀번호를 입력하세요"></dd>
					<div class="form-group">
					<span class="font-weight-bold text-white bg-dark"
						id="spanLoginCheck"></span>
					</div>
					<div class="form-group">
			
				
				<!-- 네이버 로그인 창으로 이동 -->
			



					
                    <dd class="btn_wrap"><input id="loginBtn" type="submit" class="btn" value="회원정보확인"></dd>
               
                </dl>
			</div>
		</div>
	</div>

</body>
</form>


</html>