<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "5";
String dp2 = "1"; 
%>
<%@ include file="../inc/top2.jsp" %> 
<style>
/* 첨부파일을 드래그할 영역의 스타일 */
.fileDrop {
width: 600px;
height: 70px;
border: 2px dotted gray;
background-color: gray;
}
</style>


<form name="input" method="post" action="../notice/write" enctype="multipart/form-data">

<div class="doc1">
<div class="box2">



		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="board_st write"  onload="input.subject.focus()">
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
		  <tr> 
		    <th>제목</th>
		    <td><input type="text" class="input_st iw100" name="subject" id="subject"/></td>
		  </tr>
		  <tr>
		  	<td colspan="2" style="padding:0; border:none"><textarea class="input_st tw1" name="content" id="content"></textarea></td>
		  </tr>
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
		  
	 
		</table>
		<div class="board_btn_wrap ac wow_btn">
		    <button type="button"  class="input_st s1 c1" id="btnSave">등록</button>
		    
		    <input type="button" value="취소하기" class="input_st s1 c2" onclick='history.back(-1); return false;' />
		</div>
		
	</div>
	
</div>

</div>
</form>
<script>
	
	$(document).ready(function() {
		$("#btnSave").click(function(){

			            

			            var title = $("#subject").val();

			            var content = $("#content").val();

			            //var writer = $("#writer").val();

			            if(title == ""){

			                alert("제목을 입력하세요");

			                document.input.title.focus();

			                return;

			            }

			            if(content == ""){

			                alert("내용을 입력하세요");

			                document.input.content.focus();

			                return;

			            }

			        

			            document.input.submit();

			        });
	});

			    


		



		
	
</script>




<%@ include file="../inc/footer.jsp" %>