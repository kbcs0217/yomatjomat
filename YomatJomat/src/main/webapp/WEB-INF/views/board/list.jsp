<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="false" import="com.yj.domain.BoardListResult"%>

<%
	BoardListResult blr = (BoardListResult)request.getAttribute("listResult");
%>

<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "3";
String dp2 = "1";
%>
<%@ include file="../inc/top2.jsp" %>
<div class="doc doc4">
<div class="box2">
	<div class="board_top">
		<p class="board_top_l">총 <span>${listResult.totalCount}</span>개의 와글와글 요리톡이 있습니다</p> 
		<p class="board_top_r">
			<a href="/board/write">글쓰기</a>
		</p> 
	</div>
	<ul class="board_wrap">
	<c:if test="">
	</c:if>
	<c:forEach items="${listResult.list}" var="board">
		<li> 
			<div class="board_wrap_in" onclick="location.href='/board/content/'"> 
				<p class="board_wrap_l">
					<img src="/images/no_man.jpg">
				</p>
				<dl class="board_wrap_r">
					<dd class="board_wrap_r1">
						<a class="nick_wrap">${board.nickName}<span>${board.wdate}</span></a>
						<p class="nick_r_wrap">
							<span><i class="xi xi-heart-o"></i>10</span>
							<span><i class="xi xi-speech-o"></i>21</span>
						</p>
					</dd>
					<dd class="board_wrap_r2">
						<!-- 노출 텍스트 수 자르기 -->
						<p class="txt">${board.content}</p>
						<p class="main_img">
							<span class="img_resize_step"><img src="/images/talk_eximg.jpg"></span>
						</p>
					</dd>
				</dl>
			</div>
		</li>
	</c:forEach>	
	</ul>
<%
	long pageCount = blr.getTotalPageCount();
	int pageBlock = 10;
	int startPage = ((blr.getPage() - 1) / pageBlock) * pageBlock+1;
	int endPage = startPage + pageBlock - 1;
	//if(endPage > pageCount) {
	//	endPage = (int)pageCount;
	//}
%>	
	<div class="board_paging">
		<c:choose>
			<c:when test="${listResult.page == 1}">
			<div style="display:none">
			<button class="icon" onclick="javascript:location.href='/board/list?cp=1'">1&#x000AB;</button>
			<button class="icon" onclick="javascript:location.href='/board/list?cp=${listResult.page-1}'">&#x02039;</button>
			</div>
			</c:when>
			<c:otherwise>
			<button class="icon" onclick="javascript:location.href='/board/list?cp=1'">&#x000AB;</button>
			<button class="icon" onclick="javascript:location.href='/board/list?cp=${listResult.page-1}'">&#x02039;</button>
			</c:otherwise>
		</c:choose>
	<c:forEach begin="<%= startPage %>" end="${listResult.totalPageCount}" var="i">	
		<c:choose>
			<c:when test="${i==listResult.page}">
			<button class="on">${i}</button>
			</c:when>
			<c:otherwise>
			<button onclick="javascript:location.href='/board/list?cp=${i}'">${i}</button>	
			</c:otherwise>
		</c:choose>
	</c:forEach>
		<c:choose>
			<c:when test="${listResult.page == listResult.totalPageCount}">
			<div style="display:none">
			<button class="icon" onclick="javascript:location.href='/board/list?cp=${listResult.page+1}'">2&#x0203A;</button>
			<button class="icon" onclick="javascript:location.href='/board/list?cp=${listResult.totalPageCount}'">&#x000BB;</button>
			</div>
			</c:when>	
			<c:otherwise>
			<button class="icon" onclick="javascript:location.href='/board/list?cp=${listResult.page+1}'">3&#x0203A;</button>
			<button class="icon" onclick="javascript:location.href='/board/list?cp=${listResult.totalPageCount}'">&#x000BB;</button>
			</c:otherwise>
		</c:choose>	
	</div>
</div>
<script type="text/javascript">
imgResize_step();
</script>
</div>
<%@ include file="../inc/footer.jsp" %>
