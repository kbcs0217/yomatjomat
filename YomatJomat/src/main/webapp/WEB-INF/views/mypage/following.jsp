<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" import="com.yj.domain.BoardListResult"%>

<%
	BoardListResult blr = (BoardListResult)request.getAttribute("listResult");
%>

<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "4";
String dp2 = "3";
%>
<%@ include file="../inc/top2.jsp" %>
<div class="doc4 doc5">
<div class="box1">	
	<div class="mypage_wrap">
		<div class="folder_new_btn">
			<a href=""><i class="xi-folder-add-o xi"></i>폴더만들기</a>
		</div>
		<ul class="folder_wrap following_wrap">
			<li>
				<div class="folder_box following_box" >
					<div onclick="location.href='/mypage/list'">
						<p class="nick"><img src="/images/no_man.jpg"></p>
						<p class="t1">닉네임</p><!-- 폴더명 길이 제한 -->
						<p class="t2">레시피<span>13</span></p>
					</div>
					<ul class="btn_box">
						<li><a href="#2" class="btn btn2">삭제</a></li>
					</ul>
				</div>
			</li>
			<li>
				<div class="folder_box following_box" >
					<div onclick="location.href='/mypage/list'">
						<p class="nick"><img src="/images/no_man.jpg"></p>
						<p class="t1">닉네임</p><!-- 폴더명 길이 제한 -->
						<p class="t2">레시피<span>13</span></p>
					</div>
					<ul class="btn_box">
						<li><a href="#2" class="btn btn2">삭제</a></li>
					</ul>
				</div>
			</li>
			<li>
				<div class="folder_box following_box" >
					<div onclick="location.href='/mypage/list'">
						<p class="nick"><img src="/images/no_man.jpg"></p>
						<p class="t1">닉네임</p><!-- 폴더명 길이 제한 -->
						<p class="t2">레시피<span>13</span></p>
					</div>
					<ul class="btn_box">
						<li><a href="#2" class="btn btn2">삭제</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>	
</div>
<script type="text/javascript">

</script>
</div>
<%@ include file="../inc/footer.jsp" %>