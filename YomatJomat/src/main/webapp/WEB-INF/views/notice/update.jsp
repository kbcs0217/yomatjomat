<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" %>


<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "5";
String dp2 = "1"; 
%>
<%@ include file="../inc/top2.jsp" %> 
	<script>
	


</script>
<form name="updateForm" role="form" method="post" action="../notice/update"enctype="multipart/form-data">

<div class="doc1">
<div class="box2">






 
 
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="board_st write">
		  <col class="w_form_tit"/>
		  <col class="w_auto" />
		  <!-- <tr>
		    <th>작성자</th>
		    <td><input type="text" class="input_st iw1" name="email" readonly value='${board.email}'/></td>
		  </tr> 
		  <tr>
		    <th>추가기능</th>
		    <td><label class="label_st de"><input type="checkbox" /><i class="xi"></i><span>공지</span></label></td>
		  </tr>-->
		  
		  <input type="hidden" class="input_st iw 100" name="notice_no" value='${update.notice_no}'/>
		  
		  <tr> 
		    <th>제목</th>
		    <td><input type="text" class="input_st iw100" name="subject" value='${update.subject}'/></td>
		  </tr>
		  <tr>
		  	<td colspan="2" style="padding:0; border:none"><textarea id="ta"class="input_st tw1" name="content">${update.content}</textarea></td>
		  </tr>
		  <tr>
		  <th>작성일</th>
		  <td><input type="text" class="input_st iw100" name="ndate" value='${update.ndate}' disabled="true"/></td>
		  </tr>
		  
		  	  <tr>
		  	  
		  	  <c:forEach var="file" items="${file}">
		    <th>파일첨부</th>
		    <td>
		      
		    
		    <div class="form-group" id="file-list">
        
        <div class="file-group">
        <i class="xi xi-file-text-o"></i> ${file.OFNAME}</a>
            <input type="file" name="file">
        </div>
    </div>
    </c:forEach>
    <c:if test="${empty file}">
    	  <tr>
		    <th>파일첨부</th>
		    <td>
		    <div class="form-group" id="file-list">
        
        <div class="file-group">
            <input type="file" name="file" id="file">
        </div>
    </div>
		  </td>
		  </tr>
		  </c:if>
		
        
        
        
            
            
       
        
        
    
		 
		</table>
		<div class="board_btn_wrap ac wow_btn">
		    <input type="submit" value="수정" class="input_st s1 c1"  />
		    <!--  <input type="button" value="등록하기" class="input_st s1 c1" onclick="check()" />-->
		    <input type="button" class="input_st s1 c2 re" onclick="location.href='../notice/delete?notice_no=${update.notice_no}'"value="삭제">
		    <input type="button" value="이전화면" class="input_st s1 c2" onclick='history.back(-1); return false;' />
		</div>
		
	</div>
	
</div>

</div>
</form>
<script type="text/javascript">



<%@ include file="../inc/footer.jsp" %>