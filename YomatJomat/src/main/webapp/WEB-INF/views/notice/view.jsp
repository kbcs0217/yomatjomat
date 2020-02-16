<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" %>


<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "5";
String dp2 = "1"; 
%>
<%@ include file="../inc/top2.jsp" %> 
<script type="text/javascript">
function fn_fileDown(notice_no){
	var formObj = $("form[name='readForm']");
	$("#NOTICE_NO").attr("value", notice_no);
	formObj.attr("action", "/notice/fileDown");
	formObj.submit();
}
</script>
<div class="doc1">
<div class="box2">

	<form name="readForm" role="form" method="post" enctype="multipart/form-data">
					
			 
			<input type="hidden" id="OFNAME" name="OFNAME" value="">
			<input type="hidden" id="NOTICE_NO" name="NOTICE_NO" value="">
		</form>
		
	<div class="board_view_top">
		
		<p class="tit">${notice.subject}</p>
	    <ul class="info">
	    
	    	<li>작성자 : 관리자</li>
	        <li>작성일 : ${notice.ndate}</li>
	    </ul>
	    
	    <c:forEach var="file" items="${file}">
	    
	    <a href="#" onclick="fn_fileDown('${file.NOTICE_NO}'); return false;"><i class="xi xi-file-text-o"></i> ${file.OFNAME}</a>
	    </c:forEach>
	    
	    
	    <p class="cl"></p>
	</div>
	<div class="board_view_middle">
		${notice.content}
	</div>

	<div class="board_view_bottom">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="board_st view">
	      <col class="w_form_tit"/>
	      <col class="w_auto" />
	   
	    </table>
	</div>

	<div class="board_btn_wrap">
		<button type="button" class="input_st s1 c2 re" onclick="location.href='../notice/update?notice_no=${notice.notice_no}'">수정하기</button>

	    <input type="button" class="input_st s1 c2 re" onclick="location.href='../notice/delete?notice_no=${notice.notice_no}'"value="삭제">
	    
	    
	    <input type="button" value="목록으로" class="input_st s1 c2 re b_c1" onclick="javascript:location.href='/notice/list?cp=1'" />
	</div>
	
</div>
</div>


<%@ include file="../inc/footer.jsp" %>