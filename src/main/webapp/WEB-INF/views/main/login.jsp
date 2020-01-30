<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<script type="text/javascript">
</script>

<style>
</style>

<div style="height: 400px; margin-top: 10em;">
	<!-- 아이디 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 14em; margin-top: 3em">
			<span style="font-size: 1.5em">아이디</span>
		</div>
		<div>
			<input type="text"
				style="width: 15em; position: relative; right: 2em; bottom: 2em;">
		</div>
	</div>
<!-- 아이디 -->
<!-- 패스워드 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 14em; margin-top: 1em">
			<span style="font-size: 1.5em">비밀번호</span>
		</div>
		<div>
			<input type="password"
				style="width: 15em; position: relative; right: 2em; bottom: 2em;">
		</div>
<!-- 패스워드 -->
	</div>
	<div
		style="position: relative; bottom: 10em; left: 11em; text-align: center;">
		<button style="width: 7em; height: 8em;">로그인</button>
	</div>
	<div align="center">
		<div
			style="text-align: center; position: relative; bottom: 7em; right: 5em; width: 10em">
			<button style="height: 2em; width: 10em;">ID/비밀번호 찾기</button>
		</div>
		<div
			style="text-align: center; position: relative; bottom: 9em; left: 9em; width: 11em">
			<button style="height: 2em; width: 10em;"
				onclick="location.href = 'join.html' ">회원가입</button>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>