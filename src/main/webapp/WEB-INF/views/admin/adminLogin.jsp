<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<div style="height: 600px;">

	<div style="text-align: center; margin-top: 5em">
		<span style="font-size: 3em">관리자 로그인</span>
	</div>

	<!-- 아이디 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 10em; margin-top: 3em">
			<span style="font-size: 1.5em">아이디</span>
		</div>
		<div>
			<input type="text"
				style="width: 20em; position: relative; left: 4em; bottom: 2em;">
		</div>



	</div>
	<!-- 아이디 -->
	<!-- 패스워드 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 10em; margin-top: 1em">
			<span style="font-size: 1.5em">비밀번호</span>
		</div>
		<div>
			<input type="password"
				style="width: 20em; position: relative; left: 4em; bottom: 2em;">
		</div>
		<!-- 패스워드 -->


		<div
			style="position: relative; bottom: 10em; left: 19em; text-align: center;">
			<button style="width: 7em; height: 8em;">로그인</button>
		</div>
	</div>


</div>

<!-- 
    style="position: relative; left: 8em; margin-top: 2.5em;"
    -->



<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>