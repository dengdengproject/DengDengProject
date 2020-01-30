<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>


<div style="height: 700px; margin-top: 6em;">
	<div style="text-align: center;">
		<div style="position: relative; right: 18em; margin-top: 3em">
			<span style="font-size: 1.5em">이름 :</span>
		</div>
		<div>
			<input type="text" placeholder="이름을 입력해주세요."
				style="width: 30em; position: relative;; bottom: 2em;">
		</div>
	</div>
	<div style="text-align: center;">
		<div style="position: relative; right: 18.9em; margin-top: 0.5em">
			<span style="font-size: 1.5em">연락처 : </span>
		</div>
		<div>
			<input type="password" placeholder="가입하셨을 떄 사용한 연락처를 입력해주세요."
				style="width: 30em; position: relative;; bottom: 2em;">
		</div>
	</div>
	<div style="text-align: center; position: relative;">
		<button style="height: 3em; width: 10em;">ID 찾기</button>
	</div>
	<div align="center" style="margin-top: 5em;">
		<hr width="55%">
	</div>
	<div style="text-align: center; margin-top: 5em">
		<div style="position: relative; right: 17em; margin-top: 3em">
			<span style="font-size: 1.5em">ID :</span>
		</div>
		<div>
			<input type="text" placeholder="ID을 입력해주세요."
				style="width: 30em; position: relative;; bottom: 2em;">
		</div>
	</div>
	<div style="text-align: center;">
		<div style="position: relative; right: 19.2em; margin-top: 0.5em">
			<span style="font-size: 1.5em">생년월일 : </span>
		</div>
		<div>
			<input type="password" placeholder="생년월일 8자리를 입력해주세요. (예. 19900112)"
				style="width: 30em; position: relative; bottom: 2em;">
		</div>
	</div>
	<div style="text-align: center;">
		<div style="position: relative; right: 18.5em; margin-top: 0.5em">
			<span style="font-size: 1.5em">연락처 : </span>
		</div>
		<div>
			<input type="password" placeholder="연락처를 입력해주세요. (예. 000-0000-0000)"
				style="width: 30em; position: relative; bottom: 2em;">
		</div>
	</div>
	<div style="text-align: center; position: relative;">
		<button style="height: 3em; width: 10em;">비밀번호 찾기</button>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>