<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" import="com.yj.domain.QnaListResult"%>

<%
	QnaListResult blr = (QnaListResult)request.getAttribute("listResult");
%>

<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "5";
String dp2 = "2"; 
%>
<%@ include file="../inc/top2.jsp" %> 
<div class="doc1">
<div class="box2">
<div class="board_search_wrap">
    <div class="board_search fl">
    
        <button type="button" class="search_btn write" onclick="location.href='/help/write'"><i class="xi xi-border-color"></i> 문의하기</button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
    </div>
   
</div>
<div class="board_search_wrap">
 
    </div>
<c:if test="${empty listResult}">
<ul class="board_faq">
	    <li class="article">
	    	<div class="qq">
	        	<a href="javascript:void(0)">
	                <span class="mark">Q.</span>
	                <span class="tt">내용이 입력됩니다.</span>
	                <span class="arrow"></span>
	            </a>
	        </div>
	        <div class="aa">
	        	<a href="javascript:void(0)">
	                <span class="mark">A.</span>
	                <div class="tt">내용</div>
	            </a>
	        </div>
	    </li>
	 
    </ul>
</c:if>
<c:forEach items="${listResult.list}" var="qna">    
	<ul class="board_faq">
	    <li class="article">
	    	<div class="qq">
	        	<a href="javascript:void(0)">
	                <span class="mark">Q.</span>
	                <span class="tt">${qna.content}</span>
	                <span class="arrow"></span>
	            </a>
	        </div>
	        <div class="aa">
	        	<a href="javascript:void(0)">
	                <span class="mark">A.</span>
	                <div class="tt">관리자의 답변이 입력됩니다.</div>
	            </a>
	        </div>
	    </li>

    </ul>
    </c:forEach>
    	<%
	long pageCount = blr.getTotalPageCount();
	int pageBlock = 10;
	int startPage = ((blr.getPage() - 1) / pageBlock) * pageBlock+1;
	int endPage = startPage + pageBlock - 1;
	
%>	
<div class="board_paging">
		<c:choose>
			<c:when test="${listResult.page == 1}">
			<div style="display:none">
			<button class="icon" onclick="javascript:location.href='/notice/list?cp=1'">1&#x000AB;</button>
			<button class="icon" onclick="javascript:location.href='/notice/list?cp=${listResult.page-1}'">&#x02039;</button>
			</div>
			</c:when>
			<c:otherwise>
			<button class="icon" onclick="javascript:location.href='/notice/list?cp=1'">&#x000AB;</button>
			<button class="icon" onclick="javascript:location.href='/notice/list?cp=${listResult.page-1}'">&#x02039;</button>
			</c:otherwise>
		</c:choose>
	<c:forEach begin="1" end="${listResult.totalPageCount}" var="i">	
		<c:choose>
			<c:when test="${i==listResult.page}">
			<button class="on">${i}</button>
			</c:when>
			<c:otherwise>
			<button onclick="javascript:location.href='/notice/list?cp=${i}'">${i}</button>	
			</c:otherwise>
		</c:choose>
	</c:forEach>
		<c:choose>
			<c:when test="${listResult.page == listResult.totalPageCount}">
			<div style="display:none">
			<button class="icon" onclick="javascript:location.href='/notice/list?cp=${listResult.page+1}'">2&#x0203A;</button>
			<button class="icon" onclick="javascript:location.href='/notice/list?cp=${listResult.totalPageCount}'">&#x000BB;</button>
			</div>
			</c:when>	
			<c:otherwise>
			<button class="icon" onclick="javascript:location.href='/notice/list?cp=${listResult.page+1}'">3&#x0203A;</button>
			<button class="icon" onclick="javascript:location.href='/notice/list?cp=${listResult.totalPageCount}'">&#x000BB;</button>
			</c:otherwise>
		</c:choose>	
	</div>
</div>
</div>
<script type="text/javascript">
$(".board_faq .qq").each(function(){
	var data = $(this).attr("data")
	if (data == "<?=$openIdx?>" ){
		$(this).next(".aa").slideDown()
		$(this).addClass("on")
	}
})
$(".board_faq .qq").click(function(){
	if($(this).next(".aa").css("display")=="none"){
		$(".board_faq .article .aa").slideUp()
		$(".board_faq .qq").removeClass("on")
		$(this).next(".aa").slideDown()
		$(this).addClass("on")
	}else{
		$(this).next(".aa").slideUp()
		$(this).removeClass("on")
	}
})
</script>

<%@ include file="../inc/footer.jsp" %>