<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>
<script type="text/javascript" src="resources/js/common.js"></script>
 
<c:if test="${res==0}">
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${res==1}">
	<div style="text-align: center; margin-top: 4em">
		<span style="font-size: 2em; font-weight: bold;">회원탈퇴가 완료되었습니다.</span>
		<button type="button" onclick="location.href='main'">메인으로</button>
	</div>
</c:if>



<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>