<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" import="com.yj.domain.NoticeListResult"
%>

<%
	NoticeListResult blr = (NoticeListResult)request.getAttribute("listResult");
%>



<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "5";
String dp2 = "1"; 
%>
<%@ include file="../inc/top2.jsp" %> 
<div class="doc1">
<div class="box2">
<div class="board_search_wrap">
<c:if test="${not empty sessionScope.admin}">
    <div class="board_search fl">
        <button type="button" class="search_btn write" onclick="location.href='/notice/write'"><i class="xi xi-border-color"></i> 글쓰기</button>
    </div>
</div>
</c:if>


    <div class="board_search fl">
        <button type="button" class="search_btn write" onclick="location.href='/notice/write'"><i class="xi xi-border-color"></i> 글쓰기</button>
    </div>
</div>

 
<c:if test="${empty listResult}">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="board_st list tit">
	<tr>
	    <th class="w_no">No.</th>
	    <th class="w_tit">제목</th>
	    <th class="w_name">작성자</th>
	    <th class="w_date">등록일</th>
	   
	  </tr>
	</table>
</c:if>
    
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="board_st list tit">
	  <col class="w_no" />
	  <col class="w_tit" />
	  <col class="w_name" />
	  <col class="w_date" />
	  
	  <tr>
	    <th class="w_no">No.</th>
	    <th class="w_tit">제목</th>
	    <th class="w_name">작성자</th>
	    <th class="w_date">등록일</th>
	   
	  </tr>
	</table>
	<c:forEach items="${listResult.list}" var="notice">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="board_st list notice">
	  <col class="w_no" />
	  <col class="w_tit" />
	  <col class="w_name" />
	  <col class="w_date" />
	  
		<tbody>
			<tr>
		        <td class="w_no"><c:out value='${notice.notice_no}'></c:out></td>
		        <td class="w_tit"><a href="/notice/content?notice_no=${notice.notice_no}">${notice.subject}</a></td>
		   		<td class="w_name">관리자</td>
		    	<td class="w_date">${notice.ndate}</td>
		    </tr>
		</tbody>
	</table>
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

</script>

<%@ include file="../inc/footer.jsp" %>