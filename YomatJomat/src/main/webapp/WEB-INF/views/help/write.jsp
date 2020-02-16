<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" %>


<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "5";
String dp2 = "1"; 
%>
<%@ include file="../inc/top2.jsp" %> 
<script>
	$(document).ready(function() {
		$("#btnSave").click(function(){
			            var content = $("#content").val();

			            //var writer = $("#writer").val();

			       

			            if(content == ""){

			                alert("내용을 입력하세요");

			                document.input.content.focus();

			                return;

			            }

			        

			            document.input.submit();

			        });
	});


</script>
<div class="doc1">
<form name="input" method="post" action="../help/write">

<div class="box2">
	
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="board_st write"  onload="input.subject.focus()">
		  <col class="w_form_tit"/>
		  <col class="w_auto" />
		  <tr>
		    <th>작성자</th>
		    <td><input type="text" class="input_st iw1" name="email" readonly value='${userSession.email}'/>
		    </td>
		  </tr> 
		
		 
		  <tr>
		  <th>문의내용</th>
		  	<td colspan="2" style="padding:0; border:none"><textarea class="input_st tw1" name="content" id="content"placeholder="문의사항을 자세하게 적어주세요~"></textarea></td>
		  </tr>
		
		</table>
		<div class="board_btn_wrap ac wow_btn">
		    <button type="button" value="등록하기" class="input_st s1 c1"id="btnSave">등록하기</button>
		    <input type="button" value="취소하기" class="input_st s1 c2" onclick='history.back(-1); return false;' />
		</div>
	</div>
	</form>
</div>

<script type="text/javascript">

</script>

<%@ include file="../inc/footer.jsp" %>