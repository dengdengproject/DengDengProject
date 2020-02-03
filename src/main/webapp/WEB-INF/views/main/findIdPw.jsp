<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<script type="text/javascript">
	function fIdsubmit() {
		var formID = document.formId;
		
		if(formID.ID_NAME.value == null || formID.ID_NAME.value == '') {
			alert("이름을 입력해주세요.")
			formID.ID_NAME.focus();
			return false;
		}
		
		if(formID.ID_PHONE.value == null || formID.ID_PHONE.value == '') {
			alert("연락처를 입력해주세요.")
			formID.ID_PHONE.focus();
			return false
		}
		formID.submit();
	}
	
	function fPwsubmit() {
		var formPW = document.formPw;
		
		if(formPW.PW_ID.value == null || formPW.PW_ID.value == '') {
			alert("이름을 입력해주세요.")
			formPW.PW_ID.focus();
			return false;
		}
		
		if(formPW.PW_BIRTHDAY.value == null || formPW.PW_BIRTHDAY.value == '') {
			alert("연락처를 입력해주세요.")
			formPW.PW_BIRTHDAY.focus();
			return false
		}
		
		if(formPW.PW_PHONE.value == null || formPW.PW_PHONE.value == '') {
			alert("연락처를 입력해주세요.")
			formPW.PW_PHONE.focus();
			return false
		}
		formPW.submit();
	}
</script>

<body>
	<div style="height: 700px; margin-top: 6em;">

		<div class="findId">
			<form id="formId" name="formID" method="post" action="findIdResult">
				<div style="text-align: center;">
					<div style="position: relative; right: 18em; margin-top: 3em">
						<span style="font-size: 1.5em">이름 :</span>
					</div>
					<div>
						<input type="text" name="ID_NAME" id="ID_NAME" placeholder="이름을 입력해주세요."
							style="width: 30em; position: relative;; bottom: 2em;">
					</div>
				</div>

				<div align = "center">
					<div style="position: relative; right: 18.9em; margin-top: 3em">
						<span style="font-size: 1.5em">연락처 : </span>
					</div>
					<div>
						<input type="text" id="ID_PHONE" name="ID_PHONE"
							placeholder="연락처를 입력해주세요."
							style="width: 30em; position: relative;; bottom: 2em;">
					</div>
				</div>
			</form>

			<div style="text-align: center; position: relative;">
				<a href="#" onclick="fIdsubmit();"><button
						style="height: 3em; width: 10em;">ID 찾기</button></a>
			</div>
		</div>

		<div align="center" style="margin-top: 5em;">
			<hr width="55%">
		</div>

		<form id="formPw" name="formPw" method="post" action="findPwResult">
			<div style="text-align: center; margin-top: 5em">
				<div style="position: relative; right: 17em; margin-top: 3em">
					<span style="font-size: 1.5em">ID :</span>
				</div>
				<div>
					<input type="text" name="PW_ID" id="PW_ID" placeholder="ID를 입력해주세요."
						style="width: 30em; position: relative;; bottom: 2em;">
				</div>
			</div>

			<div style="text-align: center;">
				<div style="position: relative; right: 19.2em; margin-top: 0.5em">
					<span style="font-size: 1.5em">생년월일 : </span>
				</div>
				<div>
					<input type="text" name="PW_BIRTHDAY" id="PW_BIRTHDAY"
						placeholder="생년월일 8자리를 입력해주세요. (예. 19900112)"
						style="width: 30em; position: relative;; bottom: 2em;">
				</div>
			</div>

			<div style="text-align: center;">
				<div style="position: relative; right: 18.5em; margin-top: 0.5em">
					<span style="font-size: 1.5em">연락처 : </span>
				</div>
				<div>
					<input type="text" name="PW_PHONE" id="PW_PHONE"
						placeholder="연락처를 입력해주세요. (예. 000-0000-0000)"
						style="width: 30em; position: relative;; bottom: 2em;">
				</div>
			</div>
		</form>

		<div style="text-align: center; position: relative;">
			<a href="#" onclick="fPwsubmit();"><button
					style="height: 3em; width: 10em;">비밀번호 찾기</button></a>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

	<div
		style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-bottom-collapse: separate;"></div>
	<script type="text/javascript">
		WebFontConfig = {
			google : {
				families : [ 'Open+Sans', 'Open+Sans:700' ]
			}
		};
		(function() {
			var wf = document.createElement('script');
			wf.src = ('https:' == document.location.protocol ? 'https' : 'http')
					+ '://ajax.googleapis.com/ajax/libs/webfont/1.0.31/webfont.js';
			wf.type = 'text/javascript';
			wf.async = 'true';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(wf, s);
		})();
	</script>
</body>

</html>