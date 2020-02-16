<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="true" import="com.yj.domain.BoardListResult"%>


<script type="text/javascript">
//<![CDATA[
$(document).ready(function(){ 
	var f = "<%=dp3%>";
	$(".mypage_wrap .mp_t_btn li"+" .ssm_"+f).addClass("on");
});
//]]>
</script>
 