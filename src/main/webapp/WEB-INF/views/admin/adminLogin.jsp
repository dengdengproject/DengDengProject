<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<script type="text/javascript">
	function adminLoginConfirm() {
		var form = document.adminLogin;

		if (form.ADMIN_ID.value == null || form.ADMIN_ID.value == '') {
			alert("아이디를 입력해주세요.")
			form.ADMIN_ID.focus();
			return false;
		}

		if (form.ADMIN_PW.value == null || form.ADMIN_PW.value == '') {
			alert("비밀번호를 입력해주세요.")
			form.ADMIN_PW.focus();
			return false;
		}
		form.action = "/first/adminLoginResult";
		form.submit();
	}
</script>


<div style="height: 600px;">
	<div style="text-align: center; margin-top: 5em">
		<span style="font-size: 3em">관리자 로그인</span>
	</div>
	<form id="adminLogin" name="adminLogin" method="POST">
		<!-- 아이디 -->
		<div align="center">
			<div style="position: relative; right: 10em; margin-top: 3em">
				<span style="font-size: 1.5em">아이디</span>
			</div>
			<div style="width: 20em; position: relative; left: 4em; bottom: 2em;">
				<input type="text" id="ADMIN_ID" name="ADMIN_ID" placeholder="아이디"
					class="adminLoginInput">
			</div>
		</div>
		<!-- 아이디 -->
		<!-- 패스워드 -->
		<div style="text-align: center;">
			<div style="position: relative; right: 10em; margin-top: 1em">
				<span style="font-size: 1.5em">비밀번호</span>
			</div>
			<div>
				<input
					style="width: 20em; position: relative; left: 4em; bottom: 2em;"
					type="password" id="ADMIN_PW" name="ADMIN_PW" placeholder="비밀번호"
					class="adminLoginInput">
			</div>
		</div>
		<!-- 패스워드 -->
		<div align="center">
			<div
				style="position: relative; bottom: 10em; left: 19em; text-align: center; width: 7em; height: 8em;">
				<button type="button" style="width: 7em; height: 8em;"
					class="adminLoginBt" id="adminLoginBt"
					onclick="adminLoginConfirm()">로그인</button>
			</div>
		</div>
</form>
</div>
<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>