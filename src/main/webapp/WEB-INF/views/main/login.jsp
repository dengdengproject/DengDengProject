<!-- 2010.02.10 오후4:41 작성  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<script type="text/javascript">
		function loginConfirm() {
			var form = document.login;

			if (form.ID.value == null || form.ID.value == '') {
				alert("아이디를 입력해주세요.")
				form.ID.focus();
				return false;
			}

			if (form.PASSWORD1.value == null || form.PASSWORD1.value == '') {
				alert("비밀번호를 입력해주세요.")
				form.PASSWORD1.focus();
				return false;
			}
			form.action = "/first/loginResult";
			form.submit();
		}
		
		function findIdPw() {
			var form = document.login;

			form.action = "/first/findIdPw";
			form.submit();
		}
</script>

<style>
</style>
<form id="login" name="login" method="POST">
	<div style="height: 400px; margin-top: 10em;">
		<!-- 아이디 -->
		<div align="center">
			<div style="position: relative; right: 14em; margin-top: 3em">
				<span style="font-size: 1.5em">아이디</span>
			</div>
			<div
				style="width: 15em; position: relative; right: 2em; bottom: 2em;">
				<input type="text" id="ID" name="ID" placeHolder="아이디"
					class="loginInput">
			</div>
		</div>
		<!-- 아이디 -->
		<!-- 패스워드 -->
		<div style="text-align: center;">
			<div style="position: relative; right: 14em; margin-top: 1em">
				<span style="font-size: 1.5em">비밀번호</span>
			</div>
			<div>
				<input
					style="width: 15em; position: relative; right: 2em; bottom: 2em;"
					type="password" id="PASSWORD1" name="PASSWORD1" placeHolder="비밀번호"
					class="loginInput">
			</div>
		</div>
		<!-- 패스워드 -->
		<div align="center">
			<div
				style="position: relative; bottom: 10em; left: 11em; text-align: center; width: 7em">
				<button type="button" style="width: 7em; height: 8em;"
					class="loginBt" id="loginBt" onclick="loginConfirm()">로그인</button>
			</div>
			<div align="center">
				<div
					style="text-align: center; position: relative; bottom: 7em; right: 5em; width: 10em">
					<button style="height: 2em; width: 10em;"
						onclick="findIdPw()">ID/비밀번호 찾기</button>
				</div>
				<div
					style="text-align: center; position: relative; bottom: 9em; left: 9em; width: 11em">
					<button style="height: 2em; width: 10em;"
						onclick="location.href = 'join.html' ">회원가입</button>
				</div>
			</div>
		</div>
	</div>
</form>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>