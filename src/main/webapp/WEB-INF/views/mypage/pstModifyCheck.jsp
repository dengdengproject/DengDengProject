<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-mypst-menu.jspf"%>

<!-- 본인확인 -->
<div style="height: 400px; border-top: solid;">
	<div style="text-align: center; margin-top: 4em;">
		<span style="font-weight: bold; font-size: 2em;">회원 정보 수정</span>
	</div>

	<div style="text-align: center; margin-top: 2em;">
		<span style="">본인 확인을 위해 비밀번호를 입력해주세요.</span>
	</div>

	<div style="text-align: center; margin-top: 2em">
		<div>
			<span style="font-weight: bold; font-size: 1.2em"> 비밀번호 :</span> <input
				type="password" style="margin-left: 2em; width: 20em">
		</div>
	</div>

	<div
		style="text-align: center; margin-top: 1em; position: relative; left: 10.3em">
		<button style="width: 7em; height: 3em;">확 인</button>
	</div>
</div>
<!-- 본인확인 -->

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>