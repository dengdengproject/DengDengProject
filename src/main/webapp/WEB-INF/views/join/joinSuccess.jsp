<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<div style="height: 400px; margin-top: 10em;">
	<div style="text-align: center">
		<span style="font-weight: bold; font-size: 3em">가입을 축하드립니다!</span>
	</div>
	<div style="text-align: center; margin-top: 3em">
		<button style="width: 14em; height: 3em" class="btn_style" onclick="location.href = 'login'">로그인 페이지로 돌아가기</button>
	</div>
</div> 

<style>
.btn_style {
	background: #5483EC;
	color: #fff;
	font-weight: bold;
	border-radius: 20px;
	transition: 0.4s;
	border: none;
}

.btn_style:hover {
	cursor: pointer;
	background: #0B2564;
}

</style>


<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>